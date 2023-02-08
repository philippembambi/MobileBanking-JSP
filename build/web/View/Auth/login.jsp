<%-- 
    Document   : login
    Created on : 2 janv. 2023, 23:55:53
    Author     : Monseigneur Philippe
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RawBank - Login</title>
        
        <link href="../../Public/img/My_Network_Places.ico" rel="icon">
                
        <link rel="stylesheet" href="../../Public/themes/vraivrai.min.css" />
        <link rel="stylesheet" href="../../Public/themes/vraivrai.css" />
        <link rel="stylesheet" href="../../Public/themes/jquery.mobile.icons.min.css" />

        <link rel="stylesheet" href="../../Public/jquerymobile/jquery.mobile-1.4.5.css">
        <link rel="stylesheet" href="../../Public/libs/jcarousel/jcarousel.basic.css">
        <link rel="stylesheet" href="../../Public/css/font-awesome.css">
        <link rel="stylesheet" href="../../Public/css/custom.css">

        <script src="../../Public/js/jquery.js"></script>
        <script src="../../Public//jquerymobile/jquery.mobile-1.4.5.js"></script>

    </head>
    <body>

        
            <div data-role="page" id="page1">
        <div role="main" class="ui-content" style="padding: 0px;">
            <div class="blochaut backgroundcolor">
                <img style="width: 4em; padding: 1.3em; border:1px solid #fff; border-radius: 4em; margin: 2em;"
                    src="../../Public/img/usergrand.png" alt="">
            </div>
            <div class="ui-body ui-body-a ui-corner-all" style="text-align: center;" id="App">


                <form method="post" action="../../authCompteServlet" name="formulaire" id="formulaire"
                    data-ajax="false">

                    <ul data-role="listview" data-inset="true">
                        <h2><b>Connectez-vous</b></h2>
                        
                        <% 
                            String error = "";
                        try {
                            String msg = session.getAttribute("msg").toString();
                            
                            if (!msg.isEmpty()) {
                                error = "border: 1px solid red;";
                        %>

                            <div data-role="header" data-theme="a" style="background-color: #dc3545;color: white;">
                                <h1><%=msg%></h1>
                            </div>
                         <%  }
                                } catch (NullPointerException ex) {
                           %>

                        
                        <%
                                         System.out.println(ex);
                                }
                        %>

                        <li class="ui-field-contain">
                            <label for="card_id"><i style="color: red;font-size: 18px;">*</i> ID carte abonnée :</label>
                            
                            <input style="<%= error %>"
                                    type="text" name="card_id" id="card_id" value="" data-clear-btn="true"
                                    accept=""autocomplete="off">
                        </li>

                        <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Mot de passe : </label>
                            <input style="<%= error %>" type="password" name="psw" id="psw" value="" data-clear-btn="true">
                        </li>


                        <li class="ui-field-contain">
                            <label for="flip2">Se souvenir de moi ?</label>
                            <select name="cookies" id="cookies" data-role="slider" class="backgroundcolor">
                                <option value="off">Non</option>
                                <option value="on" selected="">Oui</option>
                            </select>
                        </li>

                    </ul>
                    <button type="submit" style="color:#FFF; padding: 7px; text-shadow: none;"
                        class="ui-btn backgroundcolor">
                        Connexion
                    </button>
                </form>
                    
                <a href="register.jsp" data-transition="flip"
                        style="color:#242657; border: 1px solid #242657;  background-color: #FFF; text-shadow: none;padding: 7px;"
                        class="ui-btn ui-alt-icon ui-nodisc-icon ui-icon-user ui-btn-icon-left">
                        Créer un compte
                    </a>
                
            </div>
        </div>
    </div>
        
    </body>
</html>
