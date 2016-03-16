<%-- 
    Document   : index
    Created on : Mar 4, 2016, 11:38:44 AM
    Author     : Osvaldo
--%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/css.css"  media="screen,projection"/>
        <title>Tienda</title>
    </head>

    <body>
        <%@include file="nav.jsp" %>
        <div class="container" style="padding-top:1em; ">
            <div class="row">
                <div class="input-field  col s5 offset-s3">
                    <label ><i class="material-icons">search</i></label>
                    <input type="text" id="buscadorProducto" class=" search validate">
                </div>
                <div class="col s1">
                    <div style="background: "><i class=" medium material-icons">shopping_cart</i></div> 
                </div>   
                <div class="col s1">
                    <label id="valueCarrito">0</label>
                </div>
                <div class="col s2">
                    <a id="selectingProduct" class="btn disabled" onclick="showList();">Products</a>
                </div>
            </div>


            <div class="row">
                <div id="productos">
                    <form id="formElement" action="FrontController" method="get">
                    <ul class="list"id="listProduct">
                        <%
                            List<Product> list = (List) request.getAttribute("listProducto");
                            if (list != null) {
                                for (Product producto : list) {
                        %>

                        <li  id="<%=producto.getDescription()%>">
                            <div class=" col s4">
                                <div class=" valign-wrapper" style="height: 111px;">
                                    <h4 class=" valign light name" ><%= producto.getDescription()%></h4>
                                </div>
                                <div class="card small">
                                    <div class="card-image">
                                        <!--<img src="images/sample-1.jpg">-->
                                        <span class="card-title">Título de la Tarjeta</span>
                                    </div>
                                    <div class="card-content">
                                        <p><%=producto.getDescription()%></p>
                                    </div>
                                    <div class="card-action">
                                        <p>
                                            <input type="checkbox" precio="12" name="<%= producto.getDescription()%>" id="<%= producto.getProductId()%>" onclick="addProduct('<%= producto.getProductId()%>')"/>
                                            <label for="<%= producto.getProductId()%>">add to trolley</label>
                                        </p>
                                        <a href="#">see</a>
                                        <a href="#">buy</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                    <input hidden name="controller" type="text">
                   </form> 
                </div>
            </div>
        </div>
        <!--MODAL LOGIN-->
        <div id="modal1" class="modal modal-fixed-footer">
            <div class="modal-content">
                <h4>Sing in</h4>
                <form action="sing">
                    <div class="row">
                        <div class="input-field col s12">
                            <input  id="first_name" type="text" class="validate">
                            <label for="first_name">user</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Acept</a>
                <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>
        </div>
        <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </body>
</html>