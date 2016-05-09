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
        <%@include file="/view/css/css.jsp" %>
        <title>Tienda</title>
    </head>

    <body>
        <%@include file="/view/nav.jsp" %>
        <div class="container" style="padding-top:1em; ">
            <div class="row">
                <div class="input-field  col s5 offset-s3">
                    <label ><i class="material-icons">search</i></label>
                    <input type="text" id="buscadorProducto" class=" search validate">
                </div>
                <div class="col s1">
                    <div style="background: "><i class=" medium material-icons">shopping_cart</i></div> 
                </div>   
                <%
                    List<Product> list = (List) request.getAttribute("listProducto");
                    List<Product> selectingProductList = (List) request.getAttribute("shoppingCar");
                %>
                <div class="col s1">
                    <label id="valueCarrito"><%=selectingProductList.size()%></label>
                </div>
                <div class="col s2">
                    <%
                        if (selectingProductList.isEmpty()) {
                    %>
                    <a id="selectingProduct" class="btn disabled" onclick="showList();">Products</a>
                    <%} else {%>
                    <a id="selectingProduct" class="btn " onclick="showList();">Products</a>
                    <%}%>
                </div>
            </div>


            <div class="row">
                <div id="productos">
                    <form id="formElement" action="FrontController" method="get">
                        <ul class="list"id="listProduct">
                            <%

                                if (list != null) {
                                    for (Product producto : list) {
                            %>

                            <li  id="<%=producto.getName()%>">
                                <div class=" col s12 l4 m4">
                                    <div class="row">
                                        <div class=" col s4">
                                            <div class=" valign-wrapper" style="height: 111px;">
                                                <h4 class=" valign light name" ><%= producto.getName()%></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card small">
                                        <div class="card-image">
                                            <img style="width: 50%;"src="img/portatil.jpg">
                                            <!--<span class="card-title">Título de la Tarjeta</span>-->
                                        </div>
                                        <div class="card-content">
                                            <p><%=producto.getDescription()%></p>
                                        </div>
                                        <div class="card-action">
                                            <p>
                                                <%
                                                    if (selectingProductList.contains(producto)) {
                                                %>
                                                <input checked type="checkbox" precio="12" name="<%= producto.getDescription()%>" id="<%= producto.getProductId()%>" onclick="addProduct('<%= producto.getProductId()%>')"/>
                                                <%
                                                } else {
                                                %>
                                                <input type="checkbox" precio="12" name="<%= producto.getDescription()%>" id="<%= producto.getProductId()%>" onclick="addProduct('<%= producto.getProductId()%>')"/>
                                                <%}%>
                                                <label for="<%= producto.getProductId()%>">add to trolley</label>
                                            </p>
                                            <a class="modal-trigger" href="#<%="modal" + producto.getProductId()%>">see</a>
                                            <a class="modal-trigger" href="#<%="modal2" + producto.getProductId()%>" style="color: red;">remove</a>
                                        </div>
                                    </div>
                                </div>
                                <div id="<%="modal2" + producto.getProductId()%>" class="modal">
                                    <div class="modal-content">
                                        <h4 style="text-align: center;">Do you want to remove the product</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="/LayautPresentation/FrontController?controller=ControllerDeleteElement&id=<%=producto.getProductId()%>" onclick=""class=" modal-action modal-close waves-effect waves-green btn-flat">Accept</a>
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
                                    </div>
                                </div>
                                <!--@@@@@@@@@@@@@@@@@@@@@@@@@-->
                                <div id="<%="modal" + producto.getProductId()%>" class="modal modal-fixed-footer">
                                    <div class="modal-content">
                                        <h4 style="text-align: center;"><%=producto.getName()%></h4>
                                        <form action="sing">
                                            <div class="row">
                                                <div class="col s3">
                                                    <h5>Cost:</h5>
                                                </div>
                                                <div class="col s5">
                                                    <h5><%=producto.getPurchaseCost()%> </h5>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col s3">
                                                    <h5>Description:</h5>
                                                </div>
                                                <div class="col s5">
                                                    <h5><%=producto.getDescription()%> </h5>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col s3">
                                                    <h5>Abailable:</h5>
                                                </div>
                                                <div  class="col s4">
                                                    <h5><%=producto.getAvailable()%> </h5>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div  class="col s12">
                                                    <img style="width: 30%;" src="img/portatil.jpg">
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Acept</a>
                                        <a href="#!" class=" modal-action modal-close red waves-effect waves-green btn-flat">delete</a>
                                        <a href="#!" class=" modal-action  waves-effect  waves-green btn-flat">Edit</a>
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
            <div class="row">
                <ul class="pagination">
                    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                        <%
                            String range = (String) request.getAttribute("range");
                            if (range.equals("0")) {
                        %>
                    <li class="active"><a>1</a></li>

                    <%
                    } else {
                    %>
                    <li><a class="waves-effect" href="FrontController">1</a></li>

                    <%
                        }
                    %>
                    <%
                        if (range.equals("6")) {
                    %>
                    <li class="active"><a href="FrontController?range=6">2</a></li>

                    <%
                    } else {
                    %>
                    <li class="waves-effect"><a href="FrontController?range=6">2</a></li>

                    <%
                        }
                    %>
                    <%
                        if (range.equals("12")) {
                    %>
                    <li class="active"><a href="FrontController?range=12">3</a></li>

                    <%
                    } else {
                    %>
                    <li class="waves-effect"><a href="FrontController?range=12">3</a></li>

                    <%
                        }
                    %>
                    <%
                        if (range.equals("18")) {
                    %>
                    <li class="active"><a href="FrontController?range=18">4</a></li>

                    <%
                    } else {
                    %>
                    <li class="waves-effect"><a href="FrontController?range=18">4</a></li>

                    <%
                        }
                    %>
                    <%
                        if (range.equals("24")) {
                    %>
                    <li class="active"><a href="FrontController?range=24">5</a></li>

                    <%
                    } else {
                    %>
                    <li class="waves-effect"><a href="FrontController?range=24">5</a></li>

                    <%
                        }
                    %>
                    <%
                        if (range.equals("30")) {
                    %>
                    <li class="active"><a href="FrontController?range=30">6</a></li>

                    <%
                    } else {
                    %>
                    <li class="waves-effect"><a href="FrontController?range=30">6</a></li>

                    <%
                        }
                    %>

                    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                </ul>
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
        <%@include file="/view/javaScript/javaScript.jsp"%>
    </body>
</html>
