/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import model.Product;
import model.ShopingCar;

/**
 *
 * @author Osvaldo
 */
public class ControllerSelectedProduct extends FrontCommand {

    @Override
    public void process() {
        try {
            ShopingCar shopingCar = getShopingCar();
            List<Product> listProduct = shopingCar.getListProduct();
            this.request.setAttribute("listProducto", listProduct);
            forward("/selectingProduct.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(CommandIndex.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
