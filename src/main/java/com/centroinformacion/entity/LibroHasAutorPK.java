package com.centroinformacion.entity;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@EqualsAndHashCode
@Embeddable
public class LibroHasAutorPK implements Serializable {

	private static final long serialVersionUID = 1L;
	private int idLibro;
	private int idAutor;

}
