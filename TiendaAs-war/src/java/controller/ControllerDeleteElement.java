/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.ProductFacadeLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Product;

/**
 *
 * @author Osvaldo
 */
public class ControllerDeleteElement extends FrontCommand {

    @Override
    public void process() {
        try {
        String id = (String) request.getParameter("id");
            ProductFacadeLocal productoFacade = InitialContext.doLookup(
                    "java:module/ProductFacade");
            final Product element = productoFacade.find(Integer.valueOf(id));
            productoFacade.remove(element);
            redirect("/LayautPresentation/FrontController");
        } catch (NamingException ex) {
            Logger.getLogger(ControllerDeleteElement.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
