package com.saraulloa.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.saraulloa.modelos.Usuario;

@Repository
public interface RepositorioUsuario extends CrudRepository<Usuario, Long>{
	List<Usuario> findAll();
	
	Usuario findByNombre(String nombre);

	Usuario findOneByCorreo(String correo);
	}