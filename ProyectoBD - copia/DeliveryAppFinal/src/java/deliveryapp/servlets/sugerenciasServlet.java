/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import deliveryapp.logic.sugerenciasLogic;
import deliveryapp.logic.userLogic;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "sugerenciasServlet", urlPatterns = {"/sugerenciasServlet"})
public class sugerenciasServlet extends HttpServlet {

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
        
        String strConnString = "jdbc:mysql://localhost/aplicacion_domicilio?"
                             + "user=root&password=12345&" + "autoReconnect=true&useSSL=false&serverTimezone=UTC";
        String strFormId = request.getParameter("formid");
        
        int rows, iId_us, iId_ord, rows2;
        request.getSession().setAttribute("rows", 0);
        sugerenciasLogic logic;
        userLogic logic2;
        String strId, strEmail, strEmail2;
        
        switch (strFormId) 
        {
            case "1":                
                System.out.println("code for insert new...");
                //al inicio
                String Asunto = request.getParameter("asunto");
                String Descripcion = request.getParameter("descripcion");
              
                logic = new sugerenciasLogic(strConnString);
                logic2 = new userLogic(strConnString);
                strEmail= (String)request.getSession().getAttribute("us");
                System.out.println("El correo es: "+strEmail);
                
                
                strEmail2 = logic2.getUserByEmail(strEmail).getEmail();
                
                //al final
                
                rows = logic.insertNewSugerencias(strEmail2, Asunto, Descripcion);
                request.getSession().setAttribute("rows", rows);
                response.sendRedirect("cliente_dash.jsp");
                
                break;
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
        processRequest(request, response);
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