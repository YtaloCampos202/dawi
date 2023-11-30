package com.centroinformacion.service;

import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.repository.DataCatalogoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataCatalogoServiceImp implements DataCatalogoService {

	@Autowired
	private DataCatalogoRepository repository;

	@Override
	public List<DataCatalogo> listaDataCatalogo(int idTipo) {
		return repository.listaDataCatalogo(idTipo);
	}

}
