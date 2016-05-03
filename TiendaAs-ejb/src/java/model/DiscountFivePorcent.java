/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Osvaldo
 */
public class DiscountFivePorcent implements Disccount,Serializable {

   private double value=0;
    
    @Override
    public double getDisccount() {
        return value;
    }

    @Override
    public void setDisccount(double value) {
        this.value = value*0.05;
    }

    @Override
    public double calculate() {
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
