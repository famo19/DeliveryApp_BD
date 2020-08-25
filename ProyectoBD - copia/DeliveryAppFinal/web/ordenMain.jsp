<%@page import="deliveryapp.objects.userObj"%>
<%@page import="deliveryapp.objects.productoObj"%>
<%@page import="deliveryapp.objects.ordenObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="deliveryapp.objects.direccionObj"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true" %>

<%-- 
    Document   : ordenMain
    Created on : 30/07/2020, 02:05:26 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orden</title>
        
    </head>
    
    <%
       
        ArrayList<direccionObj> dirArray = 
                (ArrayList<direccionObj>) request.getSession()
                        .getAttribute("dirObj");
    %>
    <%
    
        int rows = (int)request.getSession().getAttribute("rows");
         productoObj productObj = (productoObj)request.getSession().getAttribute("ordenobject");
    
    %>
    
    <body>
        <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
       
        String user = currentUser.getEmail();
        request.getSession().setAttribute("us", user);
       
        
        int iId= (int)request.getSession().getAttribute("id");
        if(currentUser!=null)
        {
    %>
    
        user:<%= currentUser.getNombre()%> <%= currentUser.getApellido()%>
        <br>
        type:<%= currentUser.getType().equals("cliente")?"Cliente":"Root" %>
        <br>
        <a href="userServlet?formid=2">Logout</a>
       
        <%
        }
        else{
    %>
        <body>
            <h1>Client Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        </body>
    <%
        }
    %>
        
        
        <h1>Detalles del pedido</h1>
        <br>
            
        
        <table style="width:40%" border="1">
            <tr>
                <th>Nombre</th>
                <th>Existencia</th>
                <th>Precio</th>
            </tr>
              
            <tr>
                <td><%= productObj.getName()%></td>
                <td><%= productObj.getExistencia() %></td>
                <td>$<%=productObj.getPrecio()  %></td>
            </tr>
          
          
        </table>
          <br>
          <br>
          <br>
          
          <form action="ordenServlet" method="get">
              
            <%
                Iterator<direccionObj> iteDir = dirArray.iterator();
            %>
            <label for="direccion">Direccion:</label>
            <br>
            <select id="direccion" name="direccion" required>
              <option value="">--</option>
              <%
                  if(iteDir!=null)
                  {
                      direccionObj temp;
                      while(iteDir.hasNext())
                      {
                          temp = iteDir.next();
              %>
                    <option value="<%= temp.getId() %>"><%= temp.getId()%></option>
              <%
                      }
                  }
              %>
            </select> 
            <br><br>
              <label>Cantidad</label><br>
            <input type="number" id="compra" name="compra" required>
            <input type="submit" value="Comprar"/> 
            <input type="hidden" id="formid" name="formid" value="1">
            <input type="hidden" id="id" name="id" value="<%=iId %>">
        </form>
        
        <a href="menuMain.jsp">Inicio</a>
    </body>
</html>
