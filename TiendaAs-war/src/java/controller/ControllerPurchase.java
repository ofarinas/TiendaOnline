/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.ClientFacadeLocal;
import controllerEntity.PurchaseFacadeLocal;
import java.math.BigDecimal;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Client;
import model.Product;
import model.Purchase;
import model.ShopingCar;

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
            forward("/index.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(ControllerPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }
        forward("/index.jsp");
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
        client = new Client(request.getParameter("dni"), request.getParameter("name"), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone"));
        clientFacadeLocal.create(client);
    }
}
