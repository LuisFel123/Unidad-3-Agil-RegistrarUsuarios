/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import java.util.ArrayList;

/**
 *
 * @author felip
 */
public class Medidas {

    private ArrayList<Persona> personas;
    private ArrayList<Medida> medidas;

    public Medidas() {
        medidas = new ArrayList();

    }


    public ArrayList<Persona> getPersonas() {
        return personas;
    }

    public void setPersonas(ArrayList<Persona> personas) {
        this.personas = personas;
    }

    public ArrayList<Medida> getMedidas() {
        return medidas;
    }

    public void setMedidas(ArrayList<Medida> medidas) {
        this.medidas = medidas;
    }

    public void addMedida(Medida medida) {
        medidas.add(medida);
    }

}
