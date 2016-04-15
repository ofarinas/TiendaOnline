/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.ejb.LocalBean;
import javax.ejb.Schedule;
import javax.ejb.Singleton;

/**
 *
 * @author Osvaldo
 */
@Singleton
@LocalBean
public class ControllerDiscount {

    Disccount disccount = null;

    public ControllerDiscount() {
    }

//    @Schedule(dayOfMonth = "–1")
//    public void setTenPorcentDisccount() {
//        disccount = new DisccountTenPorcent();
//    }

    @Schedule(dayOfWeek="Fri",second = "*",minute = "*", hour="*")
    public void setFivePorcentDisccount() {
        disccount = new DiscountFivePorcent();
    }


    public Disccount getDisccount() {
        return disccount;
    }
    
}
