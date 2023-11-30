package com.centroinformacion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.centroinformacion.entity.Opcion;


public interface OpcionService {

	public abstract List<Opcion> listaOpcion();
}
