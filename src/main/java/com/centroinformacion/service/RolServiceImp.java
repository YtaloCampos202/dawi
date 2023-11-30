package com.centroinformacion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Opcion;
import com.centroinformacion.entity.Rol;
import com.centroinformacion.entity.RolHasOpcion;
import com.centroinformacion.entity.RolHasOpcionPK;
import com.centroinformacion.repository.RolHasOpcionRepository;
import com.centroinformacion.repository.RolRepository;

@Service
public class RolServiceImp implements RolService{

	@Autowired
	private RolRepository rolRepository;
	
	@Autowired
	private RolHasOpcionRepository rolHasOpcionRepository;
	
	@Override
	public List<Rol> listaRol() {
		// TODO Auto-generated method stub
		return rolRepository.findAll();
	}

	@Override
	public List<Opcion> traerOpcionDeRol(int idRol) {
		// TODO Auto-generated method stub
		return rolRepository.traerOpcionDeRol(idRol);
	}

	@Override
	public Optional<RolHasOpcion> buscaOpcion(RolHasOpcionPK ojb) {
		// TODO Auto-generated method stub
		return rolHasOpcionRepository.findById(ojb);
	}

	@Override
	public RolHasOpcion insertaOpcion(RolHasOpcion ojb) {
		// TODO Auto-generated method stub
		return rolHasOpcionRepository.save(ojb);
	}

	@Override
	public void eliminaOpcion(RolHasOpcion obj) {
		rolHasOpcionRepository.delete(obj);
		
	}

	@Override
	public Rol login(Rol bean) {
		// TODO Auto-generated method stub
		return rolRepository.login(bean);
	}
	
	@Override
	public List<Object> getObjRol(int idRol) {
		// TODO Auto-generated method stub
		return rolRepository.getObjRol(idRol);
	}

}
