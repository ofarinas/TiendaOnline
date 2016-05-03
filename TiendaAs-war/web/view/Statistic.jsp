<%-- 
    Document   : personalInfo
    Created on : Apr 4, 2016, 9:02:46 AM
    Author     : Osvaldo
--%>

<%@page import="model.Statistic"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/css.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <%
            Statistic statistic = (Statistic) request.getAttribute("statistic");
        %>
        <div class="container">
            <h2 style="text-align: center">Statistics of the Store</h3>
                <div class="row " style="padding: 12px">
                    <div class="col offset-s2 s8">
                        <table class="">
                            <thead>
                                <tr>
                                    <th data-field="id">Statics</th>
                                    <th data-field="name">Value</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td><h6>Number of User </h6></td>
                                    <td><%=statistic.getCountUser()%></td>
                                </tr>
                                <tr>
                                    <td>Number of Purchase</td>
                                    <td><%=statistic.getCountPurchase()%></td>
                                </tr>
                                <tr>
                                    <td>Product most selling</td>
                                    <td><%=statistic.ProductMostSelling()%></td>
                                </tr>
<!--                                <tr>
                                    <td>Product most seeing </td>
                                    <td>Lollipop</td>
                                </tr>-->
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>

        <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </body>
</html>
