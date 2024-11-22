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
public class Persona {

    private String usuario;
    private String password;
    private int edad;
    private double estatura;
    private char sexo;
    private int cadera;
    private Date fechaNacimiento;
    private ArrayList<Medidas> medidasT;

    // Constructor que asegura que medidasT no sea null
    public Persona(String u, String p, int e, double es, char se, int c, Date fechaN) {
        usuario = u;
        password = p;
        edad = e;
        estatura = es;
        sexo = se;
        cadera = c;
        fechaNacimiento = fechaN;

    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    // Getters y Setters
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public int getCadera() {
        return cadera;
    }

    public void setCadera(int cadera) {
        this.cadera = cadera;
    }

    public void addMedida(Medidas medida) {
        if (this.medidasT == null) {
            this.medidasT = new ArrayList<>();
        }
        this.medidasT.add(medida);
    }
}
