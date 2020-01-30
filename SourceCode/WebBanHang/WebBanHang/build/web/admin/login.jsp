<%-- 
    Document   : login
    Created on : Nov 23, 2018, 4:45:00 PM
    Author     : N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">ĐĂNG NHẬP</div>
            <div class="fieldLogin">
            <form  action="/shop/LoginServlet" method="POST">
                <label >Tên đăng nhập</label><br>
                <input type="text" class="login" name="username"><br>
                <label>Mật khẩu</label><br>
                <input type="password" class="login" name="password"><br>
                <input type="hidden" value="admin" name ="command">
                <input type="submit" class="button" value="Đăng nhập">
            </form>
            </div>
        </div>
        
    </body>
</html>
