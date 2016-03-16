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
import model.ShopingCar;

/**
 *
 * @author Osvaldo
 */
public class ControllerRemoveProduct extends FrontCommand{

    @Override
    public void process() {
    try {
            ShopingCar shopingCar = getShopingCar();
            ProductFacadeLocal productoFacade = InitialContext.doLookup(
                    "java:module/ProductFacade");
            String id = request.getParameter("id");
            Product product = productoFacade.find(Integer.valueOf(id));
            shopingCar.removeProduct(product);
        } catch (NamingException ex) {
            Logger.getLogger(ControllerAddProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
