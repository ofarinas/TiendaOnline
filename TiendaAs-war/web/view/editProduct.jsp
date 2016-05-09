<%-- 
    Document   : personalInfo
    Created on : Apr 4, 2016, 9:02:46 AM
    Author     : Osvaldo
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <%@include file="/view/css/css2.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <%
            Product product = (Product) request.getAttribute("product");
        %>
        <div class="container">
            <h3 style="text-align: center">Edit Product</h3>
            <div class="row">
                <form  id="formPersonalInformation" class="col s8 offset-s2" action="FrontController">
                    <input hidden type="text" name="controller" value="ControllerEditProduct">
                    <input hidden type="text" name="id" value="<%=product.getProductId()%>">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">account_circle</i>
                            <input  id="name" name="name" value="<%=product.getName() %>" type="text" class="validate">
                            <label for="first_name">Name</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea  id="Description"  name="description"class="materialize-textarea"><%=product.getDescription()%></textarea>
                            <label for="Description">Description</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">credit_card</i>
                            <input value="<%=product.getPurchaseCost()%>"   type="text" name="price" id="Price" class="validate">
                            <label for="Price">Price</label>
                        </div>
                    </div>
                    
                    <div  class="row">
                        <div class="col offset-l8 offset-m2 offset-s2">
                            <input type="submit" class="waves-effect waves-light btn "value="edit">
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
                            <a onclick="createPdf()" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
                            <a href="/LayautPresentation/FrontController"  class=" modal-action modal-close waves-effect waves-green btn-flat">disagree</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/view/javaScript/javaScript.jsp"%>
    </body>
</html>
