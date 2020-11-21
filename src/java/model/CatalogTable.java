/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Vector;
import javax.persistence.EntityManager;

/**
 *
 * @author Ayna
 */
public class CatalogTable {

    public static Vector<Catalog> findAllCatalog(EntityManager em) {
        Vector<Catalog> catalogList = null;
        try {
            catalogList = (Vector<Catalog>) em.createNamedQuery("Catalog.findAll").getResultList();
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return catalogList;
    }

    public static Catalog findCatalogById(EntityManager em, int id) {
        Catalog catalog = null;
        try {
            catalog = em.find(Catalog.class, id);
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return catalog;
    }

    //public static int updateEmployee(EntityManager em, 
    //        UserTransaction utx, Employee emp) {
    public static int updateCatalog(EntityManager em, Catalog catalog) {
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

        }
        return 1;

    }

    public static int removeCatalog(EntityManager em, int id) {
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

        }
        return 1;
    }

    public static int insertCatalog(EntityManager em, Catalog catalog) {
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

        }
        return 1;
    }
}
