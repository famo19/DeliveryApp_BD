<%-- 
    Document   : clienteMain
    Created on : 28/07/2020, 10:45:34 PM
    Author     : franc
--%>
<%@page import="deliveryapp.objects.userObj"%>
<%@page import="java.util.ArrayList"%>
<%@page import="deliveryapp.objects.rootViewObj"%>
<%@page import="java.util.Iterator"%>

<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Root Interface</title>
    </head>
    <%
        int rows = (int)request.getSession().getAttribute("rows");
        ArrayList<rootViewObj> array = 
                (ArrayList<rootViewObj>)request.getSession()
                        .getAttribute("orderarray");
    %>
    <body>
        
        <h1>Lista de todas las órdenes</h1>
        <table style="width:40%" border="1">
          <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Teléfono del usuario</th>
            <th>Cantidad</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Fecha del pedido</th>
            <th>Producto</th>
            <th>Departamento</th>
            <th>Municipio</th>
            <th>Colonia</th>
            <th>Numero_casa</th>
            
          </tr>
          <%
              Iterator<rootViewObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  rootViewObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getNombre()%></td>
                      <td><%= temp.getApellido()%></td>
                      <td><%= temp.getTelefono()%></td>
                      <td><%= temp.getCantidad()%></td>
                      <td><%= temp.getTotal() %></td>
                      <td><%= temp.getEstado() %></td>
                      <td><%= temp.getFecha()%></td>
                      <td><%= temp.getProducto() %></td>
                      <td><%= temp.getDepartamento() %></td>
                      <td><%= temp.getMunicipio() %></td>
                      <td><%= temp.getColonia() %></td>
                      <td><%= temp.getNum_casa() %></td>
                      <td><a href="productoServlet?formid=4&id=<%= temp.getId_producto()%>">Borrar artículo</a></td>
                      <td><a href="productoServlet?formid=5&id=<%= temp.getId_orden()%>">Borrar orden</a></td>
                    </tr>
          <%
                   }
              }
          %>
          
        </table>
          <br>
          <br>
          <br>
          <br>
          <a href="root_dash.jsp">Regresar</a>
    </body>
</html>
