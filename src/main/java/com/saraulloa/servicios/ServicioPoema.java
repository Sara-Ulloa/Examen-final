package com.saraulloa.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.saraulloa.modelos.Poema;
import com.saraulloa.modelos.Usuario;
import com.saraulloa.repositorios.RepositorioPoema;

import jakarta.validation.Valid;

@Service
public class ServicioPoema {
	
	@Autowired
	private final RepositorioPoema repositorioPoema;
	
	public ServicioPoema(RepositorioPoema repositorioPoema) {
		this.repositorioPoema = repositorioPoema;
	}
	
	public List<Poema> obtenerTodos(){
		return this.repositorioPoema.findAll();
	}
	
	public Poema agregarUno(Poema nuevoPoema) {
		return this.repositorioPoema.save(nuevoPoema);
	}
	
	public Poema obtenerUno(Long id) {
		return this.repositorioPoema.findById(id).orElse(null);
	}
	
	public void eliminarUno(Long id) {
		this.repositorioPoema.deleteById(id);
	}

    public Poema obtenerPoemaPorId(Long idPoema) {
        return this.repositorioPoema.findById(idPoema).orElse(null);
    }

    public Poema actualizarUno(Poema poemaNuevo) {
		return this.repositorioPoema.save(poemaNuevo);
	}
}