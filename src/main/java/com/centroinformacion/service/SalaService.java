package com.centroinformacion.service;


import java.util.List;
import java.util.Optional;

import com.centroinformacion.entity.Sala;

public interface SalaService {

    public abstract Sala insertaSala(Sala obj);
    public abstract Sala actualizaSala(Sala obj);
    public abstract Optional<Sala> buscaSala(int idSala);

    public abstract List<Sala> buscarNumeroSala(String numeroSala);
    public abstract List<Sala> buscarNumeroOrRecursosLike(String filtro);

    List<Sala> buscarSalaConsultaFiltrar( String numero, int piso, String recursos, int numAlumnos, int idSede,int idTipoSala,int estado);
}
