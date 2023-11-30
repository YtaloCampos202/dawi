package com.centroinformacion.controller;

import com.centroinformacion.entity.Sala;
import com.centroinformacion.entity.Usuario;
import com.centroinformacion.service.SalaService;
import com.centroinformacion.util.AppSettings;
import com.centroinformacion.util.FunctionUtil;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class SalaCrudController {
    @Autowired
    SalaService serviceSala;

    @GetMapping("/buscarNumeroOrRecursosSalaCrud")
    @ResponseBody
    public List<Sala> consultaSalaCrud(@RequestParam String filtro) {
        return serviceSala.buscarNumeroOrRecursosLike(FunctionUtil.stringToLikeAll(filtro));
    }

    @PostMapping("/insertSalaCrud")
    @ResponseBody
    public Map<?, ?> registrarSalaCrud(Sala objSala, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Usuario user = (Usuario) session.getAttribute("objUsuario");
        objSala.setUsuarioRegistro(user);
        objSala.setUsuarioActualiza(user);

        objSala.setEstado(AppSettings.ACTIVO);
        objSala.setFechaRegistro(new Date());
        objSala.setFechaActualizacion(new Date());

        Sala objSalida = serviceSala.insertaSala(objSala);
        serviceSala.buscarNumeroSala("%");
        if (objSalida == null) {
            map.put("MSG", "ERROR AL REGISTRA");
        } else {
            List<Sala> listSala = new ArrayList<>();
            listSala.add(serviceSala.buscaSala(objSalida.getIdSala()).get());
            map.put("lista", listSala);
            map.put("MSG", "Tu registro fue exitoso!");
        }
        return map;
    }

    @PostMapping("/updateSalaCrud")
    @ResponseBody
    public Map<?, ?> actualizarSalaCrud(Sala objSala, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        //Optional
        Sala salaEncontrada = serviceSala.buscaSala(objSala.getIdSala()).get();
        objSala.setUsuarioRegistro(salaEncontrada.getUsuarioRegistro());
        objSala.setFechaRegistro(salaEncontrada.getFechaRegistro());
        objSala.setEstado(salaEncontrada.getEstado());
        //Update new data
        Usuario user = (Usuario) session.getAttribute("objUsuario");
        objSala.setUsuarioActualiza(user);
        objSala.setFechaActualizacion(new Date());

        Sala objSalida = serviceSala.actualizaSala(objSala);
        if (objSalida == null) {
            map.put("MSG", "ERROR AL REGISTRA");
        } else {
            List<Sala> listSala = new ArrayList<>();
            listSala.add(serviceSala.buscaSala(objSalida.getIdSala()).get());
            map.put("lista", listSala);
            map.put("MSG", "!Tu actualización fue exitosa!");
        }
        return map;
    }

    @PostMapping("/cambiarEstadoSalaCrud")
    @ResponseBody
    public Map<?, ?> changeEstadoSalaCrud(int idSala, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        //Buscar Sala Por ID
        Sala objSala = serviceSala.buscaSala(idSala).get();
        //Update new data
        objSala.setFechaActualizacion(new Date());
        objSala.setEstado(objSala.getEstado() == AppSettings.ACTIVO ? AppSettings.INACTIVO : AppSettings.ACTIVO);
        Sala objSalida = serviceSala.actualizaSala(objSala);
        if (objSalida == null) {
            map.put("MSG", "ERROR AL REGISTRA");
        } else {
            List<Sala> listSala = new ArrayList<>();
            listSala.add(serviceSala.buscaSala(objSalida.getIdSala()).get());
            map.put("lista", listSala);
        }
        return map;
    }

    @GetMapping("/buscarNumeroSalaCrud")
    @ResponseBody
    public String validarNumeroSalaCrud(String numeroSala) {

        List<Sala> listNroSala = serviceSala.buscarNumeroSala(numeroSala);

        if (CollectionUtils.isEmpty(listNroSala)) {
            return "{\"valid\" : true }";
        } else {
            return "{\"valid\" : false }";
        }
    }

}
