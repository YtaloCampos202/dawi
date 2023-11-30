package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Libro;

public interface LibroRepository extends JpaRepository<Libro,Integer> {

	@Query("select x from Libro x where x.titulo=?1")
	public List<Libro> buscaPorTitulo(String titulo);
	
	//CRUD
	@Query("select x from Libro x where x.titulo like ?1")
	public List<Libro> listaPorNombreLike(String filtro);
	
	@Query("select x from Libro x where x.titulo like ?1 or x.serie like ?1")
	public List<Libro> listaLibroTituloSerieLike(String filtro);
	
	@Query("select x from Libro x where x.titulo =?1 and x.serie =?2")
	public List<Libro>listaLibroTituloSerieIgual(String titulo,String serie);
	
	@Query("select x from Libro x where x.titulo = ?1 and x.serie = ?2 and x.idLibro != ?3")
	public List<Libro> listaLibroTituloSerieIgualActualiza(String titulo,String serie, int idLibro);
	
	@Query("select x from Libro x where x.serie=?1")
	public List<Libro> buscaPorSerie(String serie);
	
	//Consulta y Reporte PC3
	@Query("select x from Libro x where "
			+ "( x.estado = ?1) and "
			+ "( ?2 = -1 or x.categoriaLibro.idDataCatalogo =?2 ) and "
			+ "( ?3 = -1 or x.tipoLibro.idDataCatalogo =?3 ) and "
			+ "( x.titulo like ?4 ) and "
			+ "( x.serie like ?5 ) and "
			+ "( ?6 = -1 or x.anio = ?6 )")
	public abstract List<Libro> listaConsultaLibro(int estado, int idCategoria, int idTipo, String titulo, String serie, String anio);
	
	
}
