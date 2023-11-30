
package com.centroinformacion.service;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.repository.AlumnoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AlumnoServiceImp implements AlumnoService {

	@Autowired
	private AlumnoRepository repository;

	@Override
	public Alumno insertarAlumno(Alumno obj) {
		return repository.save(obj);
	}
	
	@Override
	public List<Alumno> listaTodos() {
		return repository.findByOrderByApellidosAsc();
	}

	@Override
	public List<Alumno> buscaPorNombre(String nombres) {
		return repository.buscaPorNombre(nombres);
	}
	@Override
	public List<Alumno> buscaPorDni(String dni) {
		return repository.buscaPorDni(dni);
	}

	@Override
	public List<Alumno> listaPorNombreApellidoLike(String filtro) {
		
		return repository.listaAlumnoPorNombreApellidoLike(filtro);

	}

	@Override
	public Optional<Alumno> buscaAlumno(int idAlumno) {
		
		return repository.findById(idAlumno);
	}

	@Override
	public Alumno actualizaAlumno(Alumno obj) {
		// 
		return repository.save(obj);
	}

	@Override
	public List<Alumno> listarConsultaAlumno(int estado, int idPais, int idModalidad, String nombrec, Date fecDesde,
			Date fecHasta, String dni) {
		return repository.listaConsultaAlumno(estado, idPais, idModalidad, nombrec, fecDesde, fecHasta, dni);
	}

}
