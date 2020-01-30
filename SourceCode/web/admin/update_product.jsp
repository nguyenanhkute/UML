<%-- 
    Document   : update_product
    Created on : Dec 10, 2018, 3:05:22 PM
    Author     : N
--%>

<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật loại sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script>
            function validateForm(){
                var nameProduct= document.myForm.productName.value;
                var priceProduct= document.myForm.productPrice.value;
                var describeProduct= document.myForm.productDescribe.value;
                var statusProduct= document.myForm.productStatus.value;
                
                if (nameProduct==""||priceProduct==""||describeProduct==""||statusProduct=="")
                {
                    alert("Bạn chưa nhập đủ thông tin");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
       
            <%--bắt lỗi khi nhập tên loại sp--%>
        <%
            String error="";
            if(request.getParameter("error")!=null)
            {
                error=(String)request.getParameter("error");
            }
        %>
        <%--header--%>
        <jsp:include page="header.jsp"></jsp:include>
        
        <%--main --%>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h3>Thông tin loại sản phẩm </h3>
                <form name="myForm" action="/shop/AdminProductServlet" method="post">
                    <table width="95%">
                        <%
                        ProductDAO product= new ProductDAO();
                        Product ListProduct= product.getProduct(request.getParameter("ProductID"));
                        %>
                        
                        
                                <input type="hidden" name="productID" value="<%=request.getParameter("ProductID")%>">
                            <tr>
                                <td width="125px"><b>Tên sản phẩm</b></td>
                                <td><input type="text" name="productName" value="<%=ListProduct.getProductName().toString()%>"><%=error%></td>
                            </tr>
                            <tr>
                                <td width="125px"><b>Giá</b></td>
                                <td><input type="text" name="productPrice" value="<%=ListProduct.getProductPrice()%>"><%=error%></td>
                            </tr>
                            <tr>
                                <td width="125px"><b>Mô tả </b></td>    
                                <td><input type="text" name="productDescribe" value="<%=ListProduct.getProductDecription()%>"><%=error%></td>
                            </tr>
                            <tr>
                                <td width="125px"><b>Trạng thái</b></td>  
                                <td><input type="text" name="productStatus" value="<%=ListProduct.getProductStatus()%>"><%=error%></td>
                            </tr>
                            <tr><td>
                                <input type="hidden" name="command" value="update">
                                <input type="submit" class="button" value="Lưu dữ liệu" onclick="validateForm()">
                                </td></tr>
                         
                    </table>
                            </form>
            </div> 
            <div class ="clear"></div>
        </div>
            <%--footer--%>
        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
