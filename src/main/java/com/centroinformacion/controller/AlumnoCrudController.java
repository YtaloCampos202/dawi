package com.centroinformacion.controller;

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AlumnoService;
import com.centroinformacion.util.FunctionUtil;

import jakarta.servlet.http.HttpSession;
import lombok.extern.apachecommons.CommonsLog;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@CommonsLog
@Controller
public class AlumnoCrudController {
   @Autowired
    private AlumnoService alumnoService;

   	@GetMapping("/consultaCrudAlumno")
	@ResponseBody
	public List<Alumno> consulta(String filtro) {
		return alumnoService.listaPorNombreApellidoLike("%"+filtro+"%");
	}
   	
   	
   	
	@PostMapping("/registraCrudAlumno")
	@ResponseBody
	public Map<?, ?> registra(Alumno obj, HttpSession session) {


		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());  
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		Alumno objSalida = alumnoService.insertarAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro.");
		} else {
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso.");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudAlumno")
	@ResponseBody
	public Map<?, ?> actualizar(Alumno obj, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Optional<Alumno> optAlumno= alumnoService.buscaAlumno(obj.getIdAlumno());
		obj.setFechaRegistro(optAlumno.get().getFechaRegistro());
		obj.setEstado(optAlumno.get().getEstado());
		obj.setFechaActualizacion(new Date());
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(optAlumno.get().getUsuarioRegistro());
				
		Alumno objSalida = alumnoService.actualizaAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			map.put("mensaje", "Actualización exitosa.");
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudAlumno")
	public Map<?, ?> elimina(int id , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Alumno obj= alumnoService.buscaAlumno(id).get();
		obj.setFechaActualizacion(new Date());  
		obj.setEstado( obj.getEstado() == 1 ? 0 : 1);
		Alumno objSalida = alumnoService.actualizaAlumno(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Alumno> lista = alumnoService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}
   
	
	@GetMapping("/buscaAlumnoMayorEdad")
	@ResponseBody
	public String validaFecha(String fechaNacimiento) {
		log.info(">> validaFecha >> " + fechaNacimiento);
		if(FunctionUtil.isMayorEdad(fechaNacimiento)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
   
}
