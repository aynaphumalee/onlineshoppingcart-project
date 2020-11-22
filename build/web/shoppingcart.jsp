<%-- 
    Document   : shppingcart
    Created on : Nov 20, 2020, 10:22:00 PM
    Author     : Ayna
--%>

<%@page import="java.util.List"%>
<%@page import="model.CartTable"%>
<%@page import="model.Cart"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Shopping Cart</title>
    </head>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #eef0f4;
        }
        h1 {
            font-weight: 700;
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
        <div class="container">
            <br><br><h1 class="text-center">Shopping Cart</h1><br>
            <div class="container card-style">
                <div class="row justify-content-end">
                    <div class="col-3">    
                        <button style="margin-left:67px; width: 210px" type="button" class="btn btn-primary" onclick="window.location.href = '/OnlineShoppingCart/index'" style="text-decoration:underline;"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back to Catalog</button>
                    </div>
                    <div class="col-2">    
                        <button style="margin-left:10px; width: 135px" type="button" class="btn btn-success" onclick="window.location.href = '/OnlineShoppingCart/CheckoutController'"style="text-decoration:underline;"><i class="fa fa-tag" aria-hidden="true"></i>Check out</button>
                    </div>
                </div><br>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>DVD Names</th>
                            <th>Rate</th>
                            <th>Year</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (itr.hasNext()) {
                                out.println("<form name=\"RemovefromCart\" method=\"post\" action=\"RemoveController\">");
                                cart = itr.next();
                                out.println("<tr>");
                                out.println("<td hidden><input type=\"number\" name=\"id\" value=" + cart.getId() + "></input></td>");
                                out.println("<td> " + cart.getIdCatalog().getName() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getRate() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getYears() + "</td>");
                                out.println("<td> " + cart.getIdCatalog().getPrice() + "</td>");
                                out.println("<td> " + cart.getQuantity() + "</td>");
                                out.println("<td><button class=\"btn btn-danger\" type=\"submit\" name=\"remove\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i>Remove</button></td>");
                                out.println("</tr>");
                                out.println("</form>");
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <hr>
            <!--                <div class="text-center">
                                <button type="button" class="btn btn-primary" onclick="window.location.href = '/OnlineShoppingCart/index'" style="text-decoration:underline;"><i class="fa fa-arrow-left" aria-hidden="true"></i>Back to Catalog</button>
                                <button type="button" class="btn btn-success" onclick="window.location.href = '/OnlineShoppingCart/CheckoutController'"style="text-decoration:underline;"><i class="fa fa-tag" aria-hidden="true"></i>Check out</button>
                            </div>-->
        </div>
    </body>
</html>
