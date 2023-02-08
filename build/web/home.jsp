<%-- 
    Document   : home
    Created on : 23 janv. 2023, 14:30:54
    Author     : Monseigneur Philippe
--%>

<%@page import="Controller.CompteController"%>
<%@page import="Controller.ClientController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="./Public/img/My_Network_Places.ico" rel="icon">
                
        <link rel="stylesheet" href="./Public/themes/vraivrai.min.css" />
        <link rel="stylesheet" href="./Public/themes/vraivrai.css" />
        <link rel="stylesheet" href="./Public/themes/jquery.mobile.icons.min.css" />

        <link rel="stylesheet" href="./Public/jquerymobile/jquery.mobile-1.4.5.css">
        <link rel="stylesheet" href="./Public/libs/jcarousel/jcarousel.basic.css">
        <link rel="stylesheet" href="./Public/css/font-awesome.css">
        <link rel="stylesheet" href="./Public/css/custom.css">

        <script src="./Public/js/jquery.js"></script>
        <script src="./Public//jquerymobile/jquery.mobile-1.4.5.js"></script>
        
        <title>JSP Page</title>
        
            <style>
        /* ENGINE CSS - yu can change padding values!!*/

        .grid-system-container .grid-row {
            width: 25%;
            padding: 4px;
            text-align: center;
            display: block;
            float: left;
            background-color: rgb(249, 249, 249);
            box-sizing: border-box;
            border-left: 0px solid #777;
        }

        .grid-system-container.row-1 .grid-row {
            width: 100%;
        }

        .grid-system-container.row-2 .grid-row {
            width: 50%;
        }

        .grid-system-container.row-3 .grid-row {
            width: 33.33%;
        }

        .grid-system-container.row-4 .grid-row {
            width: 25%;
        }

        .grid-system-container.row-5 .grid-row {
            width: 20%;
        }

        .grid-system-container.row-1 #row2,
        .grid-system-container.row-1 #row3,
        .grid-system-container.row-1 #row4,
        .grid-system-container.row-1 #row5,
        .grid-system-container.row-2 #row3,
        .grid-system-container.row-2 #row4,
        .grid-system-container.row-2 #row5,
        .grid-system-container.row-3 #row4,
        .grid-system-container.row-3 #row5,
        .grid-system-container.row-4 #row5 {
            display: none;
        }


        /* Personal style code */

        .grid-system-container img {
            width: 100%;
            height: auto;
        }

        .grid-system-container .autrenom {
            color: #000;
            float: left;
            font-weight: bold;
        }

        .grid-system-container .autreprix {
            color: rgb(241, 13, 13);
            float: left;
            font-weight: bold;
        }

        .grid-system-container .autredesc {
            color: #000;
            font-size: smaller;
            float: left;
        }

        .grid-system-container p {
            color: #000;
        }

        .grid-system-container .panier {
            color: #000;
            position: relative;
            padding: 10px;
            top: 1px;
            left: 55px;
            width: 20px;
            height: 20px;
            background: linear-gradient(90deg, #ff0000, #FFDD45);
        }

        .grid-system-container .reduction {
            color: #ffffff;
            font-size: 10px;
            position: relative;
            padding: 5px;
            top: 0px;
            left: 55px;
            width: 30px;
            height: 30px;
            border-radius: 20px;
            text-decoration: none;
            background: linear-gradient(90deg, #ff0000, #FFDD45);
        }
    </style>
    
    </head>
    <body>

            <div data-role="page" id="mapagemain" style="font-family: comfortaa;">

                <div data-role="panel" data-display="push" id="left-panel" data-theme="b" style="background-color: #242657;">
                   <ul data-role="listview">
                        

                        <li data-role="collapsible" data-inset="false" data-iconpos="right" style="background-color: #242657;">
                          <h3 class="ui-btn ui-shadow ui-corner-all ui-icon-gear ui-btn-icon-left">&nbsp;&nbsp;&nbsp;&nbsp; Gérer les administrateurs</h3>
                          <ul data-role="listview">
                          <li><a href="#" onclick="show_connected_admin()">admins connectés</a></li>
                            <li><a href="#" onclick="">Nouvel admin</a></li>
                          </ul>
                        </li><!-- /collapsible -->

                    </ul>
                        
                </div>
                
                <div data-role="header" class="backgroundcolor" data-tap-toggle="false" data-position="fixed">
                    <div class="ui-bar" class="blocsearch">
                        
                        <a style="margin-top: -10px;" href="#left-panel" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-icon-plus ui-btn-icon-notext ui-btn-c ui-mini">icon only button</a>
                        
                        <img style="margin-left: 10%;height: 2em;width: 55%;" src="./Public/img/rawbank.png" class="imgbtn" alt="">
                    </div>

                </div>
                
                
                        <div role="main" class="ui-content" style="padding: 7px;">

                                                            <ul data-role="listview" data-inset="true">
                                    
                                                                <% 
                                                                    CompteController compteSolde = new CompteController();
                                                                    String solde = compteSolde.getAccountSolde();
                                                                %>
                                                                    
                                                                <li data-role="list-divider">Mon solde <span class="ui-li-count"><%= solde %> $</span></li>
                                </ul>
                            
                            <div data-role="tabs" id="tabs">
                                
                                <div data-role="navbar" class="backgroundcolor">
                                    <ul>
                                        <li style="border-radius:20px;"><a href="#all" class="backgroundcolor" data-transition="pop"
                                                data-ajax="false">
                                                <img src="./Public/img/calendar.ico" width="30" /></a></li>

                                        <li><a href="#depot" data-transition="turn" class="backgroundcolor" data-ajax="false">
                                                <img src="./Public/img/properties_thehand_thedocument_1548.png" width="30" /></a></li>

                                        <li><a href="#transfert" data-transition="turn" class="backgroundcolor" data-ajax="false">
                                                <img src="./Public/img/ghhh.png" class="backgroundcolor" width="30" /></a></li>

                                                                                
                                        <li><a href="#more" data-transition="turn" class="backgroundcolor" data-ajax="false">
                                                <img src="./Public/img/personnelle-icone-6169-96.png" width="30" /></a></li>

                                    </ul>


                                </div>

                                
                                <% 
                                String error = "";
                                String transactionMsg = "";
                                
                                session.setAttribute("msg", "Some value");
                                    try {
                                        String msg = session.getAttribute("transac").toString();

                                        if (!msg.isEmpty()) {
                                            transactionMsg = msg;
                                %>
                                
                                <%  }
                                    } catch (NullPointerException ex){
                                 }
                               %>
                           

                               
                                <a href="#depotEffectue" id="depotBtn" data-rel="popup" data-position-to="window" data-transition="pop">&nbsp;</a>
                                
                                <script>
                                    var sessionValue = "<%= transactionMsg %>";
                                                                              
                                      if(sessionValue !== "")
                                        {
                                            setTimeout(() => {
                                                document.getElementById("transactMsg").innerHTML = sessionValue;
                                                document.getElementById("depotBtn").click();
                                            }, 1000);
                                        }
                                    <% session.removeAttribute("transac"); %>
                                        
                                </script>
                                
                                <div id="all" class="ui-body-a ui-content" style="padding: 5px;">
                                    <center><h3>Historique des transactions</h3></center>
                                        <!--<a style="text-shadow: none;" href="prodgros" rel="external"><span id="voirplus" style="text-align: center;" class="backgroundcolor">Produits en gros</span></a>-->
                                        <div id="wrapper">

                                            <ul data-role="listview" data-filter="true" data-split-theme="a" data-inset="true">
                                      
                                            </ul>
                                       
                                            
                                            <ul data-role="listview" data-split-icon="gear" data-split-theme="a" data-inset="true">
                                                
                                                                                            <%
                                                Object productList[][] = new Object[100][100];
                                                
                                                CompteController compte = new CompteController(); 
                                                productList = compte.getDepots(2);
                                                
                                                for(int i = 0; i < productList.length; i++){
                                                    if(productList[i][0] != null)
                                                    {
                                            %>
                                                
                                                <li>
                                                    <a href="#">
                                                        <img src="./Public/img/Clipboard_100px.png" style="height: 70px;">
                                                        <h4>Dépôt de : <span style="color: green;"><%= productList[i][0] %> $</span></h4>
                                                        <p><span style="color: green;">Date</span> : <%= productList[i][1] %></p>
                                                    </a>
                                                    <a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop">Purchase</a>
                                                </li>
                                                
                                                
                                            <% }} %>
                                            
                                            
                                             <%
                                                        Object transfertList1[][] = new Object[100][100];

                                                        CompteController compteTransfert1 = new CompteController(); 
                                                        transfertList1 = compteTransfert1.getTransfers(2);

                                                        for(int i = 0; i < transfertList1.length; i++){
                                                            if(transfertList1[i][0] != null)
                                                            {
                                                    %>
                                                    <li>
                                                     <a href="#">
                                                        <img src="./Public/img/NeedleLeftYellow2.ico" style="height: 60px;">
                                                        <h4>Transfert de : <span style="color: green;"><%= transfertList1[i][0] %> $</span></h4>
                                                        <p><span style="color: green;">A  : <%= transfertList1[i][2] %> <%= transfertList1[i][3] %></span></p>
                                                        <p><span style="color: green;">Date</span> : <%= transfertList1[i][1] %></p>
                                                    </a>
                                                    <a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop">Purchase album</a>
                                                    
                                                    </li>
                                                    <br>
                                                <% }} %>
                                                
                                            </ul>
                                            
                                            <div data-role="popup" id="purchase" data-theme="a" data-overlay-theme="b" class="ui-content" style="max-width:340px; padding-bottom:2em;">
                                                <center><h3>Que voulez-vous faire ?</h3></center>
                                                <a href="#" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-left ui-btn-inline ui-mini">Imprimer</a>
                                                <a href="#" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini">Supprimer</a>
                                            </div>
                                            
                                            <div data-role="popup" id="depotEffectue" data-theme="a" data-overlay-theme="b" class="ui-content" style="max-width:340px; padding-bottom:2em;">
                                                <center><h4 id="transactMsg">Transaction effectuée</h4></center>
                                                <a href="#" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-check ui-btn-icon-left ui-btn-inline ui-mini">Fermer</a>
                                            </div>
                                            
                                            
                                        </div>
                                    </div>

                                <div id="depot" class="ui-body-d ui-content" style="padding: 5px;">
                                
                                    <center><h2>Effectuer un dépôt</h2></center>
                                    
                                            <form method="post" action="./depotServlet" name="" id=""
                                                data-ajax="false">

                                                <ul data-role="listview" data-inset="true">
                                                  
                                                    <li class="ui-field-contain">
                                                        <label for="card_id"><i style="color: red;font-size: 18px;">*</i> Montant de dépôt</label>

                                                        <input 
                                                                type="text" name="amount" id="amount" value="" data-clear-btn="true"
                                                                accept=""autocomplete="off">
                                                    </li>


                                                    <li class="ui-field-contain">
                                                        <label for="flip2">Devise</label>
                                                        <select name="cookies" id="cookies" data-role="slider" class="backgroundcolor">
                                                            <option value="off">USD</option>
                                                            <option value="on" selected="">CDF</option>
                                                        </select>
                                                    </li>

                                                </ul>
                                                                                            
                                                <button type="submit" data-transition="flip"
                                                    style="color:#242657; border: 1px solid #242657;  background-color: #FFF; text-shadow: none;padding: 7px;"
                                                    class="ui-btn ui-alt-icon ui-nodisc-icon ui-icon-user ui-btn-icon-left"
                                                    >Effectuer dépôt</button>

                                                
                                                </form>

                                                <ul data-role="listview" data-filter="true" data-split-icon="arrow-d" data-split-theme="a" data-inset="true">
                                            <%
                                                Object depotList[][] = new Object[100][100];
                                                
                                                CompteController compteDepot = new CompteController(); 
                                                depotList = compteDepot.getDepots(5);
                                                
                                                for(int i = 0; i < depotList.length; i++){
                                                    if(depotList[i][0] != null)
                                                    {
                                            %>
                                                    <li>
                                                     <a href="#">
                                                        <img src="./Public/img/Clipboard_100px.png" style="height: 70px;">
                                                        <h4>Dépôt de : <span style="color: green;"><%= depotList[i][0] %> $</span></h4>
                                                        <p><span style="color: green;">Date</span> : <%= depotList[i][1] %></p>
                                                    </a>
                                                    <a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop">Purchase album</a>
                                                    
                                                    </li>
                                                    <br>
                                                <% }} %>
                                            
                                                </ul>
                                    
                                </div>
                                
                                <div id="transfert" class="ui-body-d ui-content" style="padding: 5px;">
                                    <center><h2>Transferer de l'argent</h2></center>
                                    
                                            <form method="post" action="./transfert" name="" id=""
                                                data-ajax="false">

                                                <ul data-role="listview" data-inset="true">
                                                  
                                                    <li class="ui-field-contain">
                                                        <label for="card_id"><i style="color: red;font-size: 18px;">*</i> Montant de transfert</label>

                                                        <input 
                                                                type="text" name="amount" id="amount" value="" data-clear-btn="true"
                                                                accept=""autocomplete="off">
                                                    </li>

                                                    <li clas='ui-field-contain'>
                                                        <label for="beneficiare"><i style="color: red;font-size: 18px;">*</i> Nom du Bénéficiare</label>
                                                            
                                                            <input id="autocomplete-input" name="compteBeneficiare" data-type="search" placeholder="Recherche abonnés RawBank...">
                                                            <ul data-role="listview" data-filter="true" data-filter-reveal="true" data-input="#autocomplete-input" data-inset="true">
                                                                
                                                            <%
                                                                  Object clientList[][] = new Object[100][100];

                                                                  ClientController client = new ClientController(); 
                                                                  clientList = client.getClients();

                                                                  for(int i = 0; i < clientList.length; i++){
                                                                      if(clientList[i][0] != null)
                                                                      {
                                                              %>
                                                              <li><a href="#" onclick="getClientId(<%= clientList[i][0] %>)"><%= clientList[i][1] %> <%= clientList[i][2] %></a></li>
                                                                    
                                                                    
                                                                <% }} %>
                                                            </ul>
                                                    </li>
                                                    
                                                    <script>
                                                        function getClientId(id)
                                                        {
                                                            document.getElementById("autocomplete-input").value = id; 
                                                        }
                                                    </script>
                                                    
                                                    <li class="ui-field-contain">
                                                        <label for="flip2">Devise</label>
                                                        <select name="cookies" id="cookies" data-role="slider" class="backgroundcolor">
                                                            <option value="off">USD</option>
                                                            <option value="on" selected="">CDF</option>
                                                        </select>
                                                    </li>

                                                </ul>
                                                                                            
                                                <button type="submit" data-transition="flip"
                                                    style="color:#242657; border: 1px solid #242657;  background-color: #FFF; text-shadow: none;padding: 7px;"
                                                    class="ui-btn ui-alt-icon ui-nodisc-icon ui-icon-user ui-btn-icon-left"
                                                    >Effectuer le transfert</button>

                                                
                                            </form>
                                            <br>
                                            <ul data-role="listview" data-filter="true" data-split-icon="arrow-d" data-split-theme="a" data-inset="true">
                                                    <%
                                                        Object transfertList[][] = new Object[100][100];

                                                        CompteController compteTransfert = new CompteController(); 
                                                        transfertList = compteTransfert.getTransfers(5);

                                                        for(int i = 0; i < transfertList.length; i++){
                                                            if(transfertList[i][0] != null)
                                                            {
                                                    %>
                                                    <li>
                                                     <a href="#">
                                                        <img src="./Public/img/NeedleLeftYellow2.ico" style="height: 60px;">
                                                        <h4>Transfert de : <span style="color: green;"><%= transfertList[i][0] %> $</span></h4>
                                                        <p><span style="color: green;">A  : <%= transfertList[i][2] %> <%= transfertList[i][3] %></span></p>
                                                        <p><span style="color: green;">Date</span> : <%= transfertList[i][1] %></p>
                                                    </a>
                                                    <a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop">Purchase album</a>
                                                    
                                                    </li>
                                                    <br>
                                                <% }} %>
                                            
                                                </ul>
                                                
                                                <div data-role="controlgroup" data-type="horizontal" data-mini="true">
                                                    <a href="#" class="ui-shadow ui-btn ui-corner-all ui-btn-icon-left ui-icon-grid ui-btn-b">Voir plus</a>
                                                </div>
                                </div>
                                                
                                <div id="more" class="ui-body-d ui-content" style="padding: 5px;">
                                <div id="wrapper">
                                    <br>
                                    <ul data-role="listview" style="font-size: 17px;">

                                        <li style="background-color: white;">
                                            <a href="./moteur_php.php?action=move_to_index_all" rel="external"
                                                style="background-color: white;">
                                                <i class="fa fa-user" style="color: #242657;"></i> &nbsp; Bats

                                                <p>
                                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                                                </p>
                                            </a>
                                        </li>

                                        <li style="background-color: white;">
                                            <a href="./moteur_php.php?action=move_to_index_training" rel="external"
                                                style="background-color: white;">
                                                <i class="fa fa-file" style="color: #242657;"></i> &nbsp; Formations et cours
                                                d'encadrement

                                                <p>
                                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                                                </p>
                                            </a>
                                        </li>



                                    </ul>
                                </div>
                            </div>
                            </div>
                        </div>
                
                            <div data-role="footer" data-position="fixed">
                                <div data-role="navbar">
                                    <ul>
                                        <li><a href="#left-panel" data-icon="grid">Menu</a></li>
                                        <li><a href="#" data-icon="star" class="ui-btn-active">Favs</a></li>
                                        <li><a href="#" data-icon="gear">Setup</a></li>
                                    </ul>
                                </div><!-- /navbar -->
                            </div><!-- /footer -->

            </div>
     
    </body>
    
</html>
