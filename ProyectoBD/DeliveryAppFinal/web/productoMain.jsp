<%-- 
    Document   : productoMain
    Created on : 08-24-2020, 11:03:47 PM
    Author     : stanl
--%>

<<%@page import="java.util.Iterator"%>
<%@page import="deliveryapp.objects.productoObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Main</title>
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
                font-size: 20px;
                color: black;
                background-color: #eee;
}
        </style>
    </head>
    <%

        
        ArrayList<productoObj> array = 
                (ArrayList<productoObj>)request.getSession()
                        .getAttribute("productoarray2");
    %>
    
    
        <header>Control de Productos</header>
        
    <body>    
        <section>
            <nav>
                <ul>
                    <a href="Ingreso_productos.jsp">Agregar un nuevo producto</a>
                    <br><br>
                    <a href="root_dash.jsp">Regresar a la página de inicio</a>
                </ul>
            </nav>
            <article>

        
        
        <table style="margin: 0 auto;"" border="1" id="t01" margin: 0 auto;">
          <tr>
            <th>Nombre</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Existencia</th>
          </tr>
          <%
              Iterator<productoObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  productoObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getName() %></td>
                      <td><%= temp.getCantidad() %></td>
                      <td><%= temp.getPrecio() %></td>
                      <td><%= temp.getExistencia() %></td>
                      <td><a href="productoServlet?formid=9&id=<%= temp.getId()%>"> Modificar producto </a></td>
                      <td><a href="productoServlet?formid=7&id=<%= temp.getId()%>"> Borrar </a></td>
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
