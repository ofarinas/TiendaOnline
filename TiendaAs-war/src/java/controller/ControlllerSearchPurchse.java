/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.PurchaseFacadeLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.StadisticPurchase;
import model.StadisticPurchaseList;

/**
 *
 * @author Osvaldo
 */
public class ControlllerSearchPurchse extends FrontCommand{

    @Override
    public void process() {
        String dni = request.getParameter("dni");
        try {
            StadisticPurchaseList purshaseList=InitialContext.doLookup("java:module/StadisticPurchaseList");
            StadisticPurchase stadisticPurchases = purshaseList.find(dni);
            PurchaseFacadeLocal facadeLocal= InitialContext.doLookup("java:module/PurchaseFacade");
            this.request.setAttribute("stadisticPurchases", stadisticPurchases);
            this.request.setAttribute("js", new Object());
            this.request.setAttribute("formPurchase", new Object());
            forward("/view/purchase.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(ControlllerSearchPurchse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
