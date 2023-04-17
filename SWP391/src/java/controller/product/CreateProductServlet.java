package controller.product;

import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet(name = "CreateProductServlet", value = "/create-product")
public class CreateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cateID = request.getParameter("cateID");
        String brandID = request.getParameter("brandID");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String shortdescript = request.getParameter("shortdescript");
        String description = request.getParameter("description");
        String ratingStar = request.getParameter("ratingStar");
        String price = request.getParameter("price");
        String outOfStock = request.getParameter("outOfStock");              
        String createdBy = request.getParameter("createdBy");        
        String modifiedBy = request.getParameter("modifiedBy");

//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        Product p = new Product(Integer.parseInt(cateID), Integer.parseInt(brandID), code, name, shortdescript, description
                                , Double.parseDouble(ratingStar), Double.parseDouble(price), Boolean.parseBoolean(outOfStock)
                                , true, new Date(), Integer.parseInt(createdBy)
                                , new Date(), Integer.parseInt(modifiedBy));
        ProductDAO.insertProduct(p);

        PrintWriter out =  response.getWriter();
        out.println("<h1>Insert successful!!!<h1>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

// test
// http://localhost:9999/SWP_war_exploded/create-product?cateID=1&brandID=1&code=codetest&name=nametest&shortdescript=shortdescriptiontest&description=descriptiontest&ratingStar=4.5&price=100.5&outOfStock=true&status=true&createdAt=2023-02-05%2020%3A55%3A00&createdBy=1&modifiedAt=2023-02-05%2020%3A55%3A00&modifiedBy=1
