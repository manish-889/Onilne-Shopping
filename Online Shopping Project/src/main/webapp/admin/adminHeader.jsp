<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email = session.getAttribute("email").toString(); %>
            <center><h2>Online shopping (Manish And Company...)</h2></center>
            <a href="addNewProduct.jsp">Add New Product <i class='fa fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class="fa fa-solid fa-list"></i></a>
            <a href="messagesReceived.jsp">Messages Received <i class="fa fa-solid fa-comment"></i></a>
            <a href="ordersReceived.jsp">Orders Received <i class="fa fa-archive"></i></a>
            <a href="cancelOrders.jsp">Cancel Orders <i class='fa fa-window-close'></i></a>
            <a href="deliveredOrders.jsp">Delivered Orders <i class="fa fa-solid fa-truck"></i></a>
            <a href="../logout.jsp">Logout <i class='fa fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
