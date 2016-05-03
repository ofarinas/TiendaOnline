/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controllerEntity.ManufacturerFacadeLocal;
import controllerEntity.ProductCodeFacadeLocal;
import controllerEntity.ProductFacadeLocal;
import java.math.BigDecimal;
import java.util.List;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Product;

/**
 *
 * @author Osvaldo
 */
public class ControllerCreateProduct extends FrontCommand {

    ProductFacadeLocal productoFacadeLocal;
    ProductCodeFacadeLocal ProductCodeFacadeLocal;
    ManufacturerFacadeLocal manufacturerFacade;
    
    public ControllerCreateProduct() throws NamingException {
        this.productoFacadeLocal = InitialContext.doLookup("java:module/ProductFacade");
        this.manufacturerFacade = InitialContext.doLookup("java:module/ManufacturerFacade");
        this.ProductCodeFacadeLocal = InitialContext.doLookup("java:module/ProductCodeFacade");
    }

    public int getId() {
        int id = -1;
        List<Product> listProduct = productoFacadeLocal.findAll();
        for (Product product : listProduct) {
            if (product.getProductId() > id) {
                id = product.getProductId();
            }
        }
        return id+1;
    }
    
    @Override
    public void process() {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        Product product = new Product(getId());
        product.setManufacturerId(manufacturerFacade.findAll().get(0));
        product.setProductCode(ProductCodeFacadeLocal.findAll().get(0));
        product.setDescription(description);
        product.setName(name);
        product.setPurchaseCost(new BigDecimal(price));
        productoFacadeLocal.create(product);
        redirect("/LayautPresentation/FrontController");
    }
    
}
