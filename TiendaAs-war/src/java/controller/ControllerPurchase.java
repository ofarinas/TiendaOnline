/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.ClientFacadeLocal;
import controllerEntity.ProductFacadeLocal;
import controllerEntity.PurchaseFacadeLocal;
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
import model.StadisticPurchase;
import model.StadisticPurchaseList;

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
            addProduct();
            clanShoppingCar();
        } catch (NamingException ex) {
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
        StadisticPurchaseList purshaseList = InitialContext.doLookup("java:module/StadisticPurchaseList");
        StadisticPurchase purshase = InitialContext.doLookup("java:module/StadisticPurchase");
        purshase.init(request.getParameter("name"), getShopingCar().getListProduct(), getToday());
        purshaseList.add(request.getParameter("dni"), purshase);
        request.setAttribute("js", true);
    }

    private void addProduct() throws NamingException {
        ProductFacadeLocal producto = InitialContext.doLookup(
                "java:module/ProductFacade");
        List<Product> listProduct = producto.findAll();
        this.request.setAttribute("listProducto", listProduct);
        forward("/index.jsp");
    }

    private void createPdf() throws NamingException {
        BuildPdf buildPdf = InitialContext.doLookup("java:module/BuildPdf");
        buildPdf.build("", client, getShopingCar());
//            response.getWriter()
//        new CreatePdf().build(Client);
    }

    private void clanShoppingCar() throws NamingException {
        getShopingCar().getListProduct().clear();
    }

}
