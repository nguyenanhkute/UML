<%-- 
    Document   : register
    Created on : Oct 2, 2018, 7:40:26 PM
    Author     : Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register</title>
       <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
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
                    pager: true
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
         <%--gửi biểu mẫu khi không nhập đầy đủ thông tin--%>
        <script>
            function validateForm(){
                
                var name= document.myForm.name.value;
                var address= document.myForm.address.value;
                var sdt= document.myForm.sdt.value;
                var sex= document.myForm.sex.value;
                var birthday= document.myForm.birthday.value;
                var email= document.myForm.email.value;
                var pass= document.myForm.password.value;
                var repass= document.myForm.repass.value;
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
                else if(pass=="")
                {
                    alert("Bạn chưa nhập mật khẩu");
                }
                else if(repass=="")
                {
                    alert("Bạn chưa xác nhận mật khẩu");
                }
                
            }
        </script>
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
        <div class="container"> 
	     <div class="register">
		  	  <form name = "myForm"action="LoginServlet" method = "POST"> 
				 <div class="register-top-grid">
					<h3>Thông tin cá nhân</h3>
					 <div>
						<span>Họ tên<label>*</label></span>
                                                <input type="text" name = "name">
					 </div>
					 <div>
						<span>Địa chỉ<label>*</label></span>
						<input type="text" name = "address"> 
					 </div>
                                         <div>
						<span>Số điện thoại<label>*</label></span>
						<input type="text" name = "sdt"> 
					 </div>
					 
                                         <div>
						<span>Giới tính<label>*</label></span>
                                                <select id ="sex" name="sex">   
                                                    <option value ="Nam">Nam</option>>
                                                    <option value ="Nữ">Nữ</option>>
                                                </select>
					 </div>
                                        <div>
						<span>Ngày sinh<label>*</label></span>
						<input type="text" name = "birthday"> 
					 </div>
                                       
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Nhận các thông báo qua email</label>
					   </a>
                                </div>
				     <div class="register-bottom-grid">
						    <h3>Thông tin tài khoản</h3>
                                                        <div>
                                                            <span>Địa chỉ Email<label>*</label></span>
                                                            <input type="text" name = "email" id="email">
                                                            <span id ="user-result"></span>
                                                        </div>
							 <div>
								<span>Mật khẩu<label>*</label></span>
								<input type="password" name = "password">
							 </div>
							 <div>
								<span>Xác nhận mật khẩu <label>*</label></span>
								<input type="password" name = "repass">
							 </div>
							 <div class="clearfix"> </div>
                                                         <div class="clearfix"> </div>
                                                        <input type="hidden" value="insert" name ="command">
                                                        <input type="submit" value="Đăng ký" onclick="validateForm()">
                                                        <div class="register-but"></div>
                                    </div>
				
				
                    </form>
          </div>
               </div>
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
