<%-- 
    Document   : repartidorView
    Created on : 16/08/2020, 07:36:54 PM
    Author     : franc
--%>

<%@page import="deliveryapp.objects.userObj"%>
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
        <%
        userObj currentUser 
                = (userObj) request.getSession().getAttribute("current_user");
       
        String user = currentUser.getEmail();
        request.getSession().setAttribute("us", user);
       
        
        int iId= (int)request.getSession().getAttribute("id");
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
        <body>
            <h1>Client Index</h1>
            <br>

            <a href="index.jsp">go to login</a>
        </body>
    <%
        }
    %>
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
                      <td><a href="repartidorServlet?formid=4&id_orden=<%= temp.getId_orden()%>&id_producto=<%=temp.getId_producto()%>&id_us=<%=temp.getId_usuario()%>&id_dir=<%= temp.getId_direccion() %>">Tomar pedido</a></td>
                      
                    </tr>
          <%
                   }
              }
          %>
          
        </table>
    </body>
</html>
