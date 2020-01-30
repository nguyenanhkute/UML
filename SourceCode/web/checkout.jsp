<%-- 
    Document   : checkout
    Created on : Oct 2, 2018, 7:52:56 PM
    Author     : Nguyen
--%>

<%@page import="model.User"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
  
        <script>
            function validateForm(){
                
                    alert("Chưa có gì trong giỏ hàng. Vui lòng chọn sản phẩm trước khi thanh toán!");
            }
        </script>
    </head>
    <body>
        <%
             User user = null;
            if (session.getAttribute("user") != null)
            {
                user = (User) session.getAttribute("user");
            }
                            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart",cart);
                
            }
            %>
        <jsp:include page = "header.jsp"></jsp:include>
        <div class="container">
	<div class="check">	 
		<div class="col-md-9 cart-items">
			 <h1>Giỏ hàng của tôi </h1>
			<%
                            for(Map.Entry<String,Item> list : cart.getCartItem().entrySet()){
                            
                        %>
			 <div class="cart-header">
				 <div class="close1"> 
                                     <a href="CartServlet?command=sub&productID=<%=list.getValue().getProduct().getProductID()%>" class="button item_sub"></a>
                                 </div>
				 <div class="cart-sec simpleCart_shelfItem">
					<div class="cart-item cyc">
                                            <img src="images/<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive" alt=""/>
					</div>
					<div class="cart-item-info">
                                            <h3><a href="CartServlet?command=sub&productID=<%list.getValue().getProduct().getProductID();%>"></a><span><%=list.getValue().getProduct().getProductName()%></span></h3>
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
			 <a class="continue" href="index.jsp">Tiếp tục mua hàng</a>
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
			   <li class="last_price"> <h4>Thành tiền</h4></li>	
                           <li class="last_price"><span><%=cart.totalPriceCart() +20000  %></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
                         <%
                                if(cart.countItem() == 0)
                                {%>
                                     <a class="order" href="checkout.jsp" onclick="validateForm()" >Tiến hành đặt hàng  </a>
                        <%
                                }
                                else
                                {
                         %>
			 
			 <div class="clearfix"></div>
                         <%
                             if(user == null) {
                              
                         %>
			 <a class="order" href="infocheckout.jsp">Tiến hành đặt hàng</a>
                         <%}else {%>
                         <a class="order" href="confirmBill.jsp">Tiến hành đặt hàng</a>
                         <%}}%>
			 <div class="total-item">
				
				 
			 </div>
                </div>
                
	 </div>
</div>
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
