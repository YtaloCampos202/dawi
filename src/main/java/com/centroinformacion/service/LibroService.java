package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Libro;

public interface LibroService {

	public abstract Libro registroLibro(Libro obj);
	public abstract List<Libro> buscaPorTitulo(String titulo);
	//CRUD
	public abstract Libro actualizaLibro(Libro obj);
	public abstract List<Libro> listaPorNombreLike(String filtro);
	public abstract Optional<Libro> buscaLibro(int idLibro);
	//
	public abstract List<Libro> listaPorTituloSerieLike(String filtro);
	public abstract List<Libro> listaPorTituloSerieIgual(String titulo, String serie);
	public abstract List<Libro> listaPorTituloSerieIgualActualiza(String titulo,String serie, int idLibro);
	//
	public abstract List<Libro> buscaPorSerie(String serie);
	//
	public abstract List<Libro> listaConsultaLibro(int estado,int idCategoria,int idTipo, String titulo,String serie,String anio);
}
