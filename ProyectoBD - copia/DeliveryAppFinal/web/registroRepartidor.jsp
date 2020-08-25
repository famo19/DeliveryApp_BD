<%-- 
    Document   : registroRepartidor
    Created on : 07-31-2020, 07:59:56 PM
    Author     : JesúsAntonioBarahona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
            <link href="CSS/cssLogin.css" rel="stylesheet" type="text/css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Registro</title> 
        </head>
        <body>
            
            <div id="container10">
            <h1>DATOS GENERALES</h1>
            <h2>Llene todos los campos con sus datos:</h2>
            <form action="userServlet" method="get" id="form10">
                <p>
                    <label for="nombre">Nombre:</label> <input type="text" name="nombre" id="nombre" maxlength="60"/>
                </p>
                <br>
                <p>
                  <label for="apellido">Apellido:</label> <input type="text" name="apellido" id="apellido" maxlength="60" />
                </p>
                <br>
                <p>
                  <label for="telefono">Telefono:</label> <input type="text" name="telefono" id="telefono" maxlength="60" />
                </p>
                <br>
                <p>
                  <label for="email">E-mail:</label> <input type="text" name="email" id="email" maxlength="60" />
                </p>
                <br>
                <p>
                  <label for="contrasena">Contraseña:</label> <input type="text" name="contrasena" id="contrasena" maxlength="60" />
                </p>
                <br>
                <p>
                    <label for="placa">Número de placa:</label> <input type="text" name="placa" id="placa" maxlength="60" />
                </p>
                <br>
                <p>
                <input type="submit" value="Registrarse"/>
                <input type="hidden" name="formid" value="7" />
                </p>
                
            </form>
            </div>
         
        </body>
    </html>