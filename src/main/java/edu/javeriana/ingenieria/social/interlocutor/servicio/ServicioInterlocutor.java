package edu.javeriana.ingenieria.social.interlocutor.servicio;

import edu.javeriana.ingenieria.social.interlocutor.dominio.Interlocutor;
import edu.javeriana.ingenieria.social.interlocutor.repositorio.RepositorioInterlocutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicioInterlocutor {
    @Autowired
    private RepositorioInterlocutor repositorio;

    public List<Interlocutor> obtenerInterlocutores(){
        return repositorio.findAll();
    }

    public Interlocutor obtenerInterlocutor(Integer cedula){
        return repositorio.findOneByCedula(cedula);
    }

    public Interlocutor crearInterlocutor(Interlocutor interlocutor){
        return repositorio.save(interlocutor);
    }

    public Interlocutor actualizarInterlocutor(Integer id, Interlocutor interlocutor){
        if(!interlocutorExiste(id)){
            return null;
        }
        interlocutor.setId(id);
        return repositorio.save(interlocutor);
    }

    public Interlocutor borrarInterlocutor(Integer id){
        Interlocutor aux = repositorio.findById(id).orElse(null);
        if(aux == null){
            return null;
        }
        repositorio.delete(aux);
        return aux;
    }

    public boolean interlocutorExiste(Integer id){
        return repositorio.existsById(id);
    }

    public boolean interlocutorExistePorCedula(Integer cedula){
        return repositorio.existsByCedula(cedula);
    }
}
