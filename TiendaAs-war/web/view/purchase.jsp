
<%@page import="model.Client"%>
<%@page import="model.Purchase"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/view/css/css.jsp"%>
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
                        Collection<Purchase> purchaseCollection = (Collection) request.getAttribute("purchaseCollection");
                       Client client=(Client) request.getAttribute("client");
                        if (purchaseCollection != null) {
                            for (Purchase purchase : purchaseCollection) {
                    %>
                    <tr >
                        <td><%=client.getName()%></td>
                        <td><%=purchase.getProductId().getDescription()%></td>
                        <td><%=purchase.getProductId().getPurchaseCost().toString()%></td>
                        <td><%=purchase.getSalesDate()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody> 
            </table>
        </div>

    </div>
    <%@include file="/view/javaScript/javaScript.jsp"%>
</body>
</html>
