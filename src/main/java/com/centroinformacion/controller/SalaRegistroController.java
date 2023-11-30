package com.centroinformacion.controller;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;
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
 *@author SOLORZANO MELENDEZ SAM
 *9696969
 * 
 * */

@Controller
public class SalaRegistroController {
	@Autowired
	private final SalaService service;

	
	public SalaRegistroController(SalaService service){
			this.service =service;
	}

	@PostMapping("/registrarSalaRegistro")
	@ResponseBody
	public Map<?, ?> registrar(Sala objSala, HttpSession session) {
		Usuario user = (Usuario) session.getAttribute("objUsuario");
		objSala.setUsuarioRegistro(user);
		objSala.setUsuarioActualiza(user);
		objSala.setEstado(AppSettings.ACTIVO);
		objSala.setFechaRegistro(new Date());
		objSala.setFechaActualizacion(new Date());
		System.out.println("Asdaz 1:" + objSala.getSede());
		Sala objSalida = service.insertaSala(objSala);
		HashMap<String, String> map = new HashMap<>();
		if (objSalida == null) {
			map.put("mensaje", "ERROR AL REGISTRAR");
		} else {
			map.put("MSG", "REGISTRO EXITOSO!");
		}

		return map;
	}
	@GetMapping("/buscarNumeroSalaRegistro")
	@ResponseBody
	public String validarNumeroSala(String numeroSala) {
		List<Sala> listNroSala = service.buscarNumeroSala(numeroSala);
		if (CollectionUtils.isEmpty(listNroSala)) {
			return "{\"valid\" : true }";
		} else {
			return "{\"valid\" : false }";
		}
	}


}
