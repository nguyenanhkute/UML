<%-- 
    Document   : managerDetailBillPurchase
    Created on : Dec 17, 2018, 4:07:58 PM
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
        <title>chi tiết đơn nhập hàng</title>
    </head>
    <body>
        <form name="myForm" action="/shop/AdminBillPurChaseServlet" method="post">
        <%
            String maDNH= request.getParameter("maDNH");
            String maNCC= request.getParameter("maNCC");
            BillPurchaseDAO purchaseDAO= new BillPurchaseDAO();
            ArrayList<BillPurchase> ListDetailPurchase= purchaseDAO.gettDetailBillPurchase(maDNH);
        %>
        
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
           <div id="rightContent">
               
            <h2>Quản lí hóa đơn nhập hàng</h2>
                
            <a href="/shop/admin/detailBillPurchase.jsp?maNCC=<%=maNCC%>&maDNH=<%=maDNH%> " class="button" > Thêm đơn nhập </a>
            
		<table class="data">
			<tr class="data">
				<th class="data" width="30px">STT</th>
				<th class="data">Mã đơn nhập hàng</th>
				<th class="data">Mã sản phẩm</th>
                                <th class="data">số lượng</th>
			</tr>
                        <%
                            int count =0;// gan STT ban dau
                            for (BillPurchase bill :ListDetailPurchase){
                                count ++;// tang stt
                        %>
                            <tr class="data">
				<td class="data" width="30px"><%=count%></td>
				<td class="data"><%=bill.getBillID()%></td>
                                <td class="data"><%=bill.getProductID()%></td>
				<td class="data"><%=bill.getProductCount()%></td>
				
                        <%}%>
		</table>
            </div>
            <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        </form>
    </body>
</html>
