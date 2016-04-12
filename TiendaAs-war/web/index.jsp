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
                            out.print(request.getRequestURL());
                            List<Product> list = (List) request.getAttribute("listProducto");
                            if (list != null) {
                                for (Product producto : list) {
                        %>

                        <li  id="<%=producto.getDescription()%>">
                            <div class=" col s12 l4 m4">
                                <div class="card small">
									<div class="card-image waves-effect waves-block waves-light">
										<img class="activator" src="img/portatil.jpg">
									</div>
									<div class="card-content">
										<span class="card-title activator grey-text text-darken-4"><%= System.out.print(producto.getDescription()) %><i class="material-icons right">more_vert</i></span>
										<p>
											<input type="checkbox" precio="12" name="<%= producto.getDescription()%>" id="<%= producto.getProductId()%>" onclick="addProduct('<%= producto.getProductId()%>')"/>
											<%= if( producto.getQuantityOnHand() > 0 ){ %>
											<label for="<%= producto.getProductId()%>">add to trolley</label>
											<%= } %>
										</p>
									</div>
									<div class="card-reveal">
										<span class="card-title grey-text text-darken-4"><%= System.out.print(producto.getDescription()) %><i class="material-icons right">close</i></span>
										<p>Unidades disponibles: <%= System.out.print( producto.getQuantityOnHand().toString() ) %></p>
										<p>Precio: <%= System.out.print( producto.getPurchaseCost().toString() ) %></p>
										<p>Descripcion: </p>
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
        <%@include file="/view/javaScript/javaScript.jsp"%>
    </body>
</html>
