package controller.product;

import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Product;

@WebServlet(name = "ViewProductServlet", value = "/view-product")
public class ViewProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Pagination
        ArrayList<Product> list = ProductDAO.getListProduct();
        int page, numPerPage = 16, size = list.size();
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int begin = numPerPage * (page - 1);
        int end = Math.min(numPerPage * page, size);
<<<<<<< HEAD
        
        
//        request.setAttribute("list", ProductDAO.getListByPage(list, begin, end));                
//        request.setAttribute("size", size%numPerPage==0?size/numPerPage:(size/numPerPage)+1);
//        request.setAttribute("page", page);
        request.getRequestDispatcher("AdminPage/test.jsp").forward(request, response);
=======

        request.setAttribute("list", ProductDAO.getListByPage(list, begin, end));
        request.setAttribute("size", size % numPerPage == 0 ? size / numPerPage : (size / numPerPage) + 1);
        request.setAttribute("page", page);
//        request.getRequestDispatcher("newjsp.jsp").forward(request, response);
>>>>>>> main
//        response.sendRedirect("AdminPage/JSP/admin.jsp");
        forward(request, response, "AdminPage/JSP/admin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(path);
        rd.forward(request, response);
    }
}

// test
// 
