<%-- 
    Document   : contact
    Created on : Oct 2, 2018, 7:45:20 PM
    Author     : Nguyen
--%>

<%-- 
    Document   : contact
    Created on : Oct 2, 2018, 7:45:20 PM
    Author     : ThanhNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact</title>
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
         <div class="container"> 
	  <div class="map">
	     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.237878428348!2d106.80122311480159!3d10.869503392258425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175275861e99331%3A0x5fd999b6bce774a6!2zTmjDoCBDLCBQaMaw4budbmcgTGluaCBUcnVuZywgVGjhu6cgxJDhu6ljLCBI4buTIENow60gTWluaCwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1542072694196" > </iframe>
	   </div>
	   <div class="col-md-9 contact_left">
		 	  <h1>Liên lạc</h1>
	  			  <p> Cửa hàng bánh kẹo Tết là một cửa hàng không chỉ bán các loại bánh kẹo mà còn có bná những đồ trang trí Tết hay các loại hoa. Nếu các bạn có ý kiến góp ý cho cửa hàng thì liên hệ bằng cách để lại họ tên, email, chủ đề và nội dung để quản lí có thể biết được những đóng góp của bạn. Cảm ơn vì sự tin dùng sản phẩm của hàng chúng tôi<p>
	  			 <form>
					<div class="column_2">
                                                <input type="text" class="text"  placeholder="" value="Tên" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
					 	<input type="text" class="text"  placeholder="" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" style="margin-left:2.7%">
					 	<input type="text" class="text"  placeholder="" value="Chủ đề" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}" style="margin-left:2.7%">
					</div>
					<div class="column_3">
	                   <textarea value="Message"  placeholder="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Nội dung</textarea>
	                </div>
	                <div class="form-submit1">
			          <input type="submit" value="GỞI">
					</div>
					<div class="clearfix"> </div>
				  </form>
		 </div>
		 <div class="col-md-3 contact_right">
		 	<h2>Thông tin liên hệ</h2>
		 	<address class="address">
              <p>Cửa hàng bánh kẹo Tết <br> KP6,  P.Linh Trung, Q.Thủ Đức, Tp.HCM.</p>
              <dl>
                 <dt></dt>
                 <dd>Freephone:<span> +84 374 370 101</span></dd>           
                 <dd>FAX: <span>+81 800 658 584</span></dd>
                 <dd>E-mail:&nbsp; <a href="mailto@example.com">info(at)tetshop.com</a></dd>
              </dl>
           </address>
		 </div>
      </div>
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
