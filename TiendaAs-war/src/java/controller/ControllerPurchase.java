/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.lowagie.text.Paragraph;
import controllerEntity.ClientFacadeLocal;
import controllerEntity.ProductFacadeLocal;
import controllerEntity.PurchaseFacadeLocal;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.BuildPdf;
import model.Client;
import model.Product;
import model.Purchase;
import model.Statistic;

/**
 *
 * @author Osvaldo
 */
public class ControllerPurchase extends FrontCommand {

    private ClientFacadeLocal clientFacadeLocal;
    private Client client;

    @Override
    public void process() {
        try {
            createClient();
            createPurchase();
            addStadisticPurchase();
            createPdf();
//            addProduct();
            cleanShoppingCar();
        } catch (NamingException ex) {
            Logger.getLogger(ControllerPurchase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void createPurchase() throws NamingException {
        PurchaseFacadeLocal purchaseFacade = InitialContext.doLookup("java:module/PurchaseFacade");
        for (Product product : getShopingCar().getListProduct()) {
            purchaseFacade.create(buildPurchase(product));
        }

    }

    private Purchase buildPurchase(Product product) {
        return new Purchase(0, Short.MIN_VALUE, BigDecimal.ZERO, getToday(), getToday(), "", client, product);
    }

    private static Date getToday() {
        return GregorianCalendar.getInstance().getTime();
    }

    private void createClient() throws NamingException {
        clientFacadeLocal = InitialContext.doLookup("java:module/ClientFacade");
        client = clientFacadeLocal.findByDni(request.getParameter("dni"));
        if (client == null) {
            client = new Client(request.getParameter("dni"), request.getParameter("name"), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone"));
            clientFacadeLocal.create(client);
        }
    }

    private void addStadisticPurchase() throws NamingException {
        Statistic stadistic = InitialContext.doLookup("java:module/Statistic");
        stadistic.addProductToSellingList(getShopingCar().getListProduct());
        countPurchase();
        request.setAttribute("js", true);
    }

    private void countPurchase() throws NamingException {
        Statistic stadistic = InitialContext.doLookup("java:module/Statistic");
        stadistic.setCountPurchase(stadistic.getCountPurchase() + 1);
    }

    private void addProduct() throws NamingException {
        ProductFacadeLocal producto = InitialContext.doLookup(
                "java:module/ProductFacade");
        List<Product> listProduct = producto.findAll();
        this.request.setAttribute("listProducto", listProduct);
        forward("/index.jsp");
    }

    private void createPdf() throws NamingException, IOException {
        String pdf = "";
        pdf += " <h1>Recipe</h1>";
        pdf += "Name of client:" + client.getName() + "<br>";
        pdf += "<h4>Products</h4><br>";
        for (Product product : getShopingCar().getListProduct()) {
                pdf+="<strong>Name of product</strong>: " + product.getDescription()+" ";
                pdf+="<strong>Price</strong>:" + product.getPurchaseCost()+"<br>";
            }
        response.getOutputStream().print(pdf);
        }

    

    private void cleanShoppingCar() throws NamingException {
        getShopingCar().getListProduct().clear();
    }

}
