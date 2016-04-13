/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Statistic;

/**
 *
 * @author Osvaldo
 */
public class ControllerStatics extends FrontCommand{

    @Override
    public void process() {
        try {
            Statistic statistic = InitialContext.doLookup("java:module/Statistic");
            this.request.setAttribute("statistic", statistic);
            forward("/view/Statistic.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(ControllerStatics.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
