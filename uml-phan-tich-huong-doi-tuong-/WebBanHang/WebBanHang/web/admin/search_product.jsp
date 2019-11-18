<%-- 
    Document   : search_product
    Created on : Jan 6, 2019, 10:08:56 AM
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
        
        <title>tim kiem</title>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            String name = "";
            if(request.getParameter("name") != null)
            {
                name = request.getParameter("name");
            }
            
            String searchName = (String) session.getAttribute("searchName"); 
            int total = productDAO.countProductByCategory(name);
           
            ArrayList<Product> listProduct = productDAO.SearchProductByNameAdmin(searchName);//search
            %>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
         <jsp:include page="menu.jsp"></jsp:include>
           <div id="rightContent">
            <h3 class="m_1">Kết quả tìm kiếm của: <%=searchName%></h3>
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
                            for (Product prd : listProduct ){
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
            <div class="clearfix"></div> 
            
        <jsp:include page="footer.jsp"></jsp:include>    
        </div>
    </body>
</html>
