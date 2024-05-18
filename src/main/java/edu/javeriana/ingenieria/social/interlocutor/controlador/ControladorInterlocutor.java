package edu.javeriana.ingenieria.social.interlocutor.controlador;

import edu.javeriana.ingenieria.social.interlocutor.dominio.Interlocutor;
import edu.javeriana.ingenieria.social.interlocutor.servicio.ServicioInterlocutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/interlocutores")
@CrossOrigin(origins="http://localhost:4200")
public class ControladorInterlocutor {
    @Autowired
    private ServicioInterlocutor servicio;

    @GetMapping("listar")
    public List<Interlocutor> obtenerInterlocutores() {
        return servicio.obtenerInterlocutores();
    }

    @GetMapping("obtener")
    public ResponseEntity<Interlocutor> obtenerInterlocutor(@RequestParam Integer cedula){
        if(cedula == null){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        if(!servicio.interlocutorExistePorCedula(cedula)){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(servicio.obtenerInterlocutor(cedula), HttpStatus.OK);
    }

    @PostMapping("crear")
    public ResponseEntity<Interlocutor> crearInterlocutor(@RequestBody Interlocutor interlocutor){
        if(interlocutor == null){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        if(servicio.interlocutorExistePorCedula(interlocutor.getCedula()) || servicio.interlocutorExiste(interlocutor.getId())){
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
        return new ResponseEntity<>(servicio.crearInterlocutor(interlocutor), HttpStatus.CREATED);
    }

    @PutMapping("actualizar")
    public ResponseEntity<Interlocutor> actualizarInterlocutor(@RequestParam Integer id, @RequestBody Interlocutor interlocutor){
        if(id == null || interlocutor == null || !id.equals(interlocutor.getId())){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        if(servicio.actualizarInterlocutor(id, interlocutor) == null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(interlocutor, HttpStatus.OK);
    }

    @DeleteMapping("eliminar")
    public ResponseEntity<HttpStatus> borrarInterlocutor(@RequestParam Integer id){
        if(id == null){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        if(servicio.borrarInterlocutor(id) == null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
