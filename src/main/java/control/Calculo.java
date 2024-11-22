/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import datos.Medida;
import datos.Medidas;
import datos.Persona;
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
@WebServlet(name = "Calculo", urlPatterns = {"/Calculo"})
public class Calculo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("mostrarMedidas.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String pesoStr = request.getParameter("peso");
        String cinturaStr = request.getParameter("cintura");
        String fechaStr = request.getParameter("fecha");
        Date fechaActual = new Date();
        String mensaje = "";

        double peso = 0.0;
        int cintura = 0;
        String fecha = null;

        try {
            peso = Double.parseDouble(pesoStr);
            cintura = Integer.parseInt(cinturaStr);
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fecha = formato.format(fechaActual);
            sesion.setAttribute("fecha", fecha);

        } catch (Exception e) {
            System.out.println("Error en la conversión de los datos: " + e.getMessage());
            return;
        }
        Medida medida = null;
        String nombre = (String) sesion.getAttribute("usuario");
        if ((peso > 39) && (peso < 151) && ((cintura > 50) && (cintura < 101))) {
            medida = new Medida(peso, cintura, fechaActual, nombre);
            sesion.setAttribute("alerta", mensaje);
            Object obj = sesion.getAttribute("medidas");
            Medidas medidas = null;
            if (obj instanceof Medidas) {
                medidas = (Medidas) obj;
            }
            if (medidas == null) {
                medidas = new Medidas();
                sesion.setAttribute("medidas", medidas);
            }

            if (medida != null) {
                medidas.addMedida(medida);
                sesion.setAttribute("listaM", medidas);
                //response.sendRedirect("mostrarMedidas.jsp");
            }
            if (request.getParameter("calculo") != null) {
                sesion.setAttribute("peso", pesoStr);
                sesion.setAttribute("cintura", cinturaStr);
                response.sendRedirect("medidas.jsp");
            } else if (request.getParameter("registrar") != null) {
                sesion.setAttribute("peso", pesoStr);
                sesion.setAttribute("cintura", cinturaStr);
                response.sendRedirect("mostrarMedidas.jsp");

            } else if (request.getParameter("otro") != null) {

            }

        } else {
            response.sendRedirect("medidas.jsp");
            mensaje = "Verifique que los datos sean correctos";
            sesion.setAttribute("alerta", mensaje);
            System.out.println("ENTRO A VERIFIQUE QUE LOS DATOS SEAN CORRECTOS");

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
