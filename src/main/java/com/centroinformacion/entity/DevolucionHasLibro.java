package com.centroinformacion.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "devolucion_tiene_libro")
public class DevolucionHasLibro {

	
	@EmbeddedId
	private DevolucionHasLibroPK devolucionHasLibroPK;

	@ManyToOne
	@JoinColumn(name = "idDevolucion", nullable = false, insertable = false, updatable = false)
	private Devolucion devolucion;
	
	@ManyToOne
	@JoinColumn(name = "idLibro", nullable = false, insertable = false, updatable = false)
	private Libro libro;

	
	
}
