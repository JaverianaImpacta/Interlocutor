package edu.javeriana.ingenieria.social.interlocutor;

import edu.javeriana.ingenieria.social.interlocutor.controlador.ControladorInterlocutor;
import edu.javeriana.ingenieria.social.interlocutor.dominio.Interlocutor;
import edu.javeriana.ingenieria.social.interlocutor.servicio.ServicioInterlocutor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;

import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.springframework.boot.test.autoconfigure.jdbc.JdbcTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
public class ControladorInterlocutorTest {

	@Autowired
	private ControladorInterlocutor controladorInterlocutor;

	@Autowired
	private ServicioInterlocutor servicioInterlocutor;

	@Autowired
	private MockMvc mockMvc;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@BeforeEach
	public void limpiarYRecargarBaseDatos() throws SQLException {
		// Leer el script SQL desde el archivo
		ClassPathResource resource = new ClassPathResource("Script.sql");
		ScriptUtils.executeSqlScript(jdbcTemplate.getDataSource().getConnection(), resource);
		resource = new ClassPathResource("Inserts-Prueba.sql");
		ScriptUtils.executeSqlScript(jdbcTemplate.getDataSource().getConnection(), resource);
	}
	@Test
	public void testObtenerInterlocutores() throws Exception {

		mockMvc.perform(get("/api/interlocutores/listar"))
				.andExpect(status().isOk())
				.andExpect(MockMvcResultMatchers.jsonPath("$.length()").value(3));
	}

	@Test
	public void testObtenerInterlocutor() {
		ResponseEntity<Interlocutor> response = controladorInterlocutor.obtenerInterlocutor(8888888);
		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertEquals(8888888, response.getBody().getCedula());
	}

	@Test
	public void testCrearInterlocutor() {
		// Crear un nuevo interlocutor
		Interlocutor interlocutor = new Interlocutor();
		interlocutor.setCedula(9876543);
		interlocutor.setCargo("Nuevo Cargo");
		interlocutor.setId(4);
		// Llamar al controlador para crear el interlocutor
		ResponseEntity<Interlocutor> response = controladorInterlocutor.crearInterlocutor(interlocutor);

		// Verificar que la solicitud fue exitosa (código 201)
		assertEquals(HttpStatus.CREATED, response.getStatusCode());

		// Verificar que la cédula del interlocutor creado sea la misma que la cédula que proporcionamos
		assertEquals(9876543, response.getBody().getCedula());
	}


	@Test
	public void testActualizarInterlocutor() {
		Interlocutor interlocutor = new Interlocutor();
		interlocutor.setCedula(9876543);
		interlocutor.setCargo("Tester");
		servicioInterlocutor.crearInterlocutor(interlocutor);

		ResponseEntity<Interlocutor> response = controladorInterlocutor.actualizarInterlocutor(interlocutor.getId(), interlocutor);
		assertEquals(HttpStatus.OK, response.getStatusCode());
		assertEquals("Tester", response.getBody().getCargo());
	}

	@Test
	public void testBorrarInterlocutor() {
		Interlocutor interlocutor = new Interlocutor();
		interlocutor.setCedula(9876543);
		interlocutor.setCargo("Cargo");
		servicioInterlocutor.crearInterlocutor(interlocutor);

		ResponseEntity<HttpStatus> response = controladorInterlocutor.borrarInterlocutor(interlocutor.getId());
		assertEquals(HttpStatus.NO_CONTENT, response.getStatusCode());
	}
}
