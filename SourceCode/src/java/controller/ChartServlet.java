/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ChartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.chart_value_sale;

/**
 *
 * @author N
 */
public class ChartServlet extends HttpServlet {
    ChartDAO CHARTdao= new ChartDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        ArrayList<chart_value_sale> a= new ArrayList<chart_value_sale>();
        a= CHARTdao.getListChart();
        request.setAttribute("listChart",a);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/Chart.jsp");
            //Di den url home.jsp
            rd.forward(request, response);
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
