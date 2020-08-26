<%-- 
    Document   : registro
    Created on : 07-31-2020, 07:54:51 PM
    Author     : JesúsAntonioBarahona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/cssLogin.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delivery App</title> 
    </head>
    <body>
        <hr>
        
        <div id="container3">
             <h1>Registrarse como:</h1>
        </div>
        <div id="container4">
            <form action="registroCliente.jsp" method="get" id="form4">
            <input type="submit" value="Cliente"/>
            </form>
        </div>
        <div id="container5"> 
            <form action="registroAdministrador.jsp" method="get" id="form5">
            <input type="submit" value="Administrador">
            </form>
        </div>
        <div id="container6"> 
            <form action="registroRepartidor.jsp" method="get" id="form6">
            <input type="submit" value="Repartidor">
            </form>
        </div>
    </body>
</html>