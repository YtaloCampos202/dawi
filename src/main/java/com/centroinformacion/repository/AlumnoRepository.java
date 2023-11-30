package com.centroinformacion.repository;

/**
 * @author FernandoLimo
 * 20230914
 */

import com.centroinformacion.entity.Alumno;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface AlumnoRepository extends JpaRepository<Alumno, Integer>{
	
	public abstract List<Alumno> findByOrderByApellidosAsc();
	
	@Query("select x from Alumno x where x.nombres =?1")
	public List<Alumno> buscaPorNombre(String nombres);
	
	@Query("select x from Alumno x where x.dni =?1")
	public List<Alumno> buscaPorDni(String dni);

	@Query("select s from Alumno s where s.dni like ?1 or s.nombres like ?1 ")
	public List<Alumno> listaSalaPorNumeroOrRecursosLike(String filtro);

	
	@Query("select e from Alumno e where e.nombres like?1 or e.apellidos like?1")
	public List<Alumno> listaAlumnoPorNombreApellidoLike(String filtro);
	
	@Query("select a from Alumno a where "
			+ "( a.estado = ?1)  and "
			+ "( ?2 = -1  or a.pais.idPais = ?2 ) and "
			+ "( ?3 = -1  or a.modalidad.idDataCatalogo = ?3 ) and "
			+ "( a.nombres like ?4 or a.apellidos like ?4 ) and "
			+ "( a.fechaNacimiento >= ?5 ) and "
			+ "( a.fechaNacimiento <= ?6 ) " ) 
	
	public abstract List<Alumno> listaConsultaAlumno(int estado, int idPais,int idModalidad, String nombrec, Date fecDesde, Date fecHasta, String dni);
	
	
}
