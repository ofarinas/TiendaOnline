/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerEntity;

import java.util.List;
import javax.ejb.Local;
import model.Manufacturer;

/**
 *
 * @author Osvaldo
 */
@Local
public interface ManufacturerFacadeLocal {

    void create(Manufacturer manufacturer);

    void edit(Manufacturer manufacturer);

    void remove(Manufacturer manufacturer);

    Manufacturer find(Object id);

    List<Manufacturer> findAll();

    List<Manufacturer> findRange(int[] range);

    int count();
    
}
