package model;
import javax.ejb.LocalBean;
import javax.ejb.Schedule;
import javax.ejb.Singleton;

/**
 *
 * @author Osvaldo
 */
@Singleton
@LocalBean
public class ControllerDiscount {

    Disccount disccount=null;

    public ControllerDiscount() {
    }

//    @Schedule(dayOfMonth = "–1")
//    public void setTenPorcentDisccountFinanMonth() {
//        disccount = new DisccountTenPorcent();
//    }

    @Schedule(second = "*",minute = "*", hour="*")
    public void setFivePorcentDisccount() {
        if(disccount==null)
        disccount = new DiscountFivePorcent();
    }

    public double calculateDiscoutn( double value) {
        disccount.setDisccount(value);
        return disccount.getDisccount();
    }
   
//    @Schedule(dayOfWeek="Fri")
//    public void setTenPorcentDisccountFriday() {
//        if(disccount==null)
//        disccount = new DisccountTenPorcent();
//    }
}
