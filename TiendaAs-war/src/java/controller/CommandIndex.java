package controller;

import controllerEntity.ProductFacadeLocal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Statistic;

public class CommandIndex extends FrontCommand {

    @Override
    public void process() {

        try {
            ProductFacadeLocal producto = InitialContext.doLookup(
                    "java:module/ProductFacade");
            List<Product> listProduct = producto.findRange(getRange());
            addNewVisitor();
            this.request.setAttribute("listProducto", listProduct);
            forward("/index.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(CommandIndex.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void countPersonToVisitPage() throws NamingException {
        Statistic stadistic = InitialContext.doLookup("java:module/Statistic");
        stadistic.setCountUser(stadistic.getCountUser() + 1);
    }

    public void addNewVisitor() throws NamingException {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("coutPeople") == null) {
            countPersonToVisitPage();
            session.setAttribute("coutPeople", 1);
        }
    }

    private int [] getRange() {
        String range = request.getParameter("range");
        if(range==null)range="0";
        request.setAttribute("range",range);
        return new int[]{Integer.valueOf(range),Integer.valueOf(range)+5};
    }
}
