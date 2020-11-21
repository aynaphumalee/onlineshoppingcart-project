/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import java.util.Vector;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Ayna
 */
public class CartTable {

    public static Vector<Cart> findAllCart(EntityManager em) {
        Vector<Cart> cardList = null;
        try {
            cardList = (Vector<Cart>) em.createNamedQuery("Cart.findAll").getResultList();
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cardList;
    }

    public static Cart findCartById(EntityManager em, int id) {
        Cart cart = null;
        try {
            cart = em.find(Cart.class, id);
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cart;
    }

    public static List<Cart> findCartByIdCatalog(EntityManager em, Catalog idCatalog) {
        List<Cart> cart = null;
        try {
            Query query = em.createNamedQuery("Cart.findByIdCatalog");
            query.setParameter("idCatalog", idCatalog);
            cart = (List<Cart>) query.getResultList();
            if (cart.isEmpty()) {
                return null;
            }
            //em.close();

        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
        return cart;
    }

    //public static int updateEmployee(EntityManager em, 
    //        UserTransaction utx, Employee emp) {
    public static int updateCart(EntityManager em, Cart cart) {
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, cart.getId());
            if (target == null) {
                return 0;
            }
            target.setQuantity(cart.getQuantity());
            em.persist(target);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);

        }
        return 1;

    }

    public static int removeCart(EntityManager em, int id) {
        try {
            em.getTransaction().begin();
            Cart target = em.find(Cart.class, id);
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

    public static int insertCart(EntityManager em, Cart cart) {
        try {
            em.getTransaction().begin();
            em.persist(cart);
            em.getTransaction().commit();
        } catch (Exception e) {
            //Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);

        }
        return 1;
    }
}
