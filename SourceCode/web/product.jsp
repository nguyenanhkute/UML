<%-- 
    Document   : decoration
    Created on : Oct 22, 2018, 9:12:14 PM
    Author     : Nguyen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="DAO.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="controller.CartServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product</title>
        
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
        <jsp:include page = "header.jsp"></jsp:include>
        <%
            ProductDAO productDAO = new ProductDAO();
            String category_id = "";
            if(request.getParameter("category") != null)
            {
                category_id = request.getParameter("category");
            }
            
            CategoryDAO c = new CategoryDAO();
            
            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart",cart);
                
            }
            
            int pages = 0, firstResult =0,  total = 0;
            if(request.getParameter("pages") != null)
            {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            
            total = productDAO.countProductByCategory(category_id);
            if(total <= 9)
            {
                firstResult = 0;
                     
            }
            else
            {
                firstResult = (pages - 1) * 9;
                     
            }
            
            ArrayList<Product> listProduct = productDAO.getListProductByNav(category_id, firstResult);
            %>
        <div class="content_top">
            <h3 class="m_1"><%=c.getNameByID(category_id)%></h3>
                <div class="container">
                    <div class="box_1">
                         <div class="col-md-10">
			    <div class="section group">
                                
                                <%
                                    for(Product p: listProduct ){
                                    %>
				<div class="col_1_of_4 span_1_of_4 simpleCart_shelfItem">
                                    <div class="shop-holder">
		                         <div class="product-img">
                                                <a href="detail.jsp?productID=<%=p.getProductID()%>"></a>
                                                <img width="225" height="225" src="images/<%=p.getProductImage()%>" class="img-responsive"  alt="item4">		                            </a>
                                                <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="button item_add"></a>		                         
                                         </div>
		                    </div>
		                    <div class="shop-content" style="height: 140px; width: 140px">
		                          
		                            <h3><a href="detail.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h3>
		                            <span class="amount item_price"><%=p.getProductPrice()%></span>
		                    </div>
                                    
                                </div> 
                                
                                <% }
                                    %>
                                <div class="clearfix"></div> 
                            </div>
                        </div>
                    <div class="clearfix"></div>
                    <ul class="start" >    
                        <%                //Button Previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;//Luon la page 1
                            } else {
                                back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                            }
                        %>
                        <li ><a href="product.jsp?category=<%=category_id%>&pages=<%=back%>"><i></i></a></li>
                        <%
                            //Button Number pages
                            int loop = 0, num = 0;
                            if ((total / 9) % 2 == 0) {
                                num = total / 4;
                            } else {
                                num = (total + 1) / 9;
                            }
                            //Nếu total lẻ thêm 1
                            if (total % 2 != 0) {
                                loop = (total / 9) + 1;

                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    loop = (total / 9) + 1;
                                } else {
                                    //Nếu bằng fullPage thì không thêm
                                    loop = (total / 9);
                                }
                            }
                            //Lap so pages
                        for (int i = 1; i <= loop; i++) {%>
                        <% if (pages == i) {%> 

                        <li><span><a href="product.jsp?category=<%=category_id%>&pages=<%=i%>"><%=i%></a></span></li>
                        <%} else {%>
                        <li class="arrow"><a href="product.jsp?category=<%=category_id%>&pages=<%=i%>"><%=i%></a> </li>

                        <%}
                             }%>
                        <%
                                        //Button Next
                            int next = 0;
                            //Nếu total lẻ
                            if (total % 2 != 0) {
                                if (pages == (total / 9) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage
                                //Và không fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    if (pages == (total / 9) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu fullPage đến trang cuối dừng
                                    //Chưa tới trang cuối thì được next
                                    if (pages == (total / 9)) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                }
                            }
                        %>
                        <li ><a href="product.jsp?category=<%=category_id%>&pages=<%=next%>"><i class="next"></i></a></li>
                    </ul>
                </div>
            </div>
          </div>
                                
        </div>
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
