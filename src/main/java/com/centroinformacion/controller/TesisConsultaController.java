package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Tesis;
import com.centroinformacion.service.TesisService;

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
public class TesisConsultaController {

	@Autowired
	private TesisService service;

	@RequestMapping("/verConsultaTesis")
	public String verInicio() {
		return "consultaTesis";
	}

	@GetMapping("/consultaTesis")
	@ResponseBody
	public List<Tesis> consulta(String titulo, 
								int estado,
			 					String tema,
								int idAlumno){
		List<Tesis> lstSalida = service.listaConsultaTesis("%"+titulo+"%", estado, "%"+tema+"%", idAlumno);
		
		return lstSalida;
	}
	
	@GetMapping("/reporteTesisPdf")
	public void reporte(HttpServletRequest request, 
						HttpServletResponse response,
						String paramTitulo,
						boolean paramEstado,
						String paramTema,
						int paramAlumno) {
		
		try {
			
			//PASO 1: Obtener el dataSource que va generar el reporte
			List<Tesis> lstSalida = service.listaConsultaTesis(
							"%"+paramTitulo+"%",
							paramEstado?1:0, 
							"%"+paramTema+"%",
							paramAlumno);
			
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
			
			//PASO 2: Obtener el archivo que contiene el diseño del reporte
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reporteTesis.jasper");
			log.info(">>> " + fileDirectory);
			FileInputStream stream   = new FileInputStream(new File(fileDirectory));
			
			//PASO 3: Parámetros adicionales
			Map<String,Object> params = new HashMap<String,Object>();
		
			
			//PASO 4: Enviamos dataSource, diseño y parámetros para generar el PDF
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
			
			//PASO 5: Enviar el PDF generado
			response.setContentType("application/x-pdf");
		    response.addHeader("Content-disposition", "attachment; filename=ReporteTesis.pdf");

			OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
