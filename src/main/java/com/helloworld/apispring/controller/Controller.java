/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helloworld.apispring.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Jessica Medina
 */
@RestController
@RequestMapping("/config")
public class Controller {

    @Autowired

    private EjemploServcio ejemploservicio;

    @Autowired
    private PeliculaServicio peliculaservicio;

    /**
     * Servicio web que entrega la hora del sistema Guia No. 1
     */
    @RequestMapping(value = "/horas", method = RequestMethod.GET)
    public ResponseEntity<String> obtenerHoraActual() {
        String hora = ejemploservicio.horaDelSistema();
        return new ResponseEntity<String>(hora, HttpStatus.OK);

    }

    /**
     * Servicio web Generacion numero Aleatorio GUIA No.2
     */
    @RequestMapping(value = "/numAleatorios", method = RequestMethod.GET)
    public ResponseEntity<String> obtenerNumAleatorio(@RequestParam("limite") int limite) {
        String numeroAleatorio = ejemploservicio.generarNumeroAleatorio(limite) + "";
        return new ResponseEntity<String>(numeroAleatorio, HttpStatus.OK);
    }

    /**
     * Servicio web crear pelicula
     */
    @RequestMapping(value = "/peliculas", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> crearPelicula(@RequestBody Pelicula pelicula) {
        String nombre = peliculaservicio.guardarPelicula(pelicula);
        return new ResponseEntity<String>(nombre, HttpStatus.OK);
    }

    @RequestMapping(value = "/peliculas", method = RequestMethod.GET)
    public ResponseEntity<List<Pelicula>> obtenerPeliculas() {
        List<Pelicula> resultado = peliculaservicio.obtenerPeliculas();
        return new ResponseEntity<List<Pelicula>>(resultado, HttpStatus.OK);
    }

}
