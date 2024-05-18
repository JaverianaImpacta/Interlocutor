package edu.javeriana.ingenieria.social.interlocutor.repositorio;

import edu.javeriana.ingenieria.social.interlocutor.dominio.Interlocutor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioInterlocutor extends JpaRepository<Interlocutor, Integer> {
    Interlocutor findOneByCedula(Integer cedula);

    boolean existsByCedula(Integer cedula);
}
