<%-- 
    Document   : login
    Created on : 28/07/2020, 09:08:26 PM
    Author     : franc
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="CSS/cssLogin.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
    </head>
    <%
            String message 
                    = (String)request.getSession().getAttribute("message");
    %>
    <body>
        <div>
            <%
                if(message!=null && !message.equals(""))
                {
            %>
            <p style="color:red;"><%= message %></p>
            <%
                }
            %>
        </div>
        <hr>
        
        <div id="container1">
        <h1>Bienvenido</h1>
            <form id="form1" action="userServlet" method="POST">
                Username: <input type="text" id="user" name="user" placeholder="email"/> 
                <hr>
                Password: <input type="password" id="pass" name="pass" placeholder="****"/>
                <hr>
                <input type="submit" value="Log in" name="sbm"/>
                <input type="hidden" name="formid" value="1"/>
            </form>
        </div>
        
        <div id="container2"> 
            <form action="registro.jsp" id="form2">
                <input type="submit" value="Create account" />
                
            </form>
            
            
        
        </div>
       
    </body>
</html>
