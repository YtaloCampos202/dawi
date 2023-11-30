package com.centroinformacion.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Autor;

public interface AutorService {

	//CRUD
	public abstract Autor insertaAutor(Autor obj);
	public abstract Autor actualizaAutor(Autor obj);
	public abstract List<Autor> listaPorNombreApellidoLike(String filtro);
	public abstract Optional<Autor> buscaAutor(int idAutor);
	
	
	public abstract List<Autor> buscaPorNombres (String nombres);
	public abstract List<Autor> buscaPorApellidos (String apellidos);
	public abstract List<Autor> buscaPorTelefono (String telefono);
	
	
	//VALIDACION DEL REGISTRAR
	public abstract List<Autor> listaPorNombreApellidoIgual(String nombres, String apellidos);
	public abstract List<Autor> listaPorNombreApellidoIgualActualiza(String nombres, String apellidos, int idAutor);

	
	
	//CONSULTAR AUTOR POR 5 ATRIBUTOS DE LA ENTIDAD AUTOR --- ENCONTRAR EN REPOSITORY
	public abstract List<Autor> listaConsultaAutor(int estado, int idPais, int idGrado,  String nomApe, Date fecDesde, Date fecHasta);
	
}
