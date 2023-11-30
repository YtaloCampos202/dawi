package com.centroinformacion.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Tesis;

public interface TesisRepository extends JpaRepository<Tesis, Integer> {

	// Metodo para Listar
	@Query("select x from Tesis x where x.titulo like ?1")
	public List<Tesis> listaPorTituloLike(String filtro);

	// JPQL (Java Persistencia)
	@Query("select x from Tesis x where x.titulo = ?1")
	public List<Tesis> buscarPorTitulo(String titulo);
	
	//Consulta
		@Query("select e from Tesis e where "
					+ "( e.titulo like ?1 ) and "
					+ "( e.estado = ?2 ) and "
					+ "( e.tema like ?3 ) and "
					+ "( ?4 = -1  or e.alumno.idAlumno = ?4 ) " ) 
		public abstract List<Tesis> listaConsultaTesis(String titulo, int estado, String tema, int idAlumno );

}
