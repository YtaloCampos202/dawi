package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Tesis;

public interface TesisService {
	// Metodo para CRUD
	public abstract Tesis insertaTesis(Tesis obj);
	public abstract Tesis actualizaTesis(Tesis obj);
	public abstract List<Tesis> listaPorTituloLike(String filtro);
	public abstract Optional<Tesis> buscaTesis(int idTesis);
	
	public List<Tesis> buscarPorTitulo(String titulo);
	
	// Consulta
	public abstract List<Tesis> listaConsultaTesis(String titulo, int estado, String tema, int idAlumno);

}