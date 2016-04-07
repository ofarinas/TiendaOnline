package model;

import java.util.HashMap;
import java.util.Map;
import javax.ejb.Singleton;
import javax.ejb.LocalBean;

/**
 *
 * @author Osvaldo
 */
@Singleton
@LocalBean
public class StadisticPurchaseList {

    private Map<String, StadisticPurchase> list;

    public StadisticPurchaseList() {
        list = new HashMap<>();
    }

    public Map<String, StadisticPurchase> getList() {
        return list;
    }

    public StadisticPurchase find(String dni) {
        return list.get(dni);
    }

    public StadisticPurchaseList add(String dni, StadisticPurchase purchase) {
        list.put(dni, purchase);
        return this;
    }
}
