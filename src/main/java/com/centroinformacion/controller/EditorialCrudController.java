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

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.EditorialService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EditorialCrudController {
	
	@Autowired
	private EditorialService editorialService;
	
	@GetMapping("/consultaCrudEditorial")
	@ResponseBody
	public List<Editorial> consulta(String filtro) {
		return editorialService.listaPorRazSocialLike("%"+filtro+"%");
	}
	
	@PostMapping("/registraCrudEditorial")
	@ResponseBody
	public Map<?, ?> registra(Editorial obj, HttpSession session) {


		HashMap<String, Object> map = new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());  
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		Editorial objSalida = editorialService.insertaEditorial(obj);
		if (objSalida == null) {
			map.put("MSG", "Error en el registro.");
		} else {
			List<Editorial> lista = editorialService.listaPorRazSocialRucLike("%");
			map.put("lista", lista);
			map.put("MSG", "Registro exitoso.");
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudEditorial")
	@ResponseBody
	public Map<?, ?> actualiza(Editorial obj, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		Optional<Editorial> optEditorial= editorialService.buscaEditorial(obj.getIdEditorial());
		obj.setFechaRegistro(optEditorial.get().getFechaRegistro());
		obj.setEstado(optEditorial.get().getEstado());
		obj.setFechaActualizacion(new Date());
		
		Usuario objUsuario=(Usuario)session.getAttribute("objUsuario");
		obj.setUsuarioActualiza(objUsuario);
		obj.setUsuarioRegistro(optEditorial.get().getUsuarioRegistro());
		
		Editorial objSalida = editorialService.actualizaEditorial(obj);
		if (objSalida == null) {
			map.put("MSG", "Error en actualizar.");
		} else {
			map.put("MSG", "Actualización exitosa.");
			List<Editorial> lista = editorialService.listaPorRazSocialRucLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudEditorial")
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Editorial objEditorial= editorialService.buscaEditorial(id).get();
		objEditorial.setFechaActualizacion(new Date());  
		objEditorial.setEstado(objEditorial.getEstado() == 1 ? 0 : 1);
		Editorial objSalida = editorialService.actualizaEditorial(objEditorial);
		if (objSalida == null) {
			map.put("MSG", "Error en actualizar.");
		} else {
			List<Editorial> lista = editorialService.listaPorRazSocialRucLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@GetMapping("/buscaEditorialRazSocialRucRegistro")
	@ResponseBody
	public String validaEditorialRegistra(String razonSocial, String ruc) {
		List<Editorial>lstSalida=editorialService.listaPorRazSocialRucIgual(razonSocial, ruc);
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaEditorialRazSocialRucActualiza")
	@ResponseBody
	public String validaLibroActualiza(String razonSocial, String ruc, String idEditorial) {
		List<Editorial> lstSalida = editorialService.listaPorRazSocialRucIgualActualiza(
				razonSocial, 
				ruc,
				Integer.parseInt(idEditorial));
		
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}

}
