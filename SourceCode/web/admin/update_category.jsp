<%-- 
    Document   : update_category
    Created on : Dec 10, 2018, 4:17:18 AM
    Author     : N
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
        <title>Cập nhật loại sản phẩm</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
        <%--gửi biểu mẫu khi không nhập đầy đủ thông tin--%>
        <script>
            function validateForm(){
                var nameCategory= document.myForm.tenLSP.value;
                if (nameCategory=="")
                {
                    alert("Bạn chưa nhập tên loại sản phẩm");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <form name="myForm" action="/shop/AdminCategoryServlet" method="POST">
            <%--bắt lỗi khi nhập tên loại sp--%>
        <%
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            
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
                    <table width="95%">
                        <%--điền thông tin loại sp--%>
			<tr>
                            <td width="125px"><b>Tên loại sản phẩm</b></td>
                            <td><input type="text" class="sedang"  name="tenLSP"><%=error%></td>
                        </tr>
                        <%--button lưu giữ liệu--%>
                        <tr><td>
                            <input type="hidden" name="command" value="update">
                            <input type="hidden" name="CategoryID" value="<%=request.getParameter("CategoryID")%>">
                            <input type="submit" class="button" value="Lưu dữ liệu" onclick="validateForm()">
                        </td></tr>
                    </table>
            </div> 
            <div class ="clear"></div>
        </div>
        
            <%--footer--%>
        <jsp:include page="footer.jsp"></jsp:include>
        </form>
    </body>
</html>
