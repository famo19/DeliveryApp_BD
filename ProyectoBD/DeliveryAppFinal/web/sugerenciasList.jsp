<%-- 
    Document   : sugerenciasList
    Created on : 26/08/2020, 04:07:59 PM
    Author     : franc
--%>


<%@page import="deliveryapp.objects.userObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="deliveryapp.objects.sugerenciasObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       
        ArrayList<sugerenciasObj> array = (ArrayList<sugerenciasObj>)request.getSession().getAttribute("sugestarray");
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
       
            <h1>Root Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        
    <%
        }
    %>
        <h1>Sugerencias</h1>
        <table style="width:40%" border="1">
          <tr>
            <th>Email del usuario</th>
            <th>Asunto</th>
            <th>Descripción</th>
          </tr>
          <%
              Iterator<sugerenciasObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  sugerenciasObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getEmail()%></td>
                      <td><%= temp.getAsunto()%></td>
                      <td><%= temp.getDescripcion()%></td>
                     
                    </tr>
          <%
                   }
                  
             
              }



          %>
          
        </table>
          <br>
          <br>
          <br>
          <a href="root_dash.jsp">Ir a Dashboard</a>
    </body>
</html>
