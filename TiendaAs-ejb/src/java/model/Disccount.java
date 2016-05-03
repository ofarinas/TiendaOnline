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
interface Disccount extends Serializable{
 public double getDisccount();   
 public void setDisccount(double value);   
 public double calculate();   
 
}
