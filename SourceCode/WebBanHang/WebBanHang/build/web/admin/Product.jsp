<%-- 
    Document   : Management-category
    Created on : Nov 23, 2018, 12:55:21 AM
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
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
        <title>Product</title>
    </head>
    <body>
        
        <%
            ProductDAO product= new ProductDAO();
            ArrayList<Product> ListProduct= product.getListProduct();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
           <div id="rightContent">
               
            <h2  >Quản lí sản phẩm</h2>
            <a href="/shop/admin/insert_product.jsp"  class="button" > Thêm sản phẩm </a>
            <p  class="wel">
            <form  action="/shop/SearchProductAdmin" method = "POST">
                <input type="text" id="searchID" name="search" class="textbox" value="Tìm kiếm" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Tìm kiếm';}">
                <div id="response"> </div>
            </form>
		<table class="data">
			<tr class="data">
				<th class="data" width="30px">STT</th>
				<th class="data">Mã SP</th>
				<th class="data">Tên sản phẩm</th>
                                <th class="data">Loại sản phẩm</th>
                                <th class="data">Nhà cung cấp</th>
                                <th class="data">Giá</th>
                                <th class="data">Mô tả</th>
                                <th class="data">Tình trạng</th>
                                <th class="data">Tùy chọn</th>
			</tr>
                        <%
                            int count =0;// gan STT ban dau
                            for (Product prd : ListProduct ){
                                count ++;// tang stt
                        %>
			<tr class="data">
				<td class="data" width="30px"><%=count%></td>
				<td class="data"><%=prd.getProductID()%></td>
                                <td class="data"><%=prd.getProductName()%></td>
                                <td class="data"><%=prd.getProductCategoryName()%></td>
                                <td class="data"><%=prd.getProductSupplierName()%></td>
                                <td class="data"><%=prd.getProductPrice()%></td>
                                <td class="data" width="75px"><%=prd.getProductDecription()%></td>
                                <td class="data" width="35px"><%=prd.getProductStatus()%></td>
                                
				<td class="data" width="40px">
				<a href="/shop/admin/update_product.jsp?command=update&ProductID=<%=prd.getProductID()%>">Sửa</a>
				</td>
                        </tr>
                        <%}%>
		</table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
            
        </div>
    </body>
</html>

