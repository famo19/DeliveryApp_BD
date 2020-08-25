<%-- 
    Document   : dashboard
    Created on : Aug 12, 2020, 11:32:28 PM
    Author     : balbi
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Root Main</title>
    </head>
    <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
        
        if(currentUser!=null)
        {
    %>
    <body>
        <h1>Root Index</h1>
        <br>
        user:<%= currentUser.getNombre()%> <%= currentUser.getApellido()%>  
        <br>
        type:<%= currentUser.getType().equals("cliente")?"normal":"admin" %>
        <br>
        <a href="userServlet?formid=2">logout</a>
        <br><br>
         <a href="Registro-repartidores.html">Agregar Repartidor</a>
        <br>
        <br>
        <a href="Ingreso_productos.jsp">Agregar productos</a>
        <br>
        <br>
        <a href="productoServlet?formid=8">Ver lista completa de productos</a>
        <br>
        <br>
        <!--FALTA REDIRECCIONAMIENTO-->
        <a href="ordenServlet?formid=2">Ver órdenes</a>
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
</html>
