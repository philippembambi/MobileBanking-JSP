<%-- 
    Document   : createAccount
    Created on : 2 févr. 2023, 12:49:14
    Author     : Monseigneur Philippe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RawBank - Complete Registration</title>
        
        <link href="../../Public/img/catalog.ico" rel="favicon">
        
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
                    src="../../Public/img/Clipboard_100px.png" alt="">
            </div>
            <div class="ui-body ui-body-a ui-corner-all" style="text-align: center;" id="App">


                <form method="post" action="../../completeRegistration" name="formulaire" id="formulaire"
                    data-ajax="false">

                    <ul data-role="listview" data-inset="true">
                        <h3><b>Completez votre inscription</b></h3>
                        
                        <% 
                            String error = "";
                        try {
                            String msg = session.getAttribute("msg").toString();
                            
                            if (!msg.isEmpty()) {
                                error = "border: 1px solid red;";
                        %>
                        <i style="color: red;"><%=msg%></i>
                                   <br/><br/>
                        
                             <%  }
                                } catch (NullPointerException ex) {
                           %>

                        <%
                                         System.out.println(ex);
                                }
                        %>

                        <li class="ui-field-contain">
                            <label for="card_id"><i style="color: red;font-size: 18px;">*</i> Créer un mot de passe :</label>
                            
                            <input style="<%= error %>"
                                    type="text" name="psw" id="psw" value="" data-clear-btn="true"
                                    accept=""autocomplete="off">
                        </li>

                        <li class="ui-field-contain">
                            <label for="psw"><i style="color: red;font-size: 18px;">*</i> Confirmer : </label>
                            <input style="<%= error %>" type="password" name="confirm_psw" id="confirm_psw" value="" data-clear-btn="true">
                        </li>


                        <li>
                                      <fieldset data-role="collapsible" data-theme="c">
                            <legend>Type de compte</legend>

                            <div data-role="controlgroup" data-theme="c">
                                <input type="checkbox" name="accounType" id="option1" value="Compte bloqué">
                                <label for="option1">Compte bloqué</label>
                                
                                <input type="checkbox" name="accounType" id="option2" value="Compte epargne">
                                <label for="option2">Compte d'épargne</label>
                                
                        </fieldset>
                            
                        </li>

                    </ul>
                    <button type="submit" style="color:#FFF; padding: 7px; text-shadow: none;"
                        class="ui-btn backgroundcolor">
                        Valider
                    </button>
                </form>
                        <br/>
                        <i style="color: green;">Vous êtes en 1 click de valider votre insciprion</i>
            </div>
        </div>
    </div>
        
    </body>
    
</html>
