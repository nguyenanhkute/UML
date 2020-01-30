<%-- 
    Document   : search
    Created on : Dec 16, 2018, 8:55:42 AM
    Author     : Nguyen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="DAO.CategoryDAO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search</title>
    </head>
    <body>
        <jsp:include page = "header.jsp"></jsp:include>
        <%
            ProductDAO productDAO = new ProductDAO();
            String name = "";
            if(request.getParameter("name") != null)
            {
                name = request.getParameter("name");
            }
            
            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart",cart);
                
            }
            
            int pages = 0,   total = 0;
            if(request.getParameter("pages") != null)
            {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            
            String searchName = (String) session.getAttribute("searchName"); 
            
            total = productDAO.countProductByCategory(name);
           
            
            ArrayList<Product> listProduct = productDAO.SearchProductByName(searchName);
            %>
        <div class="content_top">
            <h3 class="m_1">Kết quả tìm kiếm của: <%=searchName%></h3>
                <div class="container">
                    <div class="box_1">
                         <div class="col-md-10">
			    <div class="section group">
                                
                                <%
                                    for(Product p: listProduct ){
                                    %>
				<div class="col_1_of_4 span_1_of_4 simpleCart_shelfItem">
                                    <div class="shop-holder">
		                         <div class="product-img">
                                                <a href="detail.jsp?productID=<%=p.getProductID()%>"></a>
                                                <img width="225" height="225" src="images/<%=p.getProductImage()%>" class="img-responsive"  alt="item4">		                            </a>
                                                <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="button item_add"></a>		                         
                                         </div>
		                    </div>
		                    <div class="shop-content" style="height: 140px; width: 140px">
		                          
		                            <h3><a href="detail.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h3>
		                            <span class="amount item_price"><%=p.getProductPrice()%></span>
		                    </div>
                                    
                                </div> 
                                
                                <% }
                                    %>
                                <div class="clearfix"></div> 
                            </div>
                        </div>
                    <div class="clearfix"></div>
                    <ul class="start" >    
                        <%                //Button Previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;//Luon la page 1
                            } else {
                                back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                            }
                        %>
                        <li ><a href="searach.jsp?name=<%=name%>&pages=<%=back%>"><i></i></a></li>
                        <%
                            //Button Number pages
                            int loop = 0, num = 0;
                            if ((total / 9) % 2 == 0) {
                                num = total / 4;
                            } else {
                                num = (total + 1) / 9;
                            }
                            //Nếu total lẻ thêm 1
                            if (total % 2 != 0) {
                                loop = (total / 9) + 1;

                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    loop = (total / 9) + 1;
                                } else {
                                    //Nếu bằng fullPage thì không thêm
                                    loop = (total / 9);
                                }
                            }
                            //Lap so pages
                        for (int i = 1; i <= loop; i++) {%>
                        <% if (pages == i) {%> 

                        <li><span><a href="search.jsp?name=<%=name%>&pages=<%=i%>"><%=i%></a></span></li>
                        <%} else {%>
                        <li class="arrow"><a href="search.jsp?name=<%=name%>&pages=<%=i%>"><%=i%></a> </li>

                        <%}
                             }%>
                        <%
                                        //Button Next
                            int next = 0;
                            //Nếu total lẻ
                            if (total % 2 != 0) {
                                if (pages == (total / 9) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage
                                //Và không fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    if (pages == (total / 9) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu fullPage đến trang cuối dừng
                                    //Chưa tới trang cuối thì được next
                                    if (pages == (total / 9)) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                }
                            }
                        %>
                        <li ><a href="search.jsp?name=<%=name%>&pages=<%=next%>"><i class="next"></i></a></li>
                    </ul>
                </div>
            </div>
          </div>
                                
       
        <jsp:include page = "footer.jsp"></jsp:include>
    </body>
</html>
