package com.centroinformacion.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "prestamo_tiene_libro")
public class PrestamoHasLibro {

	
	@EmbeddedId
	private PrestamoHasLibroPK prestamoHasLibroPK;

	@ManyToOne
	@JoinColumn(name = "idPrestamo", nullable = false, insertable = false, updatable = false)
	private Prestamo prestamo;
	
	@ManyToOne
	@JoinColumn(name = "idLibro", nullable = false, insertable = false, updatable = false)
	private Libro libro;

	
	
}
