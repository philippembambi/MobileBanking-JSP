<%-- 
    Document   : index
    Created on : 2 janv. 2023, 21:50:01
    Author     : Monseigneur Philippe
--%>

<%@page import="Controller.CompteController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>RawBank App</title>
    </head>
    <body>

                <% 
                    try{
                    
                    String action = session.getAttribute("action").toString();

                        if (!action.isEmpty() && CompteController.idCompte != 0) {
                            
                %>
                    
                      <% response.sendRedirect("./home.jsp");   %>
                 
                    <% }
                        else{
                    %>
                        <% response.sendRedirect("./View/Auth/login.jsp");   %>
                    <%
                        }
                    }
                catch(Exception e){
                 %>
                 
                      <% response.sendRedirect("./View/Auth/login.jsp");   %>
                      
                    <%
                   }
                   %>

            
        <script src="Public/libs/jcarousel/jquery.jcarousel.min.js"></script>
        <script src="Public/libs/jcarousel/autoscroll.js"></script>
        
    </body>
</html>
