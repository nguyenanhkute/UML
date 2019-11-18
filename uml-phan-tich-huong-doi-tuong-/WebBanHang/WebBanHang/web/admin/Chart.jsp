<%-- 
    Document   : Chart
    Created on : Dec 18, 2018, 10:29:28 PM
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
        <title>Chart</title>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
        //load the Google Visualization API and the chart
        google.load('visualization', '1', {'packages': ['columnchart']});

        //set callback
        google.setOnLoadCallback (createChart);

        //callback function
        function createChart() {

            //create data table object
            var dataTable = new google.visualization.DataTable();

            //define columns
            dataTable.addColumn('string','loại sản phẩm');
            dataTable.addColumn('number', 'Tổng tiền');
            <c:forEach var="item" items="${listChart}">
                //define rows of data
                dataTable.addRows(['${item.categoryName}',${item.sumcount}]);
            </c:forEach>
            //instantiate our chart object
            var chart = new google.visualization.ColumnChart (document.getElementById('chart'));

            //define options for visualization
            var options = {width: 700, height: 300, is3D: true, title: 'Biểu đồ phân tích thu nhập theo loại sản phẩm'};

            //draw our chart
            chart.draw(dataTable, options);

        }
    </script>
        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Thống kê thu nhập</h3>
                    <table class="data">
                        <div id="chart"></div>
                    </table>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>
    </body>
</html>
