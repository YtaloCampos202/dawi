package com.centroinformacion.controller;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AutorService;
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

/**
 * 
 * @author Celso Rodriguez 14092023
 *
 */

@Controller
public class AutorRegistroController {

	@Autowired
	private AutorService autorService;

	@PostMapping("/registraAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());

		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		Autor objSalida = autorService.insertaAutor(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el Registro");
		} else {
			map.put("MENSAJE", "Registro Exitoso");
		}
		return map;
	}

	@GetMapping("/buscaPorNombresAutor")
	@ResponseBody
	public String validaNombres(String nombres) {
		List<Autor> lstAutor = autorService.buscaPorNombres(nombres);
		if (CollectionUtils.isEmpty(lstAutor)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}

	@GetMapping("/buscaPorApellidosAutor")
	@ResponseBody
	public String validaApellidos(String apellidos) {
		List<Autor> lstAutor = autorService.buscaPorApellidos(apellidos);
		if (CollectionUtils.isEmpty(lstAutor)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	@GetMapping("/buscaPorTelefonoAutor")
	@ResponseBody
	public String validaTelefono(String telefono) {
		List<Autor> lstAutor = autorService.buscaPorTelefono(telefono);
		if (CollectionUtils.isEmpty(lstAutor)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
	
	

}
