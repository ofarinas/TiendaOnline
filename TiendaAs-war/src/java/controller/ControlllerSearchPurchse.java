/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.ClientFacadeLocal;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Client;
import model.Purchase;

/**
 *
 * @author Osvaldo
 */
public class ControlllerSearchPurchse extends FrontCommand{

    @Override
    public void process() {
        String dni = request.getParameter("dni");
        try {
            ClientFacadeLocal clientFacadeLocal = InitialContext.doLookup("java:module/ClientFacade");
            Client client=clientFacadeLocal.findByDni(dni);
            if(client!=null)
            client=clientFacadeLocal.find(client.getClientId());
            Collection<Purchase> purchaseCollection=null;
            if(client!=null)
             purchaseCollection = client.getPurchaseCollection();
            this.request.setAttribute("js", new Object());
            this.request.setAttribute("formPurchase", new Object());
           this.request.setAttribute("client", client);
           this.request.setAttribute("purchaseCollection", purchaseCollection);
            forward("/view/purchase.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(ControlllerSearchPurchse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
