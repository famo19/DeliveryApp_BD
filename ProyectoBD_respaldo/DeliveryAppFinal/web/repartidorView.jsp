<%-- 
    Document   : repartidorView
    Created on : 16/08/2020, 07:36:54 PM
    Author     : franc
--%>

<%@page import="java.util.Iterator"%>
<%@page import="deliveryapp.objects.repartidorViewObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Repartidor</title>
    </head>
    <%
        int rows = (int)request.getSession().getAttribute("rows");
        ArrayList<repartidorViewObj> array = 
                (ArrayList<repartidorViewObj>)request.getSession()
                        .getAttribute("repartidorListArray");
        
    %>
    <body>
        <h1>Lista de ordenes sin entregar</h1>
        <table style="width:40%" border="1">
          <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Cantidad</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Producto</th>
            <th>Departamento</th>
            <th>Municipio</th>
            <th>Colonia</th>
            <th>Numero_casa</th>
            
          </tr>
          <%
              Iterator<repartidorViewObj> iteArray= null;
              if(array!=null)
              {
                  iteArray = array.iterator();
                  repartidorViewObj temp = null;
                  while(iteArray.hasNext())
                  {
                      temp = iteArray.next();
          %>
                    <tr>
                      <td><%= temp.getNombre()%></td>
                      <td><%= temp.getApellido()%></td>
                      <td><%= temp.getCantidad()%></td>
                      <td><%= temp.getTotal() %></td>
                      <td><%= temp.getEstado() %></td>
                      <td><%= temp.getProducto() %></td>
                      <td><%= temp.getDepartamento() %></td>
                      <td><%= temp.getMunicipio() %></td>
                      <td><%= temp.getColonia() %></td>
                      <td><%= temp.getNum_casa() %></td>
                      <td><a href="repartidorServlet?formid=4&id_orden=<%= temp.getId_orden()%>&id_producto=<%=temp.getId_producto()%>&id_us=">Tomar pedido</a></td>
                      
                    </tr>
          <%
                   }
              }
          %>
          
        </table>
    </body>
</html>
