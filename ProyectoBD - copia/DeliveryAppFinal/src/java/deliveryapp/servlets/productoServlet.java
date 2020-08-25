package deliveryapp.servlets;

import deliveryapp.logic.productoLogic;
import deliveryapp.objects.productoObj;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "productoServlet", urlPatterns = {"/productoServlet"})
public class productoServlet extends HttpServlet 
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String strConnString = "jdbc:mysql://localhost/aplicacion_domicilio?"
                             + "user=root&password=12345&" + "autoReconnect=true&useSSL=false&serverTimezone=UTC";
        String strFormId = request.getParameter("formid");
        
        int rows, iId;
        String strName;
        String strProfession;
        String strId;
        request.getSession().setAttribute("rows", 0);
        productoLogic logic;
        
        switch (strFormId) 
        {
         
            case "1":
                System.out.println("code for select...");
                
                //enmedio
                logic = new productoLogic(strConnString);
                ArrayList<productoObj> productoArray = logic.getAllProducts();
                
                //al final
                request.getSession().setAttribute("productoarray", productoArray);
                response.sendRedirect("menuMain.jsp");
                
                break;
                
            case "2":
                System.out.println("code for select ...");
                //al inicio
                strId = request.getParameter("id");
                iId = Integer.parseInt(strId);
                
                //enmedio
                logic = new productoLogic(strConnString);
                productoObj ordenObject = logic.getOrdenById(iId);
                
                //al final
                request.getSession().setAttribute("id", iId);
                request.getSession().setAttribute("ordenobject", ordenObject);
                response.sendRedirect("ordenMain.jsp");
                
                break;
                
            case "3":
                //FALTA PROBAR SI SIRVE
                System.out.println("code for delete row from view...");
                
                //al inicio
                strId = request.getParameter("id");
                iId = Integer.parseInt(strId);
                
                //enmedio
                logic = new productoLogic(strConnString);
                //METER ID DE ARTICULO
                rows = logic.deleteRowView(iId);
                
                //al final
                request.getSession().setAttribute("rows", rows);
                response.sendRedirect("repartidorServlet?formid=1");
                
                break;
                
                
            case "4":
                //FALTA PROBAR SI SIRVE
                System.out.println("code for delete producto from view...");
                
                //al inicio
                strId = request.getParameter("id");
                iId = Integer.parseInt(strId);
                
                //enmedio
                logic = new productoLogic(strConnString);
                //METER ID DE ARTICULO
                rows = logic.deleteProducto(iId);
                
                //al final
                request.getSession().setAttribute("rows", rows);
                response.sendRedirect("ordenServlet?formid=2");
                
                break;
                
            case "5":
                //FALTA PROBAR SI SIRVE
                System.out.println("code for delete orden from view...");
                
                //al inicio
                strId = request.getParameter("id");
                iId = Integer.parseInt(strId);
                
                //enmedio
                logic = new productoLogic(strConnString);
                //METER ID DE ARTICULO
                rows = logic.deleteOrden(iId);
                
                //al final
                request.getSession().setAttribute("rows", rows);
                response.sendRedirect("ordenServlet?formid=2");
                
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
