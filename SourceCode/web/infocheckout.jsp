<%-- 
    Document   : login
    Created on : Oct 2, 2018, 7:08:35 PM
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>infocheckout</title>
        
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
              $(document).ready(function () {
                   var x_timer;
                   $("#email").keyup(function (e) {
                        clearTimeout(x_timer);
                        var user_name = $(this).val();
                        x_timer = setTimeout(function () {
                            check_username_ajax(user_name);
                        }, 1000);
                        });

                   function check_username_ajax(username) {
                        $("#user-result").html('<img src="images/ajax-loader.gif" />');
                        $.post('CheckEmailServlet', {'username': username}, function (data) {
                            $("#user-result").html(data);
                         });
                   }
               });
        </script>
       <script>
            function validateForm(){
                
                var name= document.myForm.name.value;
                var address= document.myForm.address.value;
                var sdt= document.myForm.sdt.value;
                var sex= document.myForm.sex.value;
                var birthday= document.myForm.birthday.value;
                var email= document.myForm.email.value;
             
                if (name =="")
                {
                    alert("Bạn chưa nhập tên");
                }
                else if (address=="")
                {
                    alert("Bạn chưa nhập địa chỉ");
                }
                else if(sdt=="")
                {
                    alert("Bạn chưa nhập số điện thoại");
                }
                else if(sex=="")
                {
                    alert("Bạn chưa chọn giới tính");
                }
                else if(birthday=="")
                {
                    alert("Bạn chưa nhập ngày sinh");
                }
                else if(email=="")
                {
                    alert("Bạn chưa nhập email");
                }
           
                
            }
        </script>
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
        
       
        <div class="container"> 
	    <div class="container-fluid">
			  <div class="col-md-6 login-right">
			  	<h3>Thông tin khách hàng</h3>
				<form name = "myForm" action="CustomerServlet" method = "POST">
				  <div>
					<span>Họ Tên*</span>
					<input type="text" name = "name"> 
				  </div>
				  <div>
                                      <span>Điện thoại di động*</span>
					<input type="text" name = "sdt"> 
				  </div>
                                    <div>
                                      <span>Email*</span>
					
                                        <input type="text" name = "email" id="email">
                                        <span id ="user-result"></span>
                                        
				  </div>
                                    <div>
                                      <span>Địa chỉ*</span>
					<input type="text" name = "address"> 
				  </div>
                                    <div>
                                      <span>Ngày sinh*</span>
					<input type="text" name = "birthday"> 
				  </div>
                                    <div>
                                      <span>Giới tính*</span>
					<input type="text" name = "sex"> 
				  </div>
                                  
                                <div class="col-md-5 cart-total">
                                    <div class="clearfix"></div>
                                    <input href="confirmBill.jsp" type="submit" value ="Đặt hàng" onclick="validateForm()" >
                                    <div class="order-item"></div>
                                </div>
                                     
			    </form>
			   </div>
                
               `            
			    <!--div class="col-md-6 login-left">
			  	 <h3>Tạo tài khoản</h3>
				 <p>Tạo tài khoản để theo dõi đơn hàng, lưu danh sách sản phẩm yêu thích, nhận nhiều ưu đãi hấp dẫn.</p>
				 <a class="acount-btn" href="register.html">Tạo tài khoản</a>
			   </div-->	
			   <div class="clearfix"> </div>
                </div>
		</div>
     
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
