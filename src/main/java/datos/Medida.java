/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author felip
 */
public class Medida {

    private double peso;
    private int cintura;
    private Date fecha;
    private String persona;

    public Medida(double peso, int cintura, Date fecha, String persona) {
        this.peso = peso;
        this.cintura = cintura;
        this.fecha = fecha;
        this.persona = persona;
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getCintura() {
        return cintura;
    }

    public void setCintura(int cintura) {
        this.cintura = cintura;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Medida{" + "peso=" + peso + ", cintura=" + cintura + ", fecha=" + fecha + '}';
    }

}
