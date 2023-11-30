package com.centroinformacion.controller;
/*
 * @author Ytalo Campos
 */

import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;
import com.centroinformacion.util.AppSettings;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LibroRegistroController {
	@Autowired
	private LibroService service;

	@PostMapping("/registraLibro")
	@ResponseBody
	public Map<?, ?> registrar(Libro objLibro, HttpSession session) {
		Usuario user = (Usuario) session.getAttribute("objUsuario");
		objLibro.setFechaActualizacion(new Date());
		objLibro.setFechaRegistro(new Date());
		objLibro.setEstado(AppSettings.ACTIVO);
		objLibro.setUsuarioRegistro(user);
		objLibro.setUsuarioActualiza(user);

		DataCatalogo objData = new DataCatalogo();
		objData.setIdDataCatalogo(27);
		objLibro.setEstadoPrestamo(objData);
		HashMap<String, String> map = new HashMap<String, String>();

		Libro objSalida = service.registroLibro(objLibro);
		if (objSalida == null) {
			map.put("mensaje", "Error al registrar");
		} else {
			map.put("MSG", "Registro exitoso");
		}
		return map;
	}

	@GetMapping("/buscaLibroPorTitulo")
	@ResponseBody
	public String validaTitulo(String titulo) {
		List<Libro> lstlibro = service.buscaPorTitulo(titulo);
		if (CollectionUtils.isEmpty(lstlibro)) {
			return "{\"valid\":true}";
		} else {
			return "{\"valid\":false}";
		}

	}

}
