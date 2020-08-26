<%-- 
    Document   : Ingreso_productos
    Created on : 08-24-2020, 11:00:14 PM
    Author     : stanl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Ingreso de productos</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
        <style>
    	header {
            background-image: url('https://image.freepik.com/foto-gratis/mesa-azul-frutas-verduras_1112-339.jpg');
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
            background-color: #8EE5E3;
            font-family: Helvetica;
            text-align: center;
            font-size: 30px;
            color: white;
            }
        </style>
	 </head>
    <header>
      <h1>Registro de producto</h1>
    </header>
    <body>
        <h1>Ingresa los datos que se te piden </h1>
        <br>
        
        <form action="productoServlet" method="get">
            Nombre: <br>
            <input type="text" id="nombre" name="nombre" />
            <br><br>
            Cantidad: <br>
            <input type="number" id="cantidad" name="cantidad" />
            <br><br>
            Precio: <br>
            <input type="number" id="precio" name="precio" />
            <br><br>
            Existencia: <br>
            <input type="text" id="existencia" name="existencia" />
            <br><br>
            <input type="submit" value="Registrar" />
            <input type="hidden" name="formid" value="6" />
        </form>
    </body>
</html>

