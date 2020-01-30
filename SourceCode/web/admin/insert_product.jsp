<%-- 
    Document   : insert
    Created on : Nov 24, 2018, 8:35:57 PM
    Author     : N
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
        <%--gửi biểu mẫu khi không nhập đầy đủ thông tin--%>
        <script>
            function validateForm(){
                
                var tensp= document.myForm.tenSP.value;
                var tenncc= document.myForm.tenNCC.value;
                var tenlsp= document.myForm.tenLSP.value;
                var GIA= document.myForm.gia.value ;
                var MOTA= document.myForm.mota.value ;
                var TINHTRANG= document.myForm.tinhtrang.value;
                if (tensp==""||tenncc=="--Nhà cung cấp--"||tenlsp=="--LOẠI SP--"||GIA==""||MOTA==""||TINHTRANG=="")
                {
                    alert("Bạn chưa nhập đủ thông tin");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <form name="myForm" action="/shop/AdminProductServlet" method="post">
            <%--bắt lỗi khi nhập tên loại sp--%>
        <%
            String error="";
            if(request.getParameter("error")!=null)
            {
                error=(String)request.getParameter("error");
            }
        %>
        <%--danh sách loại sp --%>
        <%
            ProductDAO productDAO= new ProductDAO();
            ArrayList<Product> ListCategoryName= productDAO.getListCategoryName();
            ArrayList<Product> ListSupplierName= productDAO.getListSupplierName();
        %>
        <%--header--%>
        <jsp:include page="header.jsp"></jsp:include>
        <%--main --%>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h2>Thông tin  sản phẩm </h2>
                    <table width="95%">
                        <%--điền thông tin tên sp--%>
			<tr>
                            <td width="125px"><b>Tên sản phẩm</b></td>
                            <td><input type="text" class="sedang" name="tenSP"><%=error%> </td>
                        </tr>
                        
                        <%--chọn thông tin loai sản phẩm--%>
                        <tr>
                            <td><b>Loại sản phẩm</b></td>
                            <td>
                                <select id="tenLSP" name="tenLSP">
				<option selected >--LOẠI SP--</option>
                                <% 
                                    for (Product product : ListCategoryName){
                                %>
                                <option value="<%=product.getProductCategoryName()%>"><%=product.getProductCategoryName()%></option>
                                <%}%>
                            </select>
                            </td>
                        </tr>
                         
                         <%--chọn thông tin nhà cung cấp--%>
                        <tr>
                            <td><b>Nhà cung cấp</b></td>
                            <td>
                                <select id="tenNCC" name="tenNCC">
				<option selected >--Nhà cung cấp--</option>
                                <% 
                                    for (Product product1 : ListSupplierName){
                                %>
                                <option value="<%=product1.getProductSupplierName()%>"><%=product1.getProductSupplierName()%></option>
                                <%}%>
                            </select>
                            </td>
                        </tr>
                        <%--điền thông tin giá sp--%>
			<tr>
                            <td width="125px"><b>Giá </b></td>
                            <td><input type="text" class="sedang" name="gia"><%=error%> </td>
                        </tr>
                        
                        <%--điền mô tả thông tin sản phẩm--%>
			<tr>
                            <td width="125px"><b>Mô tả</b></td>
                            <td><input type="text" class="sedang" name="mota"><%=error%> </td>
                        </tr>
                        
                        <%--điền tình trạng thông tin sản phẩm--%>
                        <tr>
                            <td width="125px"><b>Tình trạng </b></td>
                            <td>
                                <select id="tinhtrang" name="tinhtrang">
                                    <option selected >--tình trạng--</option>
                                    <option value="còn">còn</option>
                                    <option value="hết">hết</option>
                                </select>
                            </td>
                        </tr>
                        
                        <%--button lưu giữ iệu--%>
                        <tr><td>
                            <input type="hidden" name="command" value="insert">
                            <input type="submit" class="button" value="Lưu dữ liệu" onclick="validateForm()">
                        </td></tr>
                    </table>
                 
                </div> 
            <div class ="clear"></div>
            <%--footer--%>
            <jsp:include page="footer.jsp"></jsp:include>
            
        </div>
            </form> 
    </body>
</html>
