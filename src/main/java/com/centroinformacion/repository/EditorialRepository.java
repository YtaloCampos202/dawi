package com.centroinformacion.repository;

import com.centroinformacion.entity.Editorial;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface EditorialRepository extends JpaRepository<Editorial, Integer>{
		
	public abstract List<Editorial> findByRucIgnoreCase(String ruc);
	
	@Query("select x from Editorial x where x.ruc=?1")
	public List<Editorial> buscaPorRuc(String titulo);
	
	@Query("select x from Editorial x where x.razonSocial like ?1")
	public List<Editorial> listaPorRazSocialLike(String filtro);
	
	@Query("select x from Editorial x where x.razonSocial like ?1 or x.ruc like ?1")
	public List<Editorial> listaPorRazSocialRucLike(String filtro);
	
	@Query("select x from Editorial x where x.razonSocial =?1 and x.ruc =?2")
	public List<Editorial>listaPorRazSocialRucIgual(String razonSocial,String ruc);
	
	@Query("select x from Editorial x where x.razonSocial = ?1 and x.ruc = ?2 and x.idEditorial != ?3")
	public List<Editorial> listaPorRazSocialRucIgualActualiza(String razonSocial,String ruc, int idEditorial);
	
	@Query("select e from Editorial e where "
			+ "( e.estado like ?1)  and "
			+ "( ?2 = -1  or e.pais.idPais = ?2 ) and "
			+ "( e.razonSocial like ?3 ) and "
			+ "( e.direccion like ?4 ) and "
			+ "( e.ruc like ?5 ) and "
			+ "( e.fechaCreacion >= ?6 ) and"
			+ "( e.fechaCreacion <= ?7 )") 
	public abstract List<Editorial> listaConsultaEditorial(int estado, int idPais, String razSocial, String direccion,
			String ruc, Date fecDesde, Date fecHasta);
}
