<%-- 
    Document   : confirmBill
    Created on : Dec 5, 2018, 1:06:25 PM
    Author     : Nguyen
--%>

<%@page import="model.User"%>
<%@page import="model.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>confirm</title>
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!--slider-script-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider1").responsiveSlides({
                    auto: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--//slider-script-->
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>
    <body>
        <%
            String email ="";
            email = request.getParameter("email");
            
            User user = null;
            if (session.getAttribute("user") != null)
            {
                user = (User) session.getAttribute("user");
            }
            
            Cart cart = (Cart) session.getAttribute("cart");
            
        %>
         <jsp:include page = "header.jsp"></jsp:include>
         
         
     <div class="container">
	<div class="check">	 
		<div class="col-md-6 cart-items">
			 <h1>Chi tiết đơn hàng </h1>
			<%
                            for(Map.Entry<String,Item> list : cart.getCartItem().entrySet()){
                            
                        %>
			 <div class="cart-header">
				 
				 <div class="cart-sec simpleCart_shelfItem">
				
					
					    <div class="cart-item-info">
						<h3><a href="#"></a><span><%=list.getValue().getProduct().getProductName()%></span></h3>
						<ul class="qty">
							<li><p>Giá : <%=list.getValue().getProduct().getProductPrice()%><p></li>
                                                        <li><p>Số lượng : <%=list.getValue().getQuantity()%><p></li>
						</ul>
					    </div>
					   <div class="clearfix"></div>
                                </div>						
                        </div>
		
                        <%
                            }
                        %>
		  </div>	
		 <div class="col-md-3 cart-total">
                     <form  action="ConfirmBillServlet" method = "POST"> 
			 <div class="price-details">
				 <h3>Chi tiết hóa đơn</h3>
				 <span>Tổng tiền</span>
				 <span class="total1"><%=cart.totalPriceCart()%></span>
				 <span>Giảm giá</span>
				 <span class="total1">---</span>
				 <span>Phí vận chuyển</span>
				 <span class="total1"><%=20000 %></span>
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4>Thành tiền</h4></li>	
                           <li class="last_price"><span><%=cart.totalPriceCart() +20000 %></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			
			 <div class="clearfix"></div>
                         <input type="hidden" value="<%=email%>" name ="email">
                         <input  type="submit" value ="Xác nhận đặt hàng">
			 <div class="total-item"></div>
                     </form>    
                </div>
                
	 </div>
    </div>       
                 
                 
         <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
