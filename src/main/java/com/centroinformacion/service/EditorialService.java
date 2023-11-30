package com.centroinformacion.service;

import com.centroinformacion.entity.Editorial;

import java.util.List;
import java.util.Date;
import java.util.Optional;

public interface EditorialService {

	public abstract Editorial insertaEditorial(Editorial obj);
	public abstract List<Editorial> buscaPorRuc (String ruc);
	
	public abstract Editorial actualizaEditorial(Editorial obj);
	public abstract List<Editorial> listaPorRazSocialLike(String filtro);
	public abstract Optional<Editorial> buscaEditorial(int idEditorial);
	
	public abstract List<Editorial> listaPorRazSocialRucLike(String filtro);
	public abstract List<Editorial> listaPorRazSocialRucIgual(String razonSocial, String ruc);
	public abstract List<Editorial> listaPorRazSocialRucIgualActualiza(String razonSocial,String ruc, int idEditorial);
	
	public abstract List<Editorial> listaConsultaEditorial(int estado, int idPais, String razSocial, String direccion,
															String ruc, Date fecDesde, Date fecHasta);

}