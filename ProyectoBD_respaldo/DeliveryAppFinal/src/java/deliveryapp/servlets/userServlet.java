
package deliveryapp.servlets;

import deliveryapp.logic.userLogic;
import deliveryapp.objects.userObj;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "userServlet", urlPatterns = {"/userServlet"})
public class userServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String strConnString = "jdbc:mysql://localhost/aplicacion_domicilio?"
                             + "user=root&password=12345&" + "autoReconnect=true&useSSL=false&serverTimezone=UTC";
        String strFormId = request.getParameter("formid");
        String email, password, strEmail;
        userLogic logic;
        String message = "";
        userLogic logic4 = new userLogic(strConnString);
        userLogic logic5 = new userLogic(strConnString);
        userLogic logic6 = new userLogic(strConnString);
        userLogic logic7 = new userLogic(strConnString);
        userLogic logic8 = new userLogic(strConnString);
        int rows, iId_us;
        
        switch (strFormId) 
        {
            case "1":
                //traer con un select el registro filtrado por email
                //al inicio
                email = request.getParameter("user");
                password = request.getParameter("pass");
                
                //enmedio
                logic = new userLogic(strConnString);
                userObj userObjects = logic.getUserByEmail(email);
                boolean bValidUser=false;
                
                
                if(userObjects!=null)
                {
                    //viene userObject
                    if(userObjects.getPass().equals(password))
                    {
                        //es usuario valido!! yay!!
                        bValidUser = true;
                    }
                    else
                    {
                        //el password es incorrecto
                        message = "Su informacion es incorrecta, intente de nuevo";
                    }
                }
                else
                {
                    //el usuario no existe
                    message = "Su informacion es incorrecta, intente de nuevo";
                }
                
                //al final
                if(bValidUser) 
                {
                    if (userObjects!=null)
                    {
                        if (userObjects.getType().equals("cliente"))
                        {
                            request.getSession().setAttribute("current_user", userObjects);
                            request.getSession().removeAttribute("message");
                            response.sendRedirect("cliente_dash.jsp");
                        }
                        else
                        {
                            request.getSession().setAttribute("current_user", userObjects);
                            request.getSession().removeAttribute("message");
                            response.sendRedirect("root_dash.jsp");
                        }
                    }
                }
                else
                {
                    request.getSession().setAttribute("message", message);
                    response.sendRedirect("index.jsp");                
                }
                break;
            case "2":
                
                request.getSession().removeAttribute("current_user");
                request.getSession().removeAttribute("message");
                response.sendRedirect("index.jsp");
                
                break;
            case "3":
                
                break;
            case "4": 
                //codigo para insert en la base de datos
                String nombreC = request.getParameter("nombre");
                String apellidoC = request.getParameter("apellido");
                String telefonoC = request.getParameter("telefono");
                String correoC = request.getParameter("email");
                String contrasenaC = request.getParameter("contrasena");
                String tipoC = "cliente";
                int placaC = 1;
              
                //INGRESAR A LA BD
                rows = logic4.registerNewUser(nombreC, apellidoC, telefonoC, correoC, contrasenaC, tipoC, placaC);
                
                //REDIRECCIONAR
                response.sendRedirect("registroClienteDireccion.jsp");
            break;    
            case "5":     
                //codigo para insert en la base de datos
                String departamento = request.getParameter("departamento");
                String municipio = request.getParameter("municipio");
                String colonia = request.getParameter("colonia");
                String casa = request.getParameter("casa");

                //INGRESAR A LA BD
                int id = logic5.getId_Usuario();
                rows = logic5.registerNewClientDirection(departamento, municipio, colonia, casa, id);
                
                //REDIRECCIONAR
                response.sendRedirect("registroResponse.jsp");
            break;
            case "6": 
                //codigo para insert en la base de datos
                String nombreA = request.getParameter("nombre");
                String apellidoA = request.getParameter("apellido");
                String telefonoA = request.getParameter("telefono");
                String correoA = request.getParameter("email");
                String contrasenaA = request.getParameter("contrasena");
                String tipoA = "root";
                int placaA = 1;

                //INGRESAR A LA BD
                rows = logic6.registerNewUser(nombreA, apellidoA, telefonoA, correoA, contrasenaA, tipoA, placaA);
                
                //REDIRECCIONAR
                response.sendRedirect("registroResponse.jsp");
            break;
            case "7": 
                //codigo para insert en la base de datos
                String nombreR = request.getParameter("nombre");
                String apellidoR = request.getParameter("apellido");
                String telefonoR = request.getParameter("telefono");
                String correoR = request.getParameter("email");
                String contrasenaR = request.getParameter("contrasena");
                String tipoR = "repartidor";
                String placaR = request.getParameter("placa");
                int placaConverted = Integer.parseInt(placaR);

                //INGRESAR A LA BD
                rows = logic7.registerNewUser(nombreR, apellidoR, telefonoR, correoR, contrasenaR, tipoR, placaConverted);
                
                //REDIRECCIONAR
                response.sendRedirect("registroResponse.jsp");
            break;
            case "8":     
                //codigo para insert en la base de datos
                String departamentoE = request.getParameter("departamento");
                String municipioE = request.getParameter("municipio");
                String coloniaE = request.getParameter("colonia");
                String casaE = request.getParameter("casa");

                //INGRESAR A LA BD
                
                logic8 = new userLogic(strConnString);
                strEmail= (String)request.getSession().getAttribute("us");
                System.out.println("El correo es: "+strEmail);
                
                iId_us = logic8.getUserByEmail(strEmail).getId();
                
                rows = logic8.registerNewClientDirection(departamentoE, municipioE, coloniaE, casaE, iId_us);
                
                //REDIRECCIONAR
                response.sendRedirect("cliente_dash.jsp");
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
