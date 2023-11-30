package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.AutorService;
import com.centroinformacion.util.FunctionUtil;

import jakarta.servlet.http.HttpSession;
import lombok.extern.apachecommons.CommonsLog;

@CommonsLog
@Controller
public class AutorCrudController {

	@Autowired
	private AutorService autorService;
	
	
	@GetMapping("/consultaCrudAutor")
	@ResponseBody
	public List<Autor> consulta(String filtro) {
		return autorService.listaPorNombreApellidoLike("%"+filtro+"%");
	}
	
	
	
	@PostMapping("/registraCrudAutor")
	@ResponseBody
	public Map<?, ?> registra(Autor obj, HttpSession session) {


		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());  
		
		//Registrar USUARIO
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		
		//PARA VALIDAD NOMBRE Y APELLIDO DESPUES DE LA EJECUCION
/*
		List<Autor> lstSalida = autorService.listaPorNombreApellidoIgual(obj.getNombres(), obj.getApellidos());
		if(!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje","El Autor '" + obj.getNombres() + " " + obj.getApellidos() + "' ya existe");
			return map;
		}*/
		
		Autor objSalida = autorService.insertaAutor(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Autor> lista = autorService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudAutor")
	@ResponseBody
	public Map<?, ?> actualizar(Autor obj, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Optional<Autor> optAutor= autorService.buscaAutor(obj.getIdAutor());
		obj.setFechaRegistro(optAutor.get().getFechaRegistro());
		obj.setEstado(optAutor.get().getEstado());
		obj.setFechaActualizacion(new Date());
		
		//Actualiza USUARIO
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(optAutor.get().getUsuarioRegistro());
		
		//PARA VALIDAD NOMBRE Y APELLIDO DESPUES DE LA EJECUCION
		/*List<Autor> lstSalida = autorService.listaPorNombreApellidoIgualActualiza(
				obj.getNombres(), 
				obj.getApellidos(),
				obj.getIdAutor());
		if(!CollectionUtils.isEmpty(lstSalida)) {
			map.put("mensaje","El Autor '" + obj.getNombres() + " " + obj.getApellidos() + "' ya existe");
			List<Autor> lista = autorService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			return map;
		}*/

		
		Autor objSalida = autorService.actualizaAutor(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Autor> lista = autorService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Actualización exitosa");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudAutor")
	public Map<?, ?> elimina(int id , HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Autor obj= autorService.buscaAutor(id).get();
		obj.setFechaActualizacion(new Date());  
		obj.setEstado( obj.getEstado() == 1 ? 0 : 1);
		Autor objSalida = autorService.actualizaAutor(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Autor> lista = autorService.listaPorNombreApellidoLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	

	
	
	@GetMapping("/buscaAutorMayorEdad")
	@ResponseBody
	public String validaFecha(String fechaNacimiento) {
		log.info(">> validaFecha >> " + fechaNacimiento);
		if(FunctionUtil.isMayorEdad(fechaNacimiento)) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaAutorNombreApellidoRegistro")
	@ResponseBody
	public String validaAutorRegistra(String nombres, String apellidos) {
		List<Autor> lstSalida = autorService.listaPorNombreApellidoIgual(
													nombres, apellidos);
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaAutorNombreApellidoActualiza")
	@ResponseBody
	public String validaAutorActualiza(String nombres, String apellidos, String id) {
		
		List<Autor> lstSalida = autorService.listaPorNombreApellidoIgualActualiza(
				nombres, 
				apellidos,
				Integer.parseInt(id));
		
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
}

