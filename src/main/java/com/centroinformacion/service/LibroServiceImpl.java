package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.repository.LibroRepository;
@Service
public class LibroServiceImpl {
	
	@Autowired
	LibroRepository repository;
	
@Service
public class RevistaServiceImpl implements LibroService{

	/*@Autowired
	private LibroRepository repository;*/
	@Autowired
	LibroRepository repository;
	@Override
	public Libro registroLibro(Libro obj) {
		return repository.save(obj);
	}
	
	public List<Libro>buscaPorTitulo(String titulo){
		return repository.buscaPorTitulo(titulo);
	}

	@Override
	public Libro actualizaLibro(Libro obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public List<Libro> listaPorNombreLike(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorNombreLike(filtro);
	}

	@Override
	public Optional<Libro> buscaLibro(int idLibro) {
		// TODO Auto-generated method stub
		return repository.findById(idLibro);
	}

	@Override
	public List<Libro> listaPorTituloSerieIgual(String titulo, String serie) {
		// TODO Auto-generated method stub
		return repository.listaLibroTituloSerieIgual(titulo,serie);
	}

	@Override
	public List<Libro> listaPorTituloSerieIgualActualiza(String titulo, String serie, int idLibro) {
		// TODO Auto-generated method stub
		return repository.listaLibroTituloSerieIgualActualiza(titulo, serie, idLibro);
	}

	@Override
	public List<Libro> listaPorTituloSerieLike(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaLibroTituloSerieLike(filtro);
	}

	@Override
	public List<Libro> buscaPorSerie(String serie) {
		// TODO Auto-generated method stub
		return repository.buscaPorSerie(serie);
	}

	@Override
	public List<Libro> listaConsultaLibro(int estado, int idCategoria, int idTipo, String titulo, String serie,
			String anio) {
		//
		return repository.listaConsultaLibro(estado,idCategoria,idTipo,titulo,serie,anio);
	}
	

}
}
