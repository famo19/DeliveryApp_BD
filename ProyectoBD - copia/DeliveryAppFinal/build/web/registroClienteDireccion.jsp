<%-- 
    Document   : registroClienteDireccion
    Created on : 07-31-2020, 07:57:11 PM
    Author     : JesúsAntonioBarahona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
            <title>Registro de usuario</title>
            <link href="CSS/cssLogin.css" rel="stylesheet" type="text/css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>

        <body>
            <div id="container8">
            <h1>DIRECCIÓN</h1>
            <h2>Llene los campos con los datos del lugar donde recibirá sus órdenes:</h2>
            <form action="userServlet" method="get" id="form8">
                <p>
                    <label for="departamento">Departamento:</label> <input type="text" name="departamento" id="departamento" maxlength="60"/>
                </p>
                <br>
                <p>
                  <label for="municipio">Municipio:</label> <input type="text" name="municipio" id="municipio" maxlength="60" />
                </p>
                <br>
                <p>
                  <label for="colonia">Colonia:</label> <input type="text" name="colonia" id="colonia" maxlength="60" />
                </p>
                <br>
                <p>
                  <label for="casa">Número de casa:</label> <input type="text" name="casa" id="casa" maxlength="60" />
                </p>
                <br>
                <p>
                <input type="submit" value="Registrarse"/>
                <input type="hidden" name="formid" value="5" />
                </p>
                
            </form>
            </div>
        </body>
    </html>
