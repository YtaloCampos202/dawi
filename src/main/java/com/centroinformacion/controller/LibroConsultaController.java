package com.centroinformacion.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.centroinformacion.entity.Libro;
import com.centroinformacion.service.LibroService;

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
public class LibroConsultaController {

	@Autowired
	private LibroService libroService;

	@GetMapping("/consultaLibro")
	@ResponseBody
	public List<Libro> consulta(int estado, int idCategoria, int idTipo, String titulo, String serie, String anio) {
		List<Libro> lstSalida = libroService.listaConsultaLibro(estado, idCategoria, idTipo, "%" + titulo + "%",
				"%" + serie + "%", anio);
		return lstSalida;
	}

	@GetMapping("/reporteLibroPdf")
	public void reporte(HttpServletRequest request,
						HttpServletResponse response,
						boolean paramEstado,
						int paramCategoria,
						int paramTipo,
						String paramTitulo,
						String paramSerie,
						String paramAnio) {
		try {
			//List<Libro> lstSalida=libroService.listaConsultaLibro(paramAnio, paramCategoria, paramTipo, paramTitulo, paramSerie, paramAnio);
			
			List<Libro> lstSalida=libroService.listaConsultaLibro(paramEstado?1:0,
					paramCategoria,paramTipo,"%"+paramTitulo+"%","%"+paramSerie+"%",paramAnio.isEmpty()?"-1":paramAnio);

			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(lstSalida);
		String fileDirectory = request.getServletContext().getRealPath("/WEB-INF/reportes/reporteLibros.jasper");
		log.info(">> FILE >> " + fileDirectory);
		
		FileInputStream stream = new FileInputStream(new File(fileDirectory));		
		
		String fileLogo=request.getServletContext().getRealPath("/WEB-INF/img/chico.png");
		log.info(">> LOGO >> " + fileLogo);
		
		HashMap<String,Object>params=new HashMap<String,Object>();
		params.put("LOGO",fileLogo);
		
		JasperReport jasperReport =(JasperReport) JRLoader.loadObject(stream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		
		response.setContentType("applicaction/x-pdf");
		response.addHeader("Content-disposition","attachment; filename=ReporteLibro.pdf");
		
		OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,outStream);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
