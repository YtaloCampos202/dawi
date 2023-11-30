package com.centroinformacion.controller;

import com.centroinformacion.entity.DataCatalogo;
import com.centroinformacion.entity.Libro;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.LibroService;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class LibroCrudController {

	@Autowired
	private LibroService libroService;
	
	/*@GetMapping("/verCrudLibro")
	public String verInicio() {
		return "crudLibro";
	}*/
	
	@GetMapping("/consultaCrudLibro")
	@ResponseBody
	public List<Libro>listaLibro(String filtro){
		List<Libro> lstSalida=libroService.listaPorNombreLike("%"+filtro+"%");
		//return libroService.listaPorNombreLike("%"+filtro+"%");
		return lstSalida;
	}
	
	@PostMapping("/registraCrudLibro")
	@ResponseBody
	public Map<?,?>registra(Libro obj, HttpSession session){
		
		HashMap<String, Object>map=new HashMap<String, Object>();
		obj.setEstado(1);
		obj.setFechaRegistro(new Date());
		obj.setFechaActualizacion(new Date());
		
		DataCatalogo data = new DataCatalogo();
		data.setIdDataCatalogo(27);
		obj.setEstadoPrestamo(data);
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioRegistro(objUsuario);
		obj.setUsuarioActualiza(objUsuario);
		
		Libro objSalida=libroService.registroLibro(obj);
		if(objSalida==null) {
			map.put("MSG","Error en el registro");
		}else {
			map.put("MSG", "Registro exitoso");
			List<Libro>lista=libroService.listaPorTituloSerieLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@PostMapping("/actualizaCrudLibro")
	@ResponseBody
	public Map<?, ?> actualiza(Libro obj, HttpSession session) {
		HashMap<String, Object>map =new HashMap<String, Object>();
		Optional<Libro>optLibro= libroService.buscaLibro(obj.getIdLibro());
		obj.setFechaRegistro(optLibro.get().getFechaRegistro());
		obj.setEstado(optLibro.get().getEstado());
		obj.setFechaActualizacion(new Date());
		obj.setEstadoPrestamo(optLibro.get().getEstadoPrestamo());
		
		Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
		obj.setUsuarioRegistro(optLibro.get().getUsuarioRegistro());
		obj.setUsuarioActualiza(objUsuario);
		
		Libro objSalida=libroService.actualizaLibro(obj);
		if(objSalida==null) {
			map.put("MSG", "Error en actualizar");
		}else {
			map.put("MSG", "Actualizacion exitosa");
			List<Libro> lista=libroService.listaPorTituloSerieLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/eliminaCrudLibro")
	public Map<?,?>elimina(int id){
		HashMap<String, Object>map=new HashMap<String,Object>();
		Libro objLibro=libroService.buscaLibro(id).get();
		objLibro.setFechaActualizacion(new Date());
		objLibro.setEstado(objLibro.getEstado()==1?0:1);
		Libro objSalida = libroService.actualizaLibro(objLibro);
		if(objSalida==null) {
			map.put("MSG", "Error en actualizar");
		}else {
			List<Libro>lista=libroService.listaPorTituloSerieLike("%");
			map.put("lista", lista);
		}
		return map;
	}
	
	//Complementarios
	@GetMapping("buscaLibroTituloSerieRegistro")
	@ResponseBody
	public String validaLibroRegistra(String titulo, String serie) {
		List<Libro>lstSalida=libroService.listaPorTituloSerieIgual(titulo, serie);
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	
	@GetMapping("/buscaLibroTituloSerieActualiza")
	@ResponseBody
	public String validaLibroActualiza(String titulo, String serie, String idLibro) {
		List<Libro> lstSalida = libroService.listaPorTituloSerieIgualActualiza(
				titulo, 
				serie,
				Integer.parseInt(idLibro));
		
		if(lstSalida.isEmpty()) {
			return "{\"valid\":true}";
		}else {
			return "{\"valid\":false}";
		}
	}
	//add missed it
	@GetMapping("/buscaLibroPorTituloos")
	@ResponseBody
	public String validaTitulo(String titulo) {
		List<Libro> lstlibro = libroService.buscaPorTitulo(titulo);
		if (CollectionUtils.isEmpty(lstlibro)) {
			return "{\"valid\":true}";
		} else {
			return "{\"valid\":false}";
		}

	}
	@GetMapping("/buscaLibroPorSerie")
	@ResponseBody
	public String validaSerie(String serie) {
		List<Libro> lstlibro = libroService.buscaPorSerie(serie);
		if (CollectionUtils.isEmpty(lstlibro)) {
			return "{\"valid\":true}";
		} else {
			return "{\"valid\":false}";
		}

	}
}
