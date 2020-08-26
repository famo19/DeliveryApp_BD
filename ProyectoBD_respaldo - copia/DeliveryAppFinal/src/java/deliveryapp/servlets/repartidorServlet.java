/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliveryapp.servlets;

import deliveryapp.logic.repartidorLogic;
import deliveryapp.objects.repartidorViewObj;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author franc
 */
@WebServlet(name = "repartidorServlet", urlPatterns = {"/repartidorServlet"})
public class repartidorServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String strConnString = "jdbc:mysql://localhost/aplicacion_domicilio?"
                + "user=root&password=12345&"
                + "autoReconnect=true&useSSL=false";
        String strFormId = request.getParameter("formid");
        repartidorLogic logic;
        request.getSession().setAttribute("rows", 0);
        
       String strProfesor, strAula, strAlumno, strName, strId;
        int iIdProfesor, iIdAula, iIdAlumno, rows, iId;
        /*TeacherLogic teacherLogic;
        StudentLogic studentLogic;
        ClassroomLogic classroomLogic;
        ArrayList<TeacherObj> teacherArray;
        ArrayList<StudentObj> studentArray;
        ArrayList<ClassroomObj> classroomArray;*/
        
        switch(strFormId)
        {
            
            case "1":
                System.out.println("Get Repartidor View...");
                //enmedio
                logic = new repartidorLogic(strConnString);
                ArrayList<repartidorViewObj> repartidorListArray = logic.getAllOrdersView();
                
                //al final
                request.getSession().setAttribute("repartidorListArray", repartidorListArray);
                response.sendRedirect("repartidorView.jsp");
                
                break;
            
            
                
            case"3":
                
                break;
                
            default:
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
