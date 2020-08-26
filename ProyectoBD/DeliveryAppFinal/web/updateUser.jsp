<%-- 
    Document   : updateRepartidor
    Created on : Aug 13, 2020, 6:01:18 PM
    Author     : veron
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Usuario</title>
        <style>
             header {
                background-image: url('https://images.pexels.com/photos/4392039/pexels-photo-4392039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                padding: 120px;
                text-align: center;
                font-size: 40px;
                color: white;
                left: 0;
                top: 0;
                color: white;
                border-radius: 0 0 50% 50%/ 15%;;
            }
            body {
                background-color: #117C99;
                font-family: Helvetica;
                text-align: center;
                font-size: 20px;
                color: white;
            }
        </style>
    </head>
    <%
        userObj repartidorObj = 
                (userObj)request.getSession().getAttribute("userobject");
    %>
    <header>
        <h1>Modificar los datos del usuario</h1>
    </header>
    
    <body>        
        <form action="userServlet" method="get">
            Nombres: <br>
            <input type="text" id="nombre" name="nombre" value="<%= repartidorObj.getNombre() %>"/>
            <br><br>
            Apellidos <br>
            <input type="text" id="apellido" name="apellido" value="<%= repartidorObj.getApellido() %>" />
            <br><br>
            Telefono <br>
            <input type="text" id="telefono" name="telefono" value="<%= repartidorObj.getTelefono() %>" />
            <br><br>
            E-mail: <br>
            <input type="text" id="email" name="email" value="<%= repartidorObj.getEmail() %>"/>
            <br><br>
            Contraseña: <br>
            <input type="text" id="pass" name="pass" value="<%= repartidorObj.getPass() %>"/>
            <br><br>
            Estado: <br>
            <input type="text" id="type" name="type" value="<%= repartidorObj.getType() %>" />
            <br><br>
            Placa del vehículo: <br>
            <input type="number" id="placa" name="placa" value="<%= repartidorObj.getPlaca() %>"/>
            <br><br>
            <input type="submit" value="Modificar" />
            <input type="hidden" name="formid" value="12" />
            <input type="hidden" name="id" value="<%= repartidorObj.getId() %>"/>
        </form>
    </body>
</html>