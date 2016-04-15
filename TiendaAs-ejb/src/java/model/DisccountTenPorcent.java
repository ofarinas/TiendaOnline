/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Osvaldo
 */
public class DisccountTenPorcent implements Disccount{
private double value=0;
    
    @Override
    public double getDisccount() {
        return value;
    }

    
    @Override
    public void setDisccount(double value) {
        this.value = value*0.1;
    }
    
}
