/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import datos.Persona;
import datos.Personas;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author felip
 */
@WebServlet(name = "Acceso", urlPatterns = {"/Acceso"})
public class Acceso extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje = "";

        HttpSession sesion = request.getSession();

        Personas perso = (Personas) sesion.getAttribute("personas");
        if (perso == null) {
            perso = new Personas();
            Date fechaA = new Date();
            perso.addPersona(new Persona("luis", "1234", 21, 1.65, 'M', 67, fechaA));
            perso.addPersona(new Persona("erika", "1234", 23, 1.56, 'F', 70, fechaA));
            sesion.setAttribute("personas", perso);
        }

        if (request.getParameter("registro") != null) {
            response.sendRedirect("registro_persona.jsp");
            return;
        }

        if (request.getParameter("ingreso") != null) {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            Persona buscadaPer = perso.buscarPorUsuario(usuario);
            sesion.setAttribute("edad", String.valueOf(buscadaPer.getEdad()));
            sesion.setAttribute("estatura", String.valueOf(buscadaPer.getEstatura()));
            sesion.setAttribute("cadera", String.valueOf(buscadaPer.getCadera()));
            sesion.setAttribute("sexo1", String.valueOf(buscadaPer.getSexo()));
            sesion.setAttribute("fechaN", String.valueOf(buscadaPer.getFechaNacimiento()));

            if (perso.isVacio()) {
                mensaje = "Tienes que registrarte";
                sesion.setAttribute("mensaje", mensaje);
                response.sendRedirect("index.jsp");
                return;
            } else if (perso.personas(usuario, password) == null) {
                mensaje = "No existe un usuario con esa contraseña, regístrate";
                sesion.setAttribute("mensaje", mensaje);
                response.sendRedirect("index.jsp");
                return;
            } else {
                mensaje = "Bienvenido, " + usuario;
                sesion.setAttribute("mensaje", mensaje);
                response.sendRedirect("home.jsp");
                sesion.setAttribute("usuario", usuario);
                return;
            }
        }

        if (request.getParameter("usuario1") != null && request.getParameter("password1") != null) {
            String usuario1 = request.getParameter("usuario1");
            String contraseña1 = request.getParameter("password1");
            String fecha = request.getParameter("fechaNacimiento");

            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

            Date fechaNacimiento = null;
            try {
                fechaNacimiento = formato.parse(fecha);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            int edad = 0;
            double estatura = 0.0;
            int cadera = 0;

            try {
                if (request.getParameter("edad") != null && !request.getParameter("edad").isEmpty()) {
                    edad = Integer.parseInt(request.getParameter("edad"));

                }

                if (request.getParameter("estatura") != null && !request.getParameter("estatura").isEmpty()) {
                    estatura = Double.parseDouble(request.getParameter("estatura"));

                }

                if (request.getParameter("cadera") != null && !request.getParameter("cadera").isEmpty()) {
                    cadera = Integer.parseInt(request.getParameter("cadera"));
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                sesion.setAttribute("mensaje", "Error en el formato de los parámetros numéricos.");
                response.sendRedirect("registro_persona.jsp");
                return;
            }

            String sexo = request.getParameter("sexo");
            char sexo1 = (sexo != null && !sexo.isEmpty()) ? sexo.charAt(0) : ' ';

            Persona registrarPerso = new Persona(usuario1, contraseña1, edad, estatura, sexo1, cadera, fechaNacimiento);
            perso.addPersona(registrarPerso);

            sesion.setAttribute("personas", perso);

            if (perso.buscarPersona(registrarPerso)) {
                sesion.setAttribute("mensaje", "Registro realizado correctamente.");
                response.sendRedirect("index.jsp");
            } else {
                sesion.setAttribute("mensaje", "El registro no se pudo completar. Intente de nuevo.");
                response.sendRedirect("registro_persona.jsp");
            }
            return;
        }

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
