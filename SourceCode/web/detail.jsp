<%-- 
    Document   : detail
    Created on : Nov 19, 2018, 9:32:02 PM
    Author     : Nguyen
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>detail</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Buy_shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/simpleCart.min.js"> </script>
<!-- Custom Theme files -->
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<script src="js/jquery.easydropdown.js"></script>
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
			jQuery(document).ready(function($){

				$('#etalage').etalage({
					thumb_image_width: 300,
					thumb_image_height: 400,
					source_image_width: 900,
					source_image_height: 1200,
					show_hint: true,
					click_callback: function(image_anchor, instance_id){
						alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
					}
				});

			});
		</script>
<!--initiate accordion-->
<script type="text/javascript">
	$(function() {
	
	    var menu_ul = $('.menu_drop > li > ul'),
	           menu_a  = $('.menu_drop > li > a');
	    
	    menu_ul.hide();
	
	    menu_a.click(function(e) {
	        e.preventDefault();
	        if(!$(this).hasClass('active')) {
	            menu_a.removeClass('active');
	            menu_ul.filter(':visible').slideUp('normal');
	            $(this).addClass('active').next().stop(true,true).slideDown('normal');
	        } else {
	            $(this).removeClass('active');
	            $(this).next().stop(true,true).slideUp('normal');
	        }
	    });
	
	});
</script>
<script>
            function validateForm(){
                if (document.myForm.soluong.value=="")
                {
                    alert("Bạn chưa nhập số lượng");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String productID="";
            if(request.getParameter("productID")!= null)
            {
                productID = request.getParameter("productID");
                product = productDAO.getDetailProduct(String.valueOf(productID));
            }
            %>
        <jsp:include page = "header.jsp"></jsp:include>
        <div class="single_top">
	 <div class="container"> 
	      <div class="single_grid">
				<div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a href="optionallink.html">
                                                                    <img class="etalage_thumb_image" src="images/<%=product.getProductImage()%>" class="img-responsive" />
                                                                    <img class="etalage_source_image" src="images/<%=product.getProductImage()%>" class="img-responsive" title="" />
								</a>
							</li>
						</ul>
						 <div class="clearfix"></div>		
                                </div> 
                                <div class="desc1 span_3_of_2">
                                    <ul class="back">
                                         <li><i class="back_arrow"> </i> <a href="product.jsp?category=<%=product.getProductCategoryID()%>&pages=1">Tiếp tục mua hàng</a></li>
                                    </ul>
                                    <h1><%=product.getProductName()%></h1>
                                    <p><%=product.getProductDecription()%></p>
                                    <form name="myForm" action="CartServlet" method="post">   
                                    <div class="simpleCart_shelfItem">
                                        <div class="price_single">
                                            <div class="head"><h2><span class="amount item_price"><%=product.getProductPrice()%></span></h2></div>	
                                            
                                           <div class="clearfix"></div>
                                        </div>
                                        <h1>Số lượng </h1> 
                                        <p><input id="idSL" type="number" max="1000" min="1" name="soluong" ></p>
                                        
                                        <input type="hidden" name="productID" value="<%=productID%>">
                                        <input type="hidden" name="command" value="plus">
                                        <input type="submit" class="button" value="Thêm vào giỏ hàng" onclick="validateForm()">
                                    </div>
                                    </form>     
                                </div>
                                <div class="clearfix"></div>
          	</div>
          	<div class="single_social_top">   
                    <ul class="single_social">
                        <li><a href="#"> <i class="s_fb"> </i> <div class="social_desc">Share<br> on facebook</div><div class="clearfix"> </div></a></li>
                        <li><a href="#"> <i class="s_twt"> </i> <div class="social_desc">Tweet<br> this product</div><div class="clearfix"> </div></a></li>
                        <li><a href="#"> <i class="s_google"> </i><div class="social_desc">Google+<br> this product</div><div class="clearfix"> </div></a></li>
                        <li class="last"><a href="#"> <i class="s_email"> </i><div class="social_desc">Email<br> a Friend</div><div class="clearfix"> </div></a></li>
                    </ul>
		</div>
			 
   </div>
  
        
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
