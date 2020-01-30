package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Product;
import java.util.ArrayList;
import DAO.ProductDAO;

public final class Product_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        ");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${root}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/css/mos-style.css\" rel='stylesheet' type='text/css' />\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\t\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <title>Product</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            ProductDAO product= new ProductDAO();
            int pages = 1, firstResult =0,  total = 0;
            if(request.getParameter("pages") != null)
            {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            total = product.countProduct();
            if(total <= 20)
            {
                firstResult = 0;
            }
            else
            {
                firstResult = (pages - 1) * 20;         
            } 
            ArrayList<Product> listProduct = product.getListProductPT(firstResult);
        
      out.write("\n");
      out.write("        \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\n");
      out.write("           <div id=\"rightContent\">\n");
      out.write("               \n");
      out.write("            <h2  >Quản lí sản phẩm</h2>\n");
      out.write("            <a href=\"/shop/admin/insert_product.jsp\"  class=\"button\" > Thêm sản phẩm </a>\n");
      out.write("            <p  class=\"wel\">\n");
      out.write("            <form  action=\"/shop/SearchProductAdmin\" method = \"POST\">\n");
      out.write("                <input type=\"text\" id=\"searchID\" name=\"search\" class=\"textbox\" value=\"Tìm kiếm\" onfocus=\"this.value = '';\" onblur=\"if (this.value == '') {this.value = 'Tìm kiếm';}\">\n");
      out.write("                <div id=\"response\"> </div>\n");
      out.write("            </form>\n");
      out.write("\t\t<table class=\"data\">\n");
      out.write("\t\t\t<tr class=\"data\">\n");
      out.write("\t\t\t\t<th class=\"data\" width=\"30px\">STT</th>\n");
      out.write("\t\t\t\t<th class=\"data\">Mã SP</th>\n");
      out.write("\t\t\t\t<th class=\"data\">Tên sản phẩm</th>\n");
      out.write("                                <th class=\"data\">Loại sản phẩm</th>\n");
      out.write("                                <th class=\"data\">Nhà cung cấp</th>\n");
      out.write("                                <th class=\"data\">Giá</th>\n");
      out.write("                                <th class=\"data\">Mô tả</th>\n");
      out.write("                                <th class=\"data\">Tình trạng</th>\n");
      out.write("                                <th class=\"data\">Tùy chọn</th>\n");
      out.write("\t\t\t</tr>\n");
      out.write("                        ");

                            int count =0;// gan STT ban dau
                            for (Product prd : listProduct ){
                                count ++;// tang stt
                        
      out.write("\n");
      out.write("\t\t\t<tr class=\"data\">\n");
      out.write("\t\t\t\t<td class=\"data\" width=\"30px\">");
      out.print(count);
      out.write("</td>\n");
      out.write("\t\t\t\t<td class=\"data\">");
      out.print(prd.getProductID());
      out.write("</td>\n");
      out.write("                                <td class=\"data\">");
      out.print(prd.getProductName());
      out.write("</td>\n");
      out.write("                                <td class=\"data\">");
      out.print(prd.getProductCategoryName());
      out.write("</td>\n");
      out.write("                                <td class=\"data\">");
      out.print(prd.getProductSupplierName());
      out.write("</td>\n");
      out.write("                                <td class=\"data\">");
      out.print(prd.getProductPrice());
      out.write("</td>\n");
      out.write("                                <td class=\"data\" width=\"75px\">");
      out.print(prd.getProductDecription());
      out.write("</td>\n");
      out.write("                                <td class=\"data\" width=\"35px\">");
      out.print(prd.getProductStatus());
      out.write("</td>\n");
      out.write("                                \n");
      out.write("\t\t\t\t<td class=\"data\" width=\"40px\">\n");
      out.write("\t\t\t\t<a href=\"/shop/admin/update_product.jsp?command=update&ProductID=");
      out.print(prd.getProductID());
      out.write("\">Sửa</a>\n");
      out.write("\t\t\t\t</td>\n");
      out.write("                        </tr>\n");
      out.write("                       \n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                        <ul class=\"start\" >    \n");
      out.write("                        ");
                //Button Previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;//Luon la page 1
                            } else {
                                back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                            }
                        
      out.write("\n");
      out.write("                        <li ><a href=\"/shop/admin/Product.jsp?pages=");
      out.print(back);
      out.write("\"><i></i></a></li>\n");
      out.write("                        ");

                            //Button Number pages
                            int loop = 0, num = 0;
                            if ((total / 20) % 2 == 0) {
                                num = total / 4;
                            } else {
                                num = (total + 1) / 20;
                            }
                            //Nếu total lẻ thêm 1
                            if (total % 2 != 0) {
                                loop = (total / 20) + 1;

                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                                if (total < (num * 20) + 20 && total != num * 20) {
                                    loop = (total / 20) + 1;
                                } else {
                                    //Nếu bằng fullPage thì không thêm
                                    loop = (total / 20);
                                }
                            }
                            //Lap so pages
                        for (int i = 1; i <= loop; i++) {
      out.write("\n");
      out.write("                        ");
 if (pages == i) {
      out.write(" \n");
      out.write("\n");
      out.write("                        <li><span><a href=\"/shop/admin/Product.jsp?pages=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a></span></li>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <li class=\"arrow\"><a href=\"/shop/admin/Product.jsp?pages=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a> </li>\n");
      out.write("\n");
      out.write("                        ");
}
                             }
      out.write("\n");
      out.write("                        ");

                                        //Button Next
                            int next = 0;
                            //Nếu total lẻ
                            if (total % 2 != 0) {
                                if (pages == (total / 20) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage
                                //Và không fullPage thì thêm 1
                                if (total < (num * 20) + 20 && total != num * 20) {
                                    if (pages == (total / 20) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu fullPage đến trang cuối dừng
                                    //Chưa tới trang cuối thì được next
                                    if (pages == (total / 20)) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                }
                            }
                        
      out.write("\n");
      out.write("                        <li ><a href=\"product.jsp?pages=");
      out.print(next);
      out.write("\"><i class=\"next\"></i></a></li>\n");
      out.write("                    </ul>\n");
      out.write("\t\t\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clear\"></div>\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("root");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }
}
