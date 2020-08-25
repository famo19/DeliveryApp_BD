<%-- 
    Document   : finalOrderMain
    Created on : 10/08/2020, 03:49:59 PM
    Author     : franc
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balder Co.</title>
    </head>
    
    <body>
        <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
        //FALTA MANNDAR DATO DEL EMAIL
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
        <h1>Orden Confirmada</h1>
        
        <p>Espero de 25 a 35 minutos para que la orden sea entregada por el repartidor asignado.</p>
        
        <a href="menuMain.jsp">Inicio</a>
        
    </body>
</html>
