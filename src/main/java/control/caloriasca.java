/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "caloriasca", urlPatterns = {"/caloriasca"})
public class caloriasca extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet caloriasca</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet caloriasca at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
        String edadStr = request.getParameter("edado");
        String estaturaStr = request.getParameter("estaturao");
        String sexo = request.getParameter("sexoo");
        char sexo1 = sexo.charAt(0);
        
        String pesoStr = request.getParameter("pesoo");
        String opcion = request.getParameter("opciones");
        
        double calculo = 0.0;
        
        int edad = Integer.parseInt(edadStr);
        double estatura = Double.parseDouble(estaturaStr);
        double peso = Double.parseDouble(pesoStr);
        
        double geb;
        if (sexo1 == 'M') {
            geb = 66.5 + (13.75 * peso) + (5.003 * estatura) - (6.75 * edad);
        } else {
            geb = 655 + (9.56 * peso) + (1.85 * estatura) - (4.7 * edad);
        }
        
        System.out.println("GEB calculado: " + geb);
        
        switch (opcion) {
            case "opcion1":
                calculo = geb * 1.3;
                break;
            
            case "opcion2":
                calculo = (sexo1 == 'M') ? geb * 1.6 : geb * 1.5;
                break;
            
            case "opcion3":
                calculo = (sexo1 == 'M') ? geb * 1.7 : geb * 1.6;
                break;
            
            case "opcion4":
                calculo = (sexo1 == 'M') ? geb * 2.1 : geb * 1.9;
                break;
            
            case "opcion5":
                calculo = (sexo1 == 'M') ? geb * 2.4 : geb * 2.2;
                break;
            
            default:
                System.out.println("Opción no válida.");
                break;
        }
        
        System.out.println("Resultado del gasto energético diario: " + calculo);
        sesion.setAttribute("calculoEner", String.valueOf(calculo));
        response.sendRedirect("calorias.jsp");
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
