<%-- 
    Document   : studentMain
    Created on : Aug 12, 2020, 7:04:15 PM
    Author     : veron
--%>

<%-- 
    Document   : teacherMain
    Created on : Jul 20, 2020, 6:59:00 AM
    Author     : balbi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="deliveryapp.objects.userObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Main</title>
        <style>
            header{
                background-color:#117C99;;
                padding: 50px;
                text-align: center;
                font-size: 45px;
                color: white;
            }
            
            section {
                display: -webkit-flex;
                display: flex;
            }
            
            nav {
                -webkit-flex: 1;
                -ms-flex: 1;
                flex: 1;
                background: #ccc;
                padding: 20px;
            }
            
            nav ul {
                list-style-type: none;
                padding: 0;
            }
            
            article {
                -webkit-flex: 3;
                -ms-flex: 3;
                flex: 3;
                background-color: #f1f1f1;
                padding: 10px;
                width: 1px;
            }
            
            @media (max-width: 600px) {
                section {
                    -webkit-flex-direction: column;
                     flex-direction: column;
                }
            }

            table {
                width:100%;
            }
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 15px;
                text-align: left;
            }
            #t01 tr:nth-child(even) {
                background-color: white;
            }
            #t01 tr:nth-child(odd) {
                background-color: #8EE5E3;
            }
            #t01 th {
                background-color: black;
                color: white;
            }
            body {
                
                font-family: Helvetica;
                text-align: center;
                font-size: 18px;
                color: black;
                background-color: #eee;
}
        </style>
    </head>
    <%
        
        ArrayList<userObj> array = 
                (ArrayList<userObj>)request.getSession()
                        .getAttribute("userarray");
    %>
    
    
        <header>Control de usuarios</header>
        
    <body>    
        <section>
            <nav>
                <ul>
                    
                    <a href="root_dash.jsp">Regresar a la página de inicio</a>
                    
                </ul>
            </nav>
            <article>
        <%
        
        %>
        
        
        <table style="margin: 0 auto;"" border="1" id="t01" margin: 0 auto;">
          <tr>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Teléfono</th>
            <th>Email</th>
            <th>Contraseña</th>
            <th>Tipo de usuario</th>
            <th>Placa del vehículo</th>
          </tr>
          <%
              Iterator<userObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  userObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getNombre() %></td>
                      <td><%= temp.getApellido() %></td>
                      <td><%= temp.getTelefono() %></td>
                      <td><%= temp.getEmail() %></td>
                      <td><%= temp.getPass() %></td>
                      <td><%= temp.getType() %></td>
                      <td><%= temp.getPlaca() %></td>
                      <td><a href="userServlet?formid=11&id=<%= temp.getId()%>"> Modificar datos </a></td>
                      <td><a href="userServlet?formid=9&id=<%= temp.getId()%>"> Borrar </a></td>
                    </tr>
          <%
                   }
              }
          %>
          
        </table>
            </article>
        </section>
      
    </body>
</html>