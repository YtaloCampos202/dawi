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

import com.centroinformacion.entity.Alumno;
import com.centroinformacion.service.AlumnoService;

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
public class AlumnoConsultaController {
	
	@Autowired
	private AlumnoService alumnoService;
	
	@GetMapping("/consultaAlumno")
	@ResponseBody
	public List<Alumno>consulta (int estado,
								int idPais,
								int idModalidad,
								String nombrec, 
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date desde,
								@DateTimeFormat(pattern = "yyyy-MM-dd") Date hasta,
								String dni){
		List<Alumno>lstSalida = alumnoService.listarConsultaAlumno(estado,idPais, idModalidad, "%"+nombrec+"%", desde, hasta, dni);
	
	return lstSalida;
	}
	
	@GetMapping("/reporteAlumnoPdf")
	@ResponseBody
	public void report(HttpServletRequest request, HttpServletResponse response,
			boolean paramEstado,
			int paramPais,
			int paramModalidad,
			String paramNombrec, 
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramDesde,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date paramHasta,
			String paramDni ) {
		
		try {
			
			
			List<Alumno> lstSalida = alumnoService.listarConsultaAlumno(paramEstado?1:0, 
																			 paramPais, 	
																			 paramModalidad,
																			 "%" + paramNombrec + "%" , 
																			 paramDesde, 
																			 paramHasta,
																			 paramDni);
			
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
			
			
			String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reporteAlumno.jasper");
			log.info(">>> " + fileDirectory);
			
			FileInputStream stream   = new FileInputStream(new File(fileDirectory));

			String fileLogo = request.getServletContext().getRealPath("/WEB-INF/img/molecula.png");

			Map<String, Object> params = new HashMap<String, Object>();
			params.put("LOGO", fileLogo);
		
			JasperReport jasperReport = (JasperReport) JRLoader.loadObject(stream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		
			response.setContentType("application/x-pdf");
		    response.addHeader("Content-disposition", "attachment; filename=ReporteAlumno.pdf");

			OutputStream outStream = response.getOutputStream();
			JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
