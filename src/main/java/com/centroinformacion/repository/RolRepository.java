package com.centroinformacion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.centroinformacion.entity.Opcion;
import com.centroinformacion.entity.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer>{

	//@Query("Select x from Rol x where x.login = :#{#rol.login} and x.password = :#{#rol.password}")
	@Query("Select x from Rol x where x.nombre = :#{#rol.nombre}")
	public abstract Rol login(@Param(value ="rol") Rol bean);
	
	@Query("Select u.opcion from RolHasOpcion u where u.rol.idRol = ?1")
	public abstract List<Opcion> traerOpcionDeRol(int idRol);
	
	@Query("Select u.opcion, u.rol from RolHasOpcion u where u.rol.idRol = ?1")
	public abstract List<Object> getObjRol(int idRol);
}
