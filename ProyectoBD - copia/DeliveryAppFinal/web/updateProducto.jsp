<%-- 
    Document   : updateProducto
    Created on : 08-24-2020, 11:06:39 PM
    Author     : stanl
--%>

<%@page import="deliveryapp.objects.productoObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Producto</title>
        <style>
             header {
                background-image: url(https://image.freepik.com/foto-gratis/mesa-azul-frutas-verduras_1112-339.jpg);
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
        productoObj productoObj = 
                (productoObj)request.getSession().getAttribute("productoobject");
    %>
        <body>        

            <header>
                <h1>Modificar los datos del producto</h1>
            </header>
    
        <form action="productoServlet" method="get">
            Nombre: <br>
            <input type="text" id="nombre" name="nombre" value="<%= productoObj.getName() %>"/>
            <br><br>
            Cantidad: <br>
            <input type="text" id="cantidad" name="cantidad" value=<%= productoObj.getCantidad() %> />
            <br><br>
            Precio: <br>
            <input type="text" id="precio" name="precio" value="<%= productoObj.getPrecio() %>" />
            <br><br>
            Existencia: <br>
            <input type="text" id="existencia" name="existencia" value="<%= productoObj.getExistencia() %>"/>
            <br><br>
            <input type="submit" value="Modificar" />
            <input type="hidden" name="formid" value="10" />
            <input type="hidden" name="id" value="<%= productoObj.getId() %>"/>
        </form>
    </body>
</html>
