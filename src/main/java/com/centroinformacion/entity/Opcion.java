package com.centroinformacion.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "opcion")
public class Opcion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idOpcion;
	private String nombre;
	private String ruta;
	private int estado;
	private int tipo;

}
