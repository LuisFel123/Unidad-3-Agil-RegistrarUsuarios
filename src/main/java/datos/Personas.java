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
public class Personas {

    private ArrayList<Persona> personas;

    public Personas() {
        personas = new ArrayList();
    }

    public void addPersona(Persona p) {
        personas.add(p);
    }

    public ArrayList<Persona> personas() {
        return personas;
    }

    public Persona personas(String u, String p) {
        for (int np = 0; np < personas.size(); np++) {
            if (personas.get(np).getUsuario().equals(u) && personas.get(np).getPassword().equals(p)) {
                return personas.get(np);
            }

        }
        return null;
    }

    public boolean isVacio() {
        return personas.isEmpty();
    }

    public boolean buscarPersona(Persona personaBuscada) {
        if (personas.contains(personaBuscada)) {
            System.out.println("La persona fue encontrada.");
            return true;
        } else {
            System.out.println("La persona no fue encontrada.");
            return false;
        }
    }

    public Persona buscarPorUsuario(String usuario) {
        for (Persona persona : personas) {
            if (persona.getUsuario().equals(usuario)) {
                return persona;
            }
        }
        return null;
    }

}
