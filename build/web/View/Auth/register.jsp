<%-- 
    Document   : register
    Created on : 6 janv. 2023, 06:22:54
    Author     : Monseigneur Philippe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RawBank - Register</title>
        
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



                <form method="post" action="../../registerServlet" name="formulaire" id="formulaire"
                    data-ajax="false">

                    <ul data-role="listview" data-inset="true">

                                                <% 
                            session.removeAttribute("msg");
                                                        
                        try {
                            String msg = session.getAttribute("msg").toString();
                            
                            if (!msg.isEmpty()) {
                        %>

                            <div data-role="header" data-theme="a" style="background-color: #dc3545;color: white;">
                                <h1><%=msg%></h1>
                            </div>
                            
                         <%  }
                                } catch (Exception ex) {
                           %>
                                                        
                        <% System.out.println(ex);  }   %>

                        <h2><b>Créer un compte</b></h2>
                        <li class="ui-field-contain">
                            <label for="pseudo"><i style="color: red;font-size: 18px;">*</i> Nom :</label>
                            <input type="text" name="lastname" id="lastname" value="" data-clear-btn="true"
                                required>
                        </li>

                        <li class="ui-field-contain">
                            <label for="noms"><i style="color: red;font-size: 18px;">*</i> Prénom :</label>
                            <input type="text" name="firstname" id="firstname" value="" data-clear-btn="true" required>
                        </li>

                        <li class="ui-field-contain">
                            <label for="sexe"><i style="color: red;font-size: 18px;">*</i> Sexe :</label>
                            <select name="sex" id="sex" data-role="slider" class="backgroundcolor">
                                <option value="M">M</option>
                                <option value="F">F</option>
                            </select>
                        </li>

                                                <fieldset data-role="collapsible" data-theme="c">
                            <legend>Etat Civil</legend>

                            <div data-role="controlgroup" data-theme="c">
                                <input type="checkbox" name="civilian_state" id="option1" value="Celibataire">
                                <label for="option1">Célibataire</label>
                                
                                <input type="checkbox" name="civilian_state" id="option2" value="Marie">
                                <label for="option2">Marié (e)</label>
                                
                                <input type="checkbox" name="civilian_state" id="option3" value="Divorcé">
                                <label for="option3">Divorcé (e)</label>
                        </fieldset>

                        <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Téléphone
                                :</label>
                            <input type="text" name="phone" id="phone" value="" data-clear-btn="true" required>
                        </li>
                        
                                                <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Profession
                                :</label>
                            <input type="text" name="profession" id="profession" value="" data-clear-btn="true" required>
                        </li>
                        
                        <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Date de naissance
                                :</label>
                            <input type="date" name="birthday" id="birthday" value="" data-clear-btn="true" required>
                        </li>
                        
                                                <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Nationalité
                                :</label>
                            <input type="text" name="nationality" id="nationality" value="" data-clear-btn="true" required>
                        </li>

                        </p>
                    </ul>

                    <button id="submitbtn" name="btn" type="submit" style="color:#FFF; padding: 7px; text-shadow: none;"
                        class="ui-btn backgroundcolor">
                        Créer le compte
                    </button>
                    <a href="login.jsp" data-transition="flip"
                        style="color:#242657; border: 1px solid #242657;  background-color: #FFF; text-shadow: none;padding: 7px;font-size: 15px;"
                        class="ui-btn ui-alt-icon ui-nodisc-icon ui-icon-user ui-btn-icon-left">
                        Compte existant ? se connecter ..
                    </a>
                </form>

            </div>
        </div>
    </div>

                
    </body>
</html>