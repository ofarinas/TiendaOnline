<%-- 
    Document   : purshase
    Created on : Apr 7, 2016, 12:39:33 PM
    Author     : Osvaldo
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/css.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h3 style="text-align: center">Purchase</h3>
            <div class="row">
                <div class="input-field  col s5 offset-s3">
                    <label ><i class="material-icons">search</i></label>
                    <input type="text" id="buscadorProducto" class=" search validate">
                </div>
                <div style="position:relative;top:23px;" class="col s2">
                    <a id="selectingProduct" class="btn " onclick="">Purchases</a>
                </div>
            </div>
            <div class="row">
                <table>
                    <thead>
                        <tr>
                            <th data-field="id">Name of client</th>
                            <th data-field="id">Name of product</th>
                            <th data-field="price">Price</th>
                            <th data-field="date"> Date</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            List<Product> list = (List) request.getAttribute("purchase");
                            if (list != null) {
                                for (Product producto : list) {
                        %>
                        <tr id="<%=producto.getProductId()%>">
                            <td><%=producto.getDescription()%></td>
                            <td><%=producto.getAvailable()%></td>
                            <td><%=producto.getPurchaseCost()%></td>
                            <td><a class="waves-effect red darken-2 waves-light btn" onclick="deleteRowPrdoduct(<%=producto.getProductId()%>)">delete</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr >
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr >
                            <td></td>
                            <td><a class="waves-effect waves-light btn" onclick="">clean Trolley</a></td>
                            <td><a class="waves-effect waves-light btn" href="/LayautPresentation/view/personalInfo.jsp">continue</a></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        <script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.min.js"></script>
        <script type="text/javascript" src="../js/index.js"></script>
    </body>
</html>
