package com.centroinformacion.service;

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.repository.EditorialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class EditorialServiceImp implements EditorialService {

	@Autowired
	private EditorialRepository repository;

	@Override
	public Editorial insertaEditorial(Editorial obj) {
		return repository.save(obj);
	}

	@Override
	public List<Editorial> buscaPorRuc(String ruc) {
		return repository.findByRucIgnoreCase(ruc);
	}

	@Override
	public Editorial actualizaEditorial(Editorial obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public List<Editorial> listaPorRazSocialLike(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorRazSocialLike(filtro);
	}

	@Override
	public Optional<Editorial> buscaEditorial(int idEditorial) {
		// TODO Auto-generated method stub
		return repository.findById(idEditorial);
	}

	@Override
	public List<Editorial> listaPorRazSocialRucLike(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorRazSocialRucLike(filtro);
	}

	@Override
	public List<Editorial> listaPorRazSocialRucIgual(String razonSocial, String ruc) {
		// TODO Auto-generated method stub
		return repository.listaPorRazSocialRucIgual(razonSocial,ruc);
	}

	@Override
	public List<Editorial> listaPorRazSocialRucIgualActualiza(String razonSocial, String ruc, int idEditorial) {
		// TODO Auto-generated method stub
		return repository.listaPorRazSocialRucIgualActualiza(razonSocial, ruc, idEditorial);
	}

	@Override
	public List<Editorial> listaConsultaEditorial(int estado, int idPais, String razSocial, String direccion,
			String ruc, Date fecDesde, Date fecHasta) {
		// TODO Auto-generated method stub
		return repository.listaConsultaEditorial(estado, idPais, razSocial, direccion, ruc, fecDesde, fecHasta);
	}	
}