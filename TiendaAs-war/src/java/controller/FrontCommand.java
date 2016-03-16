/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ShopingCar;

/**
 *
 * @author Osvaldo
 */
public abstract class FrontCommand {

    protected HttpServletRequest request;
    protected HttpServletResponse response;
    protected ServletContext context;

    public FrontCommand() {
    }

    public ShopingCar getShopingCar() throws NamingException {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("shopingCar") == null) {
            ShopingCar shopingCar = InitialContext.doLookup(
                    "java:module/ShopingCar");
            session.setAttribute("shopingCar", shopingCar);
            return shopingCar;
        } else {
            return (ShopingCar) session.getAttribute("shopingCar");
        }
    }

    public void init(HttpServletRequest request, HttpServletResponse response, ServletContext context) {
        this.context = context;
        this.response = response;
        this.request = request;
    }

    public abstract void process();

    public void forward(String page) {
        RequestDispatcher dispatcher = context.getRequestDispatcher(page);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(FrontCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FrontCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
