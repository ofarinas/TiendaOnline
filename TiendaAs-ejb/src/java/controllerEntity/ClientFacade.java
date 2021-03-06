package controllerEntity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Client;

/**
 *
 * @author Osvaldo
 */
@Stateless
public class ClientFacade extends AbstractFacade<Client> implements ClientFacadeLocal {

    @PersistenceContext(unitName = "TiendaAs-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClientFacade() {
        super(Client.class);
    }

    @Override
    public Client findByDni(String dni) {
        Query queryDniClient = em.createNamedQuery("Client.findByDni");
        return coutClient(queryDniClient, dni)?(Client)queryDniClient.setParameter("dni", dni).getResultList().get(0):null;
    }

    private static boolean coutClient(Query queryDniClient, String dni) {
        return queryDniClient.setParameter("dni", dni).getResultList().size()!=0;
    }
}
