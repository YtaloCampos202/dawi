package com.centroinformacion.controller;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
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
public class AlumnoRegistroController {
	
	@Autowired
	private AlumnoService alumnoService;
	
	@PostMapping("/registraAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setFechaActualizacion(new Date());
		obj.setFechaRegistro(new Date());

		obj.setEstado(AppSettings.ACTIVO);
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);


		Alumno objSalida = alumnoService.insertarAlumno(obj);
		if (objSalida == null) {
			map.put("MENSAJE", "Error en el Registro");
		} else {
			map.put("MENSAJE", "Registro Exitoso");
		}
		return map;
	}
	
	@GetMapping("/buscaAlumnoPorDni")
	@ResponseBody
	public String validaDni(String dni) {

		List<Alumno> lstAlumno = alumnoService.buscaPorDni(dni);
		if (CollectionUtils.isEmpty(lstAlumno)) {
			return "{\"valid\" : true}";
		}else {
			return "{\"valid\" : false}";
		}
		
	}
}
