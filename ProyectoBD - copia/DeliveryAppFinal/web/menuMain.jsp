<%-- 
    Document   : menuMain
    Created on : 29/07/2020, 01:53:00 PM
    Author     : franc
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="deliveryapp.objects.productoObj"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home </title>
        
    </head>
    
    <%
        int rows = (int)request.getSession().getAttribute("rows");
        ArrayList<productoObj> array = (ArrayList<productoObj>)request.getSession().getAttribute("productoarray");
    %>
    
    <body>
         <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
        String user = currentUser.getEmail();
        
        request.getSession().setAttribute("us", user);
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
       
            <h1>Client Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        
    <%
        }
    %>
        <h1>Producto Main</h1>
        <br>
        
        <table style="width:40%" border="1">
          <tr>
            <th>Nombre</th>
            <th>Existencia</th>
            <th>Precio</th>
          </tr>
          <%
              Iterator<productoObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  productoObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getName()%></td>
                      <td><%= temp.getExistencia()%></td>
                      <td>$<%= temp.getPrecio() %></td>
                      <td><a href="productoServlet?formid=2&id=<%= temp.getId()%>" style="text-decoration: none">Ordenar</a></td>
                    </tr>
          <%
                   }
                  
             
              }



          %>
          
        </table>
          <br>
          <br>
          <br>
          <br>
          <br>
          <h1>¿Sugerencias?</h1>
          
          <a href="sugerencias.jsp" style="text-decoration: none">Llena este formulario</a>
          <br>
          <br>
          <br>
          <br>
          
          <a href="cliente_dash.jsp">Ir a Dashboard</a>
    </body>
</html>