/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helloworld.apispring.controller;

import java.util.Calendar;
import java.util.Random;
import org.springframework.stereotype.Component;

/**
 *
 * @author Jessica Medina
 */
@Component
public class EjemploServcio {

    /**
     * Servicio web que entrega la hora del sistema
     */
    public String horaDelSistema() {
        Calendar now = Calendar.getInstance();
        String hora = now.get(Calendar.HOUR_OF_DAY) + ":" + now.get(Calendar.MINUTE);
        System.out.println("" + hora);
        return hora;
    }

    /**
     * Servicio web Generacion numero Aleatorio GUIA No.3 
     */
    public int generarNumeroAleatorio(int limite) {
        Random rand = new Random();
        int n = rand.nextInt(limite) + 1;
        return n;
    }

    /**
     * Servicio web Crear Pelicula
     */
    
}
