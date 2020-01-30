<%-- 
    Document   : Category
    Created on : Dec 3, 2018, 12:44:54 PM
    Author     : N
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <title>quan li loai san pham </title>
    </head>
    <body>
        <%
            CategoryDAO categoryDAO= new CategoryDAO();
            ArrayList<Category> ListCategory= categoryDAO.getListCategory();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
           <div id="rightContent">
               
            <h2>Quản lí loại sản phẩm</h2>
                
            <a href="/shop/admin/insert_category.jsp"  class="button" > Thêm loại sản phẩm </a>
            
		<table class="data">
			<tr class="data">
				<th class="data" width="30px">STT</th>
				<th class="data">Mã loại SP</th>
				<th class="data">Loại sản phẩm</th>
                                <th class="data">Danh mục</th>
                                <th class="data">Tùy chọn</th>
			</tr>
                        <%
                            int count =0;// gan STT ban dau
                            for (Category category :ListCategory){
                                count ++;// tang stt
                            %>
                            <tr class="data">
				<td class="data" width="30px"><%=count%></td>
				<td class="data"><%=category.getCategoryID()%></td>
                                <td class="data"><%=category.getCategoryName()%></td>
				<td class="data"><%=category.getTypeName()%></td>
				<td class="data" width="75px">
				<center>
				<a href="/shop/admin/update_category.jsp?command=update&CategoryID=<%=category.getCategoryID()%>">Sửa</a>
				</center>
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
