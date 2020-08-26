<%-- 
    Document   : myDir
    Created on : 26/08/2020, 10:26:31 AM
    Author     : franc
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page import="deliveryapp.objects.userObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="deliveryapp.objects.direccionObj"%>
<%@page import="deliveryapp.objects.direccionObj"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dirección</title>
    </head>
    <%
    ArrayList<direccionObj> array = (ArrayList<direccionObj>)request.getSession().getAttribute("dirarray");
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
            <th>Departamento</th>
            <th>Municipio</th>
            <th>Colonia</th>
            <th>Número casa</th>
          </tr>
          <%
              Iterator<direccionObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  direccionObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getDireccion()%></td>
                      <td><%= temp.getMunicipio()%></td>
                      <td><%= temp.getColonia() %></td>
                      <td><%= temp.getNumCasa()%></td>
                      
                    </tr>
          <%
                   }
                  
             
              }



          %>
          
        </table>
          <br>
          <br>
          <br>
          <a href="cliente_dash.jsp">Ir a dashboard</a>
    </body>
</html>
