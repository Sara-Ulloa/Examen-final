package com.saraulloa.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.saraulloa.modelos.Poema;

@Repository
public interface RepositorioPoema extends CrudRepository<Poema, Long> {

	List<Poema> findAll();
}