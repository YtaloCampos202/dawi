package com.centroinformacion.entity;

/**
 * @author Celso Rodriguez 
 */


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "autor")
@AllArgsConstructor
@NoArgsConstructor
public class Autor {
  

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idAutor;
	private String nombres;
	private String apellidos;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd" , timezone = "America/Lima")
	private Date fechaNacimiento;
	
	private String telefono;
	
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
	private Date fechaRegistro;

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
	private Date fechaActualizacion;
	
	private int estado;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idPais")
	private Pais pais;

	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idGrado")
	private DataCatalogo grado;
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUsuarioRegistro")
	private Usuario usuarioRegistro;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idUsuarioActualiza")
	private Usuario usuarioActualiza;
	
	
	
	//Atributos para el reporte
			public String getReporteEstado() {
				return estado == 1? "Activo": "Inactivo";
			}
			public String getReportePais() {
				return  pais.getIdPais() + " - " + pais.getNombre();
			}
			
			public String getReporteGrado() {
				return  grado.getIdDataCatalogo() + " - " + grado.getDescripcion();
			}
			public String getReporteFechaNacimiento() {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				return  sdf.format(fechaNacimiento);
			}
	
}
