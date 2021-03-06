
package deliveryapp.servlets;

import deliveryapp.logic.ordenLogic;
import deliveryapp.logic.productoLogic;
import deliveryapp.logic.userLogic;
import deliveryapp.objects.direccionObj;
import deliveryapp.objects.rootViewObj;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ordenServlet", urlPatterns = {"/ordenServlet"})
public class ordenServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String strConnString = "jdbc:mysql://localhost/aplicacion_domicilio?"
                             + "user=root&password=12345&" + "autoReconnect=true&useSSL=false&serverTimezone=UTC";
        String strFormId = request.getParameter("formid");
        
        int rows, iId_us, iId_ord, rows2, iId;
        request.getSession().setAttribute("rows", 0);
        productoLogic logic;
        ordenLogic logic2;
        userLogic logic3;
        String strId, strEmail;
        ArrayList<direccionObj> dirObj;
        
        switch (strFormId) 
        {
            case "1":                
                System.out.println("code for insert new...");
                //al inicio
                int cantidad = Integer.parseInt((request.getParameter("compra")));
                int ID = Integer.parseInt(request.getParameter("id"));
                System.out.print(ID);
                int id_dir = Integer.parseInt((request.getParameter("direccion")));
                
                //enmedio
                logic = new productoLogic(strConnString);
                double precio = logic.getPrecioById(ID).getPrecio();
                logic2= new ordenLogic(strConnString);
                String date = logic2.fecha();
                Double total = precio*cantidad;
                rows = logic2.insertNewOrden(cantidad, total, date, ID);
                //orden_productos
                logic3 = new userLogic(strConnString);
                strEmail= (String)request.getSession().getAttribute("us");
                System.out.println("El correo es: "+strEmail);
               
                
                iId_us = logic3.getUserByEmail(strEmail).getId();
                iId_ord = logic2.getId_Orden();
                rows2 = logic2.insertNewOrden_Producto(ID, iId_ord, iId_us, id_dir);
                
                System.out.println("get all directions  ...");   
                
            
                dirObj = logic2.getAllDirections(iId_us);
                System.out.println(dirObj); 
                request.getSession().setAttribute("dirObj", dirObj);
                
                
                //al final
                
                request.getSession().setAttribute("rows", rows);
                response.sendRedirect("finalOrderMain.jsp");
                
                break;
                
            case "2":
                System.out.println("Selecting Root View  ...");
                
                
                //enmedio
                logic2 = new ordenLogic(strConnString);
                ArrayList<rootViewObj> orderArray = logic2.getAllOrdersView();
                
                //al final
                request.getSession().setAttribute("orderarray", orderArray);
                response.sendRedirect("rootMain.jsp");
                
                break;
                
            case "3":
                System.out.println("Updating orden...");
                //al inicio
                int id_orden = Integer.parseInt((request.getParameter("id_orden")));
                System.out.print(id_orden);
                
                
                //enmedio, PT= Pedido Tomado
                logic2= new ordenLogic(strConnString);
                rows=logic2.updateOrden(id_orden);
                
                //final
                request.getSession().setAttribute("rows", rows);
               
                response.sendRedirect("repartidorServlet?formid=1");
                break;
                
            case "4":
                System.out.println("Showing addresses...");
                //Inicio
                 strEmail = (String)request.getSession().getAttribute("us");
              
                //Enmedio
                logic3 = new userLogic(strConnString);
                iId_us = logic3.getUserByEmail(strEmail).getId();
                logic2 = new ordenLogic(strConnString);
                ArrayList<direccionObj> dirArray = logic2.getAllDirections(iId_us);
                
                //Final
                request.getSession().setAttribute("dirarray", dirArray);
                response.sendRedirect("myDir.jsp");
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
