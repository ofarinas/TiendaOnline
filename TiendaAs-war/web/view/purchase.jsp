<%-- 
    Document   : purshase
    Created on : Apr 7, 2016, 12:39:33 PM
    Author     : Osvaldo
--%>

<%@page import="model.StadisticPurchase"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Object js = request.getAttribute("js");
            if (js != null) {
        %>                
        <%@include file="/view/css/css.jsp"%>
        <%
        } else {
        %>
        <%@include file="/view/css/css2.jsp"%>
        <%
            }
        %>
        <%--<%@include file="/view/css/css2.jsp"%>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container">
            <h3 style="text-align: center">Purchase</h3>
            <%
                if (request.getAttribute("formPurchase") == null) {


            %>
            <form action="../FrontController" method="get">
                <%                } else {
                %>
                <form action="FrontController" method="get">
                    <%
                        }
                    %>
                    <input hidden type="text" name="controller" value="ControlllerSearchPurchse">
                    <div class="row">
                        <div style="position:relative;top:23px;" class="col offset-s3">
                            <label ><i class="material-icons">search</i></label>
                        </div>
                        <div class="input-field  col s4">
                            <input type="text" placeholder="dni" size="9" name="dni" id="buscadorProducto" class=" search validate">
                        </div>
                        <div style="position:relative;top:23px;" class="col s2">
                            <input type="submit"  id="selectingProduct" class="btn" value="Purchases" ></input>
                        </div>
                </form>
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
                        StadisticPurchase purchace = (StadisticPurchase) request.getAttribute("stadisticPurchases");
                        if (purchace != null) {
                            List<Product> list = (List) purchace.getList();
                            for (Product producto : list) {
                    %>
                    <tr id="<%=producto.getProductId()%>">
                        <td><%=purchace.getName()%></td>
                        <td><%=producto.getDescription()%></td>
                        <td><%=producto.getPurchaseCost()%></td>
                        <td><%=purchace.getDate()%></td>
                        <!--<td><a class="waves-effect red darken-2 waves-light btn" onclick="deleteRowPrdoduct(<%=producto.getProductId()%>)">delete</a></td>-->
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
    <%
        if (js != null) {
    %>                
    <%@include file="/view/javaScript/javaScript.jsp"%>
    <%
    } else {
    %>
    <%@include file="/view/javaScript/javaScript2.jsp"%>
    <%
        }
    %>
</body>
</html>
