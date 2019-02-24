/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helloworld.apispring.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/**
 *
 * @author Jessica Medina
 */
@Component
public class PeliculaServicio {

    public String guardarPelicula(Pelicula pelicula) {
        return pelicula.getNombre();
    }

    public List<Pelicula> obtenerPeliculas() {
        List<Pelicula> peliculas = new ArrayList<>();
        peliculas.add(new Pelicula("Hulk", "Acción"));
        peliculas.add(new Pelicula("Capitana Marvel", "Acción"));
        peliculas.add(new Pelicula("Como entrenar a tu dragon 3", "Infantil"));
        return peliculas;
    }

}
