package controller;

import controllerEntity.ProductFacade;
import controllerEntity.ProductFacadeLocal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import model.Product;

public class CommandIndex extends FrontCommand {

    @Override
    public void process() {
        
        try {
            ProductFacadeLocal producto = InitialContext.doLookup(
                    "java:module/ProductFacade");
            List<Product> listProduct = producto.findAll();
            this.request.setAttribute("listProducto", listProduct);
            forward("/index.jsp");
        } catch (NamingException ex) {
            Logger.getLogger(CommandIndex.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
