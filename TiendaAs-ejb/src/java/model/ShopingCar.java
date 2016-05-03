/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateful;
import javax.ejb.LocalBean;

/**
 *
 * @author Osvaldo
 */
@Stateful
@LocalBean
public class ShopingCar {

    private double total = 0;
    @EJB
    ControllerDiscount controllerDiscount;
    double discount;

    public double getDiscount() {
        return discount;
    }

    public double getFinalPrice() {
        discount = controllerDiscount.calculateDiscoutn(getTotal());
        if (discount == 0) {
            return 0;
        } else {
            return discount;
        }
    }

    public ShopingCar( List<Product> listProduct) {
        this.listProduct = listProduct;
    }

    private List<Product> listProduct;

    public ShopingCar() {
        listProduct = new ArrayList<>();
    }

    public List<Product> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<Product> listProduct) {
        this.listProduct = listProduct;
    }

    public ShopingCar addProduct(Product product) {
        listProduct.add(product);
        return this;
    }

    public ShopingCar removeProduct(Product product) {
        listProduct.remove(product);
        return this;
    }

    public double getTotal() {
        total = 0;
        for (Product product : listProduct) {
            total += product.getPurchaseCost().doubleValue();
        }
        return total;
    }

    @Override
    public String toString() {
        String listaCarrito = "";
        for (Product product : listProduct) {
            listaCarrito += product.getDescription() + ",";
        }
        return listaCarrito;
    }
}
