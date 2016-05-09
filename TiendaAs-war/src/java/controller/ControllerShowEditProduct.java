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
public class ControllerShowEditProduct extends FrontCommand{

    @Override
    public void process() {
    try {
        String id = (String) request.getParameter("id");
            ProductFacadeLocal productoFacade = InitialContext.doLookup(
                    "java:module/ProductFacade");
            final Product element = productoFacade.find(Integer.valueOf(id));
            request.setAttribute("product", element);
            forward("/view/editProduct.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(ControllerDeleteElement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
