<%-- 
    Document   : header
    Created on : Oct 2, 2018, 6:08:15 PM
    Author     : Nguyen
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.CustomerDAO"%>
<%@page import="model.User"%>
<%@page import="DAO.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/jsp; charset=UTF-8">
        <title>header</title>
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
        

        <script>$('#searchID').keypress(function(event) {
         var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
              alert('Bạn vừa nhấn phím "enter" trên trang web');
            }
        });
        </script>
    </head>
    <body>
        
       
        
        
        <div class="wrap-box"></div>
            <div class="header_bottom">
                    <div class="container">
                        <div class="col-xs-8 header-bottom-left">
                                <div class="col-xs-2 logo">
                                    <h1><a href="index.jsp"><span>Tet's </span>shop</a></h1>
                                </div>
                                <div class="col-xs-6 menu">
                                    <ul class="megamenu skyblue">
                                        
                                            <li class="grid"><a class="color1" >Trang trí</a><div class="megapanel">
                                                        <div class="row">
                                                                <div class="coll">
                                                                        <div class="h_nav">
                                                                            <ul>
                                                                                <%
                                                                                    CategoryDAO categoryDAO = new CategoryDAO();
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00004")) ) {
                                                                                %>
                                                                                        <li><a href="product.jsp?category=<%=c.getCategoryID()%>&pages=1"> <%=c.getCategoryName()%></a></li>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                            </ul>
                                                                        </div>	
                                                                </div>
                                                        </div>
                                                  </div>
                                             </li>
                                            <li class="grid"><a class="color2" >Bánh kẹo</a><div class="megapanel">                             
                                                        <div class="row">
                                                                <div class="col1">
                                                                        <div class="h_nav">
                                                                                <ul>
                                                                                <%
                                                                                   
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00001")) ) {
                                                                                %>
                                                                                        <li><a href="product.jsp?category=<%=c.getCategoryID()%>&pages=1"> <%=c.getCategoryName()%></a></li>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                                        
                                                                                </ul>	
                                                                        </div>							
                                                                </div>
                                                                
                                                          </div>
                                                        </div>
                                             </li>
                                            <li class="grid"><a class="color3" >Mức</a><div class="megapanel">                             
                                                        <div class="row">
                                                                <div class="col1">
                                                                        <div class="h_nav">
                                                                                <ul>
                                                                                <%
                                                                                    
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00003")) ) {
                                                                                %>
                                                                                        <li><a href="product.jsp?category=<%=c.getCategoryID()%>&pages=1"> <%=c.getCategoryName()%></a></li>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                                        
                                                                                </ul>	
                                                                        </div>							
                                                                </div>
                                                                
                                                          </div>
                                                        </div>
                                             </li>
                                            <li class="grid"><a class="color4">Hoa tết</a><div class="megapanel">                             
                                                        <div class="row">
                                                                <div class="col1">
                                                                        <div class="h_nav">
                                                                                <ul>
                                                                                <%
                                                                                    
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00002")) ) {
                                                                                %>
                                                                                        <li><a href="product.jsp?category=<%=c.getCategoryID()%>&pages=1"> <%=c.getCategoryName()%></a></li>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                                </ul>	
                                                                        </div>							
                                                                </div>
                                                                
                                                          </div>
                                                        </div>
                                             </li>
                                           			
                                           
                                            <li><a class="color6" href="contact.jsp">Hỗ trợ</a></li>
                                    </ul>
                                    </div>
                              </div>
                        
                    
                   
                    <div class="col-xs-4 header-bottom-right">
                        <%
                            //UserDAO usdao = new UserDAO();
                            User user = null;
                            if (session.getAttribute("user") != null)
                            {
                                user = (User) session.getAttribute("user");
                            }

                        %>
                        <div class="cssmenu">
			<ul>
                           <%if (user == null) {%>
                           <li><a href="login.jsp">Đăng nhập</a></li> 
                           <%}%>
                           <%if (user != null) {%>
                           <li><a href="login.jsp"><%=new UserDAO().getCustomerNameByID(user.getCustomerID())%></a></li> 
                           <%}%>
			</ul>
                        </div>
                        
                        <div class="box_1-cart">
                            <%
                                Cart cart = null;
                            if (session.getAttribute("cart") != null)
                            {
                                cart = (Cart) session.getAttribute("cart");
                            }
                            %>
                             <div class="box_11"><a href="checkout.jsp">
                                     <%if ( cart != null ) {%>
                                     <h4><p>Giỏ hàng (<span><%=cart.countItem()%></span>)</p>
                                     <% }%>
                                  <img src="images/bag.png" alt=""/>
                                  <div class="clearfix"> </div>
                              </h4>
                              </a></div>
                          <div class="clearfix"> </div>
                        </div>
                        <div class="search">	 
                            
                            <form  action="SearchServlet" method = "POST">
                                <input type="text" id="searchID" name="search" class="textbox" value="Tìm kiếm" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Tìm kiếm';}"  >

                                <div id="response"> </div>
                            </form>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                <div class="clearfix"></div>
            </div>
        </div>
    
    </body>
</html>
