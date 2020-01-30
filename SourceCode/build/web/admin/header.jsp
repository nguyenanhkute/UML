<%-- 
    Document   : header
    Created on : Nov 23, 2018, 12:03:45 AM
    Author     : N
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>
        <div id="header">
            <div class="inHeader">
		<div class="mosAdmin">
		Administrator<br>
                <%
                            //UserDAO usdao = new UserDAO();
                            User user = null;
                            if (session.getAttribute("user") != null)
                            {
                                user = (User) session.getAttribute("user");
                            }

                %>
		<ul>
                           <%if (user == null) {%>
                           <li><a href="login.jsp">Đăng nhập</a></li> 
                           <%}%>
                           <%if (user != null) {%>
                           <li><a href="login.jsp">Admin</a></li> 
                           <%}%>
                </ul>
		</div>
                <div class="clear"></div>
            </div>
        </div>
        
    </body>
</html>
