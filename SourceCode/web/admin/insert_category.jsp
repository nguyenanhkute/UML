<%-- 
    Document   : insert_category
    Created on : Dec 3, 2018, 2:10:28 PM
    Author     :anh
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm loại sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
       <%--gửi biểu mẫu khi không nhập đầy đủ thông tin--%>
        <script>
            function validateForm(){
                
                var nameCategory= document.myForm.tenLSP.value;
                if (nameCategory=="" && document.myForm.tendanhmuc.value=="--Danh mục--")
                {
                    alert("Bạn chưa nhập thông tin");
                }
                else if (nameCategory=="")
                {
                    alert("Bạn chưa nhập tên loại sản phẩm");
                }
                else if(document.myForm.tendanhmuc.value=="--Danh mục--")
                {
                    alert("Bạn chưa chọn danh mục");
                }
            }
        </script>
    </head>
    
    <body>
        <form name="myForm" action="/shop/AdminCategoryServlet" method="post">
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
            CategoryDAO categoryDAO= new CategoryDAO();
            ArrayList<Category> ListCategory= categoryDAO.getListTypeName();
        %>
        <%--header--%>
        <jsp:include page="header.jsp"></jsp:include>
        <%--main --%>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h3>Thông tin loại sản phẩm </h3>
                    <table width="95%">
                        <%--điền thông tin loại sp--%>
			<tr>
                            <td width="125px"><b>Tên loại sản phẩm</b></td>
                            <td><input type="text" class="sedang" name="tenLSP"><%=error%> </td>
                        </tr>
                        <%--chọn thông tin danh mục--%>
                        <tr>
                            <td><b>Danh mục</b></td>
                            <td>
                                <select id="tendanhmuc" name="tendanhmuc">
				<option selected >--Danh mục--</option>
                                <% 
                                    for (Category category :ListCategory){
                                %>
                                <option value="<%=category.getTypeName()%>"><%=category.getTypeName()%></option>
                                <%}%>
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
                        </div> 
                </form>  
                
            <div class ="clear"></div>
            <%--footer--%>
            
            <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
