package com.centroinformacion.controller;
/*
 * @author Hector Altuna
 */

import com.centroinformacion.entity.Editorial;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.EditorialService;
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
public class EditorialRegistroController {
	@Autowired
	private EditorialService editorialService;
	
	@PostMapping("/registraEditorial")
	@ResponseBody
	public Map<?,?>registrar(Editorial objEditorial, HttpSession session){
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		objEditorial.setFechaActualizacion(new Date());
		objEditorial.setFechaRegistro(new Date());
		objEditorial.setEstado(AppSettings.ACTIVO);
		objEditorial.setUsuarioRegistro(objUsuario);
		objEditorial.setUsuarioActualiza(objUsuario);
		
		HashMap<String,String>map=new HashMap<String,String>();	
		Editorial objSalida = editorialService.insertaEditorial(objEditorial);
		if(objSalida==null) {
			map.put("MENSAJE","Error al registrar");
		}else {
			map.put("MENSAJE","Registro exitoso");
		}
		return map;
	}
	
	@GetMapping("/buscaPorRucEditorial")
	@ResponseBody
	public String validaRuc(String ruc) {
		List<Editorial> lstEditorial = editorialService.buscaPorRuc(ruc);
		if (CollectionUtils.isEmpty(lstEditorial)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}
	
}