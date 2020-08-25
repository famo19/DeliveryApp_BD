<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
            <title>Añadir dirección</title>
            <link href="CSS/cssLogin.css" rel="stylesheet" type="text/css"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>

        <body>
            
            <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
       
        String user = currentUser.getEmail();
        request.getSession().setAttribute("us", user);
        
       
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
        
            <h1>Client Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        
    <%
        }
    %>
          
            <div id="container13">
            <h1>DIRECCIÓN</h1>
            <h2>Llene los campos con los datos de la nueva dirección donde recibirá sus órdenes:</h2>
            <form action="userServlet" method="get" id="form13">
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
                <input type="submit" value="Terminar"/>
                <input type="hidden" name="formid" value="8" />
                </p>
                
            </form>
            </div>
        </body>
    </html>