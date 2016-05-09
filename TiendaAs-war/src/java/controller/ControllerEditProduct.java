package controller;

import controllerEntity.ProductFacadeLocal;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Product;

/**
 *
 * @author Osvaldo
 */
public class ControllerEditProduct extends FrontCommand{

    @Override
    public void process() {
               try {
        String id = (String) request.getParameter("id");
        String name = (String) request.getParameter("name");
        String description = (String) request.getParameter("description");
        String price = (String) request.getParameter("price");
        
            ProductFacadeLocal productoFacade = InitialContext.doLookup(
                    "java:module/ProductFacade");
            final Product element = productoFacade.find(Integer.valueOf(id));
            element.setName(name);
            element.setDescription(description);
            element.setPurchaseCost(new BigDecimal(price));
            productoFacade.edit(element);
            redirect("/LayautPresentation/FrontController");
         } catch (NamingException ex) {
            Logger.getLogger(ControllerDeleteElement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
