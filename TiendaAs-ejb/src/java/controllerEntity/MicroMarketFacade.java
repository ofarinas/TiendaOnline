/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerEntity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.MicroMarket;

/**
 *
 * @author Osvaldo
 */
@Stateless
public class MicroMarketFacade extends AbstractFacade<MicroMarket> implements MicroMarketFacadeLocal {

    @PersistenceContext(unitName = "TiendaAs-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MicroMarketFacade() {
        super(MicroMarket.class);
    }
    
}
