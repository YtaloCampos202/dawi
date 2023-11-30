package com.centroinformacion.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.centroinformacion.entity.Autor;


public interface AutorRepository extends JpaRepository<Autor, Integer> {
	
	
	//BUSCAR POR NOMBRE QUE IGNORE LAS MAYUSCULAS Y LAS MINUSCULAS
	public abstract List<Autor> findByNombresIgnoreCase (String nombres);
	//BUSCAR POR APELLIDO QUE IGNORE LAS MAYUSCULAS Y LAS MINUSCULAS
	public abstract List<Autor> findByApellidosIgnoreCase (String apellidos);
	//BUSCAR POR TELEFONO QUE IGNORE LAS MAYUSCULAS Y LAS MINUSCULAS
	public abstract List<Autor> findByTelefonoIgnoreCase (String telefono);

	//JQuery  CRUD
	//LISTAR LOS NOMBRE Y APELLIDOS DE LAS PERSONAS LETRA POR LETRA
	@Query("select e from Autor e where e.nombres like?1 or e.apellidos like?1")
	public List<Autor> listaAutorPorNombreApellidoLike(String filtro);

	//LISTAR LOS NOMBRES Y APELLIDOS QUE SEAN IGUALES
	@Query("select e from Autor e where e.nombres = ?1 and e.apellidos = ?2")
	public List<Autor> listaAutorPorNombreApellidoIgual(String nombres, String apellidos);

	//LISTAR LOS NOMBRES Y APELLIDOS QUE SEAN IGUAL PARA EL ACTUALIZAR
	@Query("select e from Autor e where e.nombres = ?1 and e.apellidos = ?2 and e.idAutor != ?3")
	public List<Autor> listaAutorNombreApellidoIgualActualiza(String nombre, String apellido, int idAutor);

	
	
	//CONSULTA DE AUTOR PARA QUE CONSULTE POR 5 ATRIBUTOS DE LA ENTIDAD AUTOR
	@Query("select e from Autor e where "
			+ "( e.estado = ?1)  and "
			+ "( ?2 = -1  or e.pais.idPais = ?2 ) and "
			+ "( ?3 = -1 or e.grado.idDataCatalogo = ?3) and "
			+ "( e.nombres like ?4 or e.apellidos like ?4 ) and"
			+ "( e.fechaNacimiento >= ?5 ) and"
			+ "( e.fechaNacimiento <= ?6 )") 
	public abstract List<Autor> listaConsultaAutor(int estado, int idPais,int idGrado, String nomApe, Date fecDesde, Date fecHasta);
		
	
	
	
}
