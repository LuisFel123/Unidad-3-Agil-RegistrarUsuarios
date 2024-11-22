/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import datos.Medida;
import datos.Medidas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ActualizarM", urlPatterns = {"/ActualizarM"})
public class ActualizarM extends HttpServlet {

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
            out.println("<title>Servlet ActualizarM</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizarM at " + request.getContextPath() + "</h1>");
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

        String pesoStr = request.getParameter("pesoA");
        String cinturaStr = request.getParameter("cinturaA");
        Date fechaActual = new Date();

        String persona = (String) sesion.getAttribute("usuario");

        double peso = 0;
        int cintura = 0;
        try {
            peso = Double.parseDouble(pesoStr);
            cintura = Integer.parseInt(cinturaStr);
            sesion.setAttribute("peso", String.valueOf(peso));
            sesion.setAttribute("cintura", String.valueOf(cintura));

            Medidas medidasObj = (Medidas) sesion.getAttribute("medidas");
            ArrayList<Medida> medidas;
            medidas = medidasObj.getMedidas();

            if (medidas.size() != 0) {
                Medida ultimaMedida = medidas.get(medidas.size() - 1);
                ultimaMedida.setPeso(peso);
                ultimaMedida.setCintura(cintura);
                ultimaMedida.setFecha(fechaActual);
                ultimaMedida.setPersona(persona);
                System.out.println("Si lo pude actualizar"+medidas.size());
            } else {
                medidas = new ArrayList<>();
                Medida nuevaMedida = new Medida(peso, cintura, fechaActual, persona);
                medidas.add(nuevaMedida);
                sesion.setAttribute("medidas", medidas);
                System.out.println("No lo pude actualizar");
            }

            //sesion.setAttribute("medidas", medidas);
            response.sendRedirect("mostrarMedidas.jsp");
        } catch (NumberFormatException e) {
            response.getWriter().println("Peso o cintura no válidos.");
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
