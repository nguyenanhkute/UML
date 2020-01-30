<%-- 
    Document   : managerBillPurchase
    Created on : Dec 17, 2018, 3:36:51 PM
    Author     : N
--%>

<%@page import="model.BillPurchase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.BillPurchaseDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <title>manager BillPurchase </title>
    </head>
    
    <body>
        <%
            BillPurchaseDAO categoryDAO= new BillPurchaseDAO();
            ArrayList<BillPurchase> ListBillPurchase= categoryDAO.getListBillPurchase();
        %>
        
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
           <div id="rightContent">
               
            <h2>Quản lí đơn nhập hàng</h2>
                
            <a href="/shop/admin/billPurchase.jsp"  class="button" > Thêm đơn nhập hàng </a>
            
		<table class="data">
			<tr class="data">
				<th class="data" width="30px">STT</th>
				<th class="data">Mã đơn nhập hàng</th>
				<th class="data">Mã nhà cung cấp</th>
                                <th class="data">Ngày nhập</th>
                                <th class="data">Tổng số lượng</th>
			</tr>
                        <%
                            int count =0;// gan STT ban dau
                            for (BillPurchase bill :ListBillPurchase){
                                count ++;// tang stt
                            %>
                            <tr class="data">
				<td class="data" width="30px"><%=count%></td>
				<td class="data"><%=bill.getBillID()%></td>
                                <td class="data"><%=bill.getSupplierID()%></td>
				<td class="data"><%=bill.getDate()%></td>
				<td class="data"><%=bill.getSumCount()%></td>
                        <%}%>
		</table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        
    </body>
</html>

