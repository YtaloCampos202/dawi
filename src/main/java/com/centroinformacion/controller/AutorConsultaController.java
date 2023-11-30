package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Autor;
import com.centroinformacion.service.AutorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.apachecommons.CommonsLog;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
@CommonsLog
public class AutorConsultaController {

	@Autowired
	private AutorService autorService;


	
	@GetMapping("/consultaAutor")
	@ResponseBody
	public List<Autor> consulta (int estado, 
									int idPais,
									int idGrado,
									String nomApe, 
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date desde,
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta){
		
		List<Autor> lstSalida = autorService.listaConsultaAutor(estado, idPais, idGrado, "%"+nomApe+"%", desde, hasta);
		
		return lstSalida;
	}
	
	@GetMapping("/reporteAutorPdf")
	@ResponseBody
	public void report(HttpServletRequest request, HttpServletResponse response,
			boolean paramEstado,
			int paramPais,
			int paramGrado,
			String paramNomApe, 
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramDesde,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramHasta ) {
		
		try {
			
			//PASO 1: Obtener el dataSource que va generar el reporte
			List<Autor> lstSalida = autorService.listaConsultaAutor(paramEstado?1:0, 
																			 paramPais, 	
																			 paramGrado, 
																			 "%" + paramNomApe + "%" ,
																			 paramDesde, 
																			 paramHasta);
			
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
			
			//PASO 2: Obtener el archivo que contiene el diseño del reporte
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reportesAutor.jasper");
			log.info(">>> " + fileDirectory);
			FileInputStream stream   = new FileInputStream(new File(fileDirectory));
			
			//PASO 3: Parámetros adicionales
			String fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/shakespeare.png");

			Map<String, Object> params = new HashMap<String, Object>();
			params.put("LOGO", fileLogo);
		
			
			//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
			
			//PASO 5: Enviar el PDF generado
			response.setContentType("application/x-pdf");
		    response.addHeader("Content-disposition", "attachment; filename=ReporteAutor.pdf");

			OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}