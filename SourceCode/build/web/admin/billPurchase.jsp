<%-- 
    Document   : billPurchase
    Created on : Dec 18, 2018, 12:06:56 AM
    Author     : N
--%>

<%@page import="model.BillPurchase"%>
<%@page import="DAO.BillPurchaseDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Purchase</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
        <script>
            function validateForm(){
                if (document.myForm.tenNCC.value=="--Nhà cung cấp--")
                {
                    alert("Bạn chưa nhập đủ thông tin");
                    return false;
                }
                return true;
            }
        </script>
        
    </head>
    <body>
        
        <%
            BillPurchaseDAO purchaseDAO= new BillPurchaseDAO();
            ArrayList<BillPurchase> ListSupplierName= purchaseDAO.getListPurchaseName();
        %>
        
     
        
        <jsp:include page="header.jsp"></jsp:include>
        <%--main --%>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h2>ĐƠN NHẬP HÀNG</h2>
                <div class="billPurchase">
                    <form name="myForm" action="/shop/AdminBillPurChaseServlet" method="post">
                    <%-- chọn nhà cugn cấp--%>
                    
                        <tr>
                            <td width="125px"><b>Nhà cung cấp</b></td>
                            <td>
                                <select id="tenNCC" name="tenNCC">
                                <option selected >--Nhà cung cấp--</option>
                                <% 
                                   for (BillPurchase purchase : ListSupplierName){
                                %>
                                <option value="<%=purchase.getSupplierName()%>"><%=purchase.getSupplierName()%></option>
                                <%}%>

                                </select>
                            </td>
                        </tr>
                        <td>
                            <input type="hidden" name="command" value="insert">
                            <input type="submit" class="button" value="Thêm hóa đơn" onclick= "validateForm()">
                        </td>
                    </form>    
                        
                
                </div>
            </div> 
            <div class ="clear"></div>
            <%--footer--%>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
         </form>
    </body>
</html>

