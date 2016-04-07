package model;

import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;

/**
 *
 * @author Osvaldo
 */
@Stateless
@LocalBean
public class StadisticPurchase {

    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
     */
    private String name;
    private List<Product> list;
    private Date date;

    public void init(String name, List<Product> list,Date date) {
        this.name = name;
        this.list = list;
        this.date=date;
    }

    public String getName() {
        return name;
    }

    public List<Product> getList() {
        return list;
    }

    public Date getDate() {
        return date;
    }

}
