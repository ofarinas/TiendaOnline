<%-- 
    Document   : purshase
    Created on : Apr 7, 2016, 12:39:33 PM
    Author     : Osvaldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="nav.jsp" %>
        <div class="container">
            <h3 style="text-align: center">List selecting product</h3>
            <table>
                <thead>
                    <tr>
                        <th data-field="id">Name</th>
                        <th data-field="name">Available</th>
                        <th data-field="price">Item Price</th>
                        <th data-field="delete"></th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        List<Product> list = (List) request.getAttribute("listProducto");
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
        <script type="text/javascript" src="js/jquery-2.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </body>
</html>
