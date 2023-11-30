package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.repository.TesisRepository;

@Service
public class TesisServiceImpl implements TesisService {

	@Autowired
	private TesisRepository repository;

	@Override
	public Tesis insertaTesis(Tesis obj) {
		return repository.save(obj);
	}

	@Override
	public Tesis actualizaTesis(Tesis obj) {
		return repository.save(obj);
	}

	@Override
	public List<Tesis> listaPorTituloLike(String filtro) {
		return repository.listaPorTituloLike(filtro);
	}

	@Override
	public Optional<Tesis> buscaTesis(int idTesis) {
		return repository.findById(idTesis);
	}

	@Override
	public List<Tesis> buscarPorTitulo(String titulo) {
		return repository.buscarPorTitulo(titulo);
	}

	// Consulta
	@Override
	public List<Tesis> listaConsultaTesis(String titulo, int estado, String tema, int idAlumno) {
		return repository.listaConsultaTesis(titulo, estado, tema, idAlumno);
	}

}
