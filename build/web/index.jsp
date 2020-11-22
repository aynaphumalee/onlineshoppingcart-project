<%-- 
    Document   : index
    Created on : Nov 20, 2020, 9:15:31 PM
    Author     : Ayna
--%>

<%@page import="java.util.List"%>
<%@page import="model.CatalogTable"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Catalog"%>
<%@page import="model.Catalog"%>
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
        <title>Online Shopping Cart</title>
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
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>

    <jsp:useBean id="catalog" class="model.Catalog" scope="request"/>
    <%
        List<Catalog> catalogList = CatalogTable.findAllCatalog();
        Iterator<Catalog> itr = catalogList.iterator();
    %>
    <body>
        <div class="container">
            <br><br>
            <h1 class="text-center">DVD Catalog</h1><br>
            <div class="container card-style">
                <div class="row justify-content-between">
                    <div class="col-9">    

                    </div>
                    <div class="col-3">    
                        <button style="margin-left:70px" type="button" class="btn btn-success" onclick="document.location = 'shoppingcart.jsp'"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Shopping Cart</button>
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
                            <th>AddCart</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            while (itr.hasNext()) {
                                out.println("<form name=\"AddToCart\" method=\"post\" action=\"OrderController\">");
                                catalog = itr.next();
                                out.println("<tr>");
                                out.println("<td hidden><input type=\"number\" name=\"idCatalog\" value=" + catalog.getId() + "></input></td>");
                                out.println("<td> " + catalog.getName() + "</td>");
                                out.println("<td> " + catalog.getRate() + "</td>");
                                out.println("<td> " + catalog.getYears() + "</td>");
                                out.println("<td> " + catalog.getPrice() + "</td>");
                                out.println("<td><input class=\"form-control\" type=\"number\" name=\"quantity\" placeholder=\"Enter Quantity\" id=\"textsend\" onkeyup=\"success()\"></input></td>");
                                out.println("<td><button class=\"btn btn-secondary\" type=\"submit\" name=\"addtocart\" id=\"button\" disabled><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i>AddToCart</button></td>");
                                out.println("</tr>");
                                out.println("</form>");
                            }
                        %>
                    <tbody>
                </table>

            </div>
            <hr>
            <!--            <div class="text-center">
                            <button type="button" class="btn btn-primary" onclick="document.location = 'shoppingcart.jsp'" style="text-decoration:underline;"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Shopping Cart</button>
                        </div>-->

        </div>
    </body>

    <script type="text/javascript">
        function success() {
            if (document.getElementById("textsend").value === "") {
                document.getElementById('button').disabled = true;
            } else {
                document.getElementById('button').disabled = false;
            }
        }
    </script>
</html>
