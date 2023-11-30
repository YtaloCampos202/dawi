package com.centroinformacion.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@Table(name = "libro_tiene_autor")
public class LibroHasAutor {

	
	@EmbeddedId
	private LibroHasAutorPK libroHasAutorPK;

	@ManyToOne
	@JoinColumn(name = "idLibro", nullable = false, insertable = false, updatable = false)
	private Libro  libro;
	
	@ManyToOne
	@JoinColumn(name = "idAutor", nullable = false, insertable = false, updatable = false)
	private Autor autor;

	
	
}
