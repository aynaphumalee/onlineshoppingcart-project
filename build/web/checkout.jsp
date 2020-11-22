<%-- 
    Document   : checkout
    Created on : Nov 21, 2020, 2:21:58 AM
    Author     : Ayna
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.CartTable"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Cart"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Checkout</title>
    </head>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #eef0f4;
        }
        h1 {
            font-weight: 700;
        }
        h2 {
            font-weight: 600;
        }
        i {
            margin-right: 10px;
        }
        .card-style {
            box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);
            background-color: #f6f8fa;
            padding: 20px; 
            border-radius: 10px;
        }
    </style>

    <jsp:useBean id="cart" class="model.Cart" scope="request"/>
    <%
        List<Cart> cartList = CartTable.findAllCart();
        Iterator<Cart> itr = cartList.iterator();
    %>

    <body>
        <div class="container"><br><br>
            <h1 class="text-center">Your Order is Confirmed!</h1>
            <h2 class="text-center">Bill Detail</h2><br>
            <div class="container card-style">
                <div class="row justify-content-between">
                    <div class="col-9">    

                    </div>
                    <div class="col-3">    
                        <button style="margin-left:60px" type="button" class="btn btn-primary" onclick="window.location.href = '/OnlineShoppingCart/index'" style="text-decoration:underline;"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back to Catalog</button>
                    </div>
                </div><br>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>DVD Names</th>
                            <th>Rate</th>
                            <th>Year</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>    
                    <tbody>
                        <%
                            int i = 1;
                            while (itr.hasNext()) {
                                cart = itr.next();
                                out.println("<tr>");
                                out.println("<td> " + (i++) + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getName() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getRate() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getYears() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getPrice() + "</td>");
                                out.println("<td> " + cart.getQuantity() + "</td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>

                <h4 class="text-center" style="margin-left:60px; margin-top: 20px"><%= "The total amount is $" + request.getAttribute("totalAmount")%></h4>
            </div>
            <hr>



        </div>
    </body>
</html>
