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
        <title>Cliente</title>
    </head>
    <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
        String strEmail = currentUser.getEmail();
        request.getSession().setAttribute("us", strEmail);
        if(currentUser!=null)
        {
    %>
    <body>
        <h1>Client Index</h1>
        <br>
        user: <%= currentUser.getNombre()%> <%= currentUser.getApellido()%>
        <br>
        type:<%= currentUser.getType().equals("cliente")?"Cliente":"Root" %>
        <br>
        <a href="userServlet?formid=2">logout</a>
        <br><br>
        <a href="productoServlet?formid=1">go to Products</a>
        <br><br>
        <a href="direccionExtra.jsp">Añadir dirección</a>
        <br><br>
        <a href="ordenServlet?formid=4">Mis direcciones</a>

    
    <%
        }
        else{
    %>
        
            <h1>Client Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        </body>
    <%
        }
    %>
</html>
