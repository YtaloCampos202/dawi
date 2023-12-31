package com.centroinformacion.service;

import com.centroinformacion.entity.Pais;
import com.centroinformacion.repository.PaisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaisServiceImp implements PaisService {

	@Autowired
	private PaisRepository repository;

	@Override
	public List<Pais> listaTodos() {
		return repository.findByOrderByNombreAsc();

	}

}
