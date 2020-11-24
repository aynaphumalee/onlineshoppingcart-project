/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Ayna
 */
public class CatalogTable {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");

    public static List<Catalog> findAllCatalog() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");
        EntityManager em = emf.createEntityManager();
        List<Catalog> catalogList = null;
        try {
            catalogList = (List<Catalog>) em.createNamedQuery("Catalog.findAll").getResultList();
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        } finally {
            em.close();
            emf.close();
        }
        return catalogList;
    }

    public static Catalog findCatalogById(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");
        EntityManager em = emf.createEntityManager();
        Catalog catalog = null;
        try {
            catalog = em.find(Catalog.class, id);
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        } finally {
            em.close();
            emf.close();
        }
        return catalog;
    }

    //public static int updateEmployee(EntityManager em, 
    //        UserTransaction utx, Employee emp) {
    public static int updateCatalog(Catalog catalog) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Catalog target = em.find(Catalog.class, catalog.getId());
            if (target == null) {
                return 0;
            }
            target.setName(catalog.getName());
            target.setRate(catalog.getRate());
            target.setYears(catalog.getYears());
            target.setPrice(catalog.getPrice());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;

    }

    public static int removeCatalog(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Catalog target = em.find(Catalog.class, id);
            if (target == null) {
                return 0;
            }
            em.remove(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }

    public static int insertCatalog(Catalog catalog) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("OnlineShoppingCartPU");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Catalog target = em.find(Catalog.class, catalog.getId());
            if (target != null) {
                return 0;
            }
            em.persist(catalog);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);

        } finally {
            em.close();
            emf.close();
        }
        return 1;
    }
}
