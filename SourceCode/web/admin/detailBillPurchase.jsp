<%-- 
    Document   : detailBillPurchase
    Created on : Dec 15, 2018, 2:39:17 PM
    Author     : N
--%>
<%@page import="model.BillPurchase"%>
<%@page import="DAO.BillPurchaseDAO"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Bill Purchase</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        <script>
            function validateForm(){
                if (document.myForm.tenSP.value=="--Sản phẩm--" || document.myForm.soluong.value=="")
                {
                    alert("Bạn chưa nhập đủ thông tin");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        
        
        <form name="myForm" action="/shop/AdminBillPurChaseServlet" method="post">
        <%
            BillPurchaseDAO purchaseDAO= new BillPurchaseDAO();
            String maNCC = request.getParameter("maNCC");
            String str= purchaseDAO.getSupplierlName(maNCC);
            ArrayList<BillPurchase> ListProductName= purchaseDAO.getListProductName(str);
            String maDNH=request.getParameter("maDNH");
        %>
        
        <jsp:include page="header.jsp"></jsp:include>
        <%--main --%>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="rightContent">
                <h2>ĐƠN NHẬP HÀNG</h2>
                <div class="billPurchase">
                <table width="95%">
                    <%-- chọn sản phẩm--%>
                    <tr>
                        <td width="125px"><b>Sản phẩm</b></td>
                        <td>
                            <select id="tenSP" name="tenSP">
                            <option selected >--Sản phẩm--</option>
                            <% 
                               for (BillPurchase BP_product : ListProductName){
                            %>
                            <option value="<%=BP_product.getProductName()%>"><%=BP_product.getProductName()%></option>
                            <%}%>
                            </select>
                        </td>
                    </tr>
                
                    <%-- chọn số lượng--%>
                    <tr>
                        <td width="125px"><b>Số lượng </td>
                        <td><input id="idSL" type="number" max="1000" min="1" name="soluong" ></td>
                    </tr>
                    <td>
                         <input type="hidden" name="maNCC" value="<%=maNCC%>">
                         <input type="hidden" name="maDNH" value="<%=maDNH%>">
                        <input type="hidden" name="command" value="insertdetail">
                        <input type="submit" class="button" value="Thêm sản phẩm" onclick="validateForm()">
                    </td>
                    
                  </table>  
                    
                </div>
                   
            </div> 
            <div class ="clear"></div>
            <%--footer--%>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        </form>
    
    </body>
</html>
