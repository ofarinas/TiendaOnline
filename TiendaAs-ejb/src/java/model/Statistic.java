package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;

/**
 *
 * @author Osvaldo
 */
@Singleton
@LocalBean
public class Statistic {

    private int countUser;
    private int countPurchase;
    private Map<String, Integer> listSellingProduct;
    private Map<String, Integer> listViewProduct;

    public Statistic() {
        this.countUser = 0;
        this.countPurchase = 0;
        listSellingProduct = new HashMap<>();
        listViewProduct = new HashMap<>();
    }

    public void addProductToSellingList(List<Product> lista) {
        for (Product product : lista) {
            if (listSellingProduct.get(product.getDescription()) == null) {
                listSellingProduct.put(product.getDescription(), 1);
            } else {
                listSellingProduct.put(product.getDescription(), listSellingProduct.get(product.getDescription()) + 1);
            }
        }
    }

    public void addProductToSeeingList(Product product) {
        if (listViewProduct.get(product.getDescription()) == null) {
            listViewProduct.put(product.getDescription(), 1);
        } else {
            listViewProduct.put(product.getDescription(), listViewProduct.get(product.getDescription()) + 1);
        }
    }
    public String ProductMostSelling(){
    String name="";
    int count=0;
        for (String element : listSellingProduct.keySet()) {
            if(listSellingProduct.get(element)>count){
                name=element;
                count=listSellingProduct.get(element);
            }
        }
        return name;
    }

    public void init(int countUser, int countPurchase) {
        this.countUser = countUser;
        this.countPurchase = countPurchase;
    }

    public int getCountUser() {
        return countUser;
    }

    public int getCountPurchase() {
        return countPurchase;
    }


    public void setCountUser(int countUser) {
        this.countUser = countUser;
    }

    public void setCountPurchase(int countPurchase) {
        this.countPurchase = countPurchase;
    }

}
