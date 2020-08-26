<%-- 
    Document   : sugerencias
    Created on : 08-24-2020, 11:10:03 PM
    Author     : Usuario
--%>

<%@page import="deliveryapp.objects.userObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/cssSugerencias.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sugerencias</title>
    </head>

    <body>
        <%
            userObj currentUser
                    = (userObj) request.getSession().getAttribute("current_user");
            String user = currentUser.getEmail();
            request.getSession().setAttribute("us", user);
            if(currentUser!=null)
                %>
                
<div class="sug-page">
  <div class="form">
    <form class="sug-form" action="sugerenciasServlet">
      <p><strong>Asunto:</strong></p>
      <input type="text" name="asunto" placeholder="Escribe un título para la sugerencia" required/>
      <p><strong>Descripción:</strong></p>
      <textarea name="descripcion" rows="8" cols="15" placeholder="Escribe tu comentario..." required/></textarea>
      <input type="submit" value="Enviar">
      <input type="hidden" value="1" name="formid">
    </form>
  </div>
</div>
</body>
</html>
