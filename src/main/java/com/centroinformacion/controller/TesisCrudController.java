package com.centroinformacion.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.TesisService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TesisCrudController {

	@Autowired
	private TesisService servie;

	/*

	@PostMapping("/registraCrudTesis")
	@ResponseBody
	public Map<?, ?> registra(Tesis obj, HttpSession session) {
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);

		HashMap<String, Object> map = new HashMap<String, Object>();
		Tesis objSalida = servie.insertaTesis(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			List<Tesis> lista = servie.listaPorTituloLike("%");
			map.put("lista", lista);
			map.put("mensaje", "Registro exitoso");
		}
		return map;
	}

	@ResponseBody
	@PostMapping("/eliminaCrudTesis")
	public Map<?, ?> elimina(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		Tesis obj = servie.buscaTesis(id).get();
		obj.setFechaActualizacion(new Date());
		obj.setEstado(obj.getEstado() == 1 ? 0 : 1);
		Tesis objSalida = servie.actualizaTesis(obj);
		if (objSalida == null) {
			map.put("mensaje", "Error en actualizar");
		} else {
			List<Tesis> lista = servie.listaPorTituloLike("%");
			map.put("lista", lista);
		}
		return map;
	}

	// Metodo para Listar
	@GetMapping("/consultaCrudTesis")
	@ResponseBody
	public List<Tesis> consulta(String filtro) {
		return servie.listaPorTituloLike("%" + filtro + "%");
	}
	*/
}
