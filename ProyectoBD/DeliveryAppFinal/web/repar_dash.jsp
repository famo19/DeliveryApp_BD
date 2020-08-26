<%-- 
    Document   : repar_dash
    Created on : 25/08/2020, 10:53:36 PM
    Author     : franc
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Repartidor Main</title>
    </head>
    <body>
        <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
        
        if(currentUser!=null)
        {
    %>
    <body>
        <h1>Repartidor Index</h1>
        <br>
        user:<%= currentUser.getNombre()%> <%= currentUser.getApellido()%>  
        <br>
        type:<%= currentUser.getType().equals("cliente")?"normal":"repartidor" %>
        <br>
        <a href="userServlet?formid=2">logout</a>
        
    </body>
    <%
        }
        else{
    %>
        <body>
            <h1>Root Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        </body>
    <%
        }
    %>
        <h1>Bienvenido</h1>
        <br>
        <br>
        <br>
        <a href="repartidorServlet?formid=1" style="text-decoration: none ">Ver órdenes sin entregar</a>
    </body>
</html>
