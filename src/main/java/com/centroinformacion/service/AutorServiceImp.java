package com.centroinformacion.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.repository.AutorRepository;

@Service
public class AutorServiceImp implements AutorService {

	@Autowired
	private AutorRepository repository;
	
	@Override
	public Autor insertaAutor(Autor obj) {
		return repository.save(obj);
	}

	@Override
	public List<Autor> buscaPorNombres(String nombres) {
		return repository.findByNombresIgnoreCase(nombres);
	}

	@Override
	public List<Autor> buscaPorApellidos(String apellidos) {
		return repository.findByApellidosIgnoreCase(apellidos);	
	}

	@Override
	public List<Autor> buscaPorTelefono(String telefono) {
		return repository.findByTelefonoIgnoreCase(telefono);
	}

	@Override
	public Autor actualizaAutor(Autor obj) {
		return repository.save(obj);
	}

	@Override
	public List<Autor> listaPorNombreApellidoLike(String filtro) {
		return repository.listaAutorPorNombreApellidoLike(filtro);

	}

	@Override
	public Optional<Autor> buscaAutor(int idAutor) {
		return repository.findById(idAutor);

	}

	@Override
	public List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos) {
		return repository.listaAutorPorNombreApellidoIgual(nombres, apellidos);

	}

	@Override
	public List<Autor> listaPorNombreApellidoIgualActualiza(String nombres, String apellidos, int idAutor) {
		return repository.listaAutorNombreApellidoIgualActualiza(nombres, apellidos, idAutor);
	}

	@Override
	public List<Autor> listaConsultaAutor(int estado, int idPais, int idGrado, String nomApe, Date fecDesde, Date fecHasta) {
		return repository.listaConsultaAutor(estado, idPais, idGrado, nomApe, fecDesde, fecHasta);
	}
}
