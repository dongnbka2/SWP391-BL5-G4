package controller.product.Admin;

import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeProductStatusServlet", value = "/change-product-status")
public class ChangeProductStatusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        String status = request.getParameter("status");                    
        
        ProductDAO.updateProductStatus(Integer.parseInt(productID), Boolean.parseBoolean(status));

        PrintWriter out =  response.getWriter();
        out.println("<h1>Change successful!!!<h1>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

// test
// http://localhost:9999/change-product-status?productID=1&status=true
