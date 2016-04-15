<%-- 
    Document   : personalInfo
    Created on : Apr 4, 2016, 9:02:46 AM
    Author     : Osvaldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/css.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h3 style="text-align: center">Personal Information</h3>
            <div class="row">
                <form  id="formPersonalInformation" class="col s8 offset-s2" action="../FrontController">
                    <input hidden type="text" name="controller" value="ControllerPurchase">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <input  id="first_name" name="name" type="text" class="validate">
                            <label for="first_name">Full name</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">credit_card</i>
                            <input  id="dni" type="text" name="dni" class="validate">
                            <label for="dni">DNI</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">room</i>
                            <input  id="card" type="text" name="address" class="validate">
                            <label for="card">Street</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">phone</i>
                            <input id="icon_telephone" type="tel" name="phone" class="validate">
                            <label for="icon_telephone">Telephone</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="email" name="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col offset-l8 offset-m2 offset-s2">
                            <a onclick="sendPurchase()" class="waves-effect waves-light btn ">finish</a>
                        </div>
                        <div class="col m1 l1 s1">
                            <button class="btn red">cancel</button>
                        </div>

                    </div>
                    <div id="modalPersonalInformation" class="modal">
                        <div class="modal-content">
                            <h4>Your purchase was correctly :)</h4>
                            <p>Do you want to generate a purchase receipt in pdf</p>
                        </div>
                        <div class="modal-footer">
                            <a onclick="sendPersonalInformation()" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                            <a href="#!" onclick="sendPersonalInformation()" class=" modal-action modal-close waves-effect waves-green btn-flat">disagree</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.min.js"></script>
        <script type="text/javascript" src="../js/index.js"></script>
    </body>
</html>
