package com.centroinformacion.repository;

import com.centroinformacion.entity.Pais;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaisRepository extends JpaRepository<Pais, Integer>{
	
	
	public abstract List<Pais> findByOrderByNombreAsc();
	

}
