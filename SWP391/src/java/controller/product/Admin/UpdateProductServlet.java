package controller.product.Admin;

import dal.ProductDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "UpdateProductServlet", value = "/update-product")
public class UpdateProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");
        String cateID = request.getParameter("cateID");
        String brandID = request.getParameter("brandID");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String shortdescript = request.getParameter("shortdescript");
        String description = request.getParameter("description");
        String ratingStar = request.getParameter("ratingStar");
        String price = request.getParameter("price");
        String outOfStock = request.getParameter("outOfStock");
        String status = request.getParameter("status");
        String createdAt = request.getParameter("createdAt");
        String createdBy = request.getParameter("createdBy");        
        String modifiedBy = request.getParameter("modifiedBy");

        SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Product p;
        try {
            p = new Product(Integer.parseInt(productID), Integer.parseInt(cateID), Integer.parseInt(brandID), code, name, shortdescript, description
                    , Double.parseDouble(ratingStar), Double.parseDouble(price), Boolean.parseBoolean(outOfStock)
                    , Boolean.parseBoolean(status), dtf.parse(createdAt), Integer.parseInt(createdBy)
                    , new Date(), Integer.parseInt(modifiedBy));
                    ProductDAO.updateProduct(p);    
        } catch (ParseException ex) {
            Logger.getLogger(UpdateProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        PrintWriter out =  response.getWriter();
        out.println("<h1>Update successful!!!<h1>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

// test
// http://localhost:9999/SWP_war_exploded/update-product?productID=1&cateID=2&brandID=1&code=codetest&name=nametest&shortdescript=shortdescriptiontest&description=descriptiontest&ratingStar=4.5&price=100.5&outOfStock=true&status=true&createdAt=2023-02-05%2020%3A55%3A00&createdBy=1&modifiedAt=2023-02-05%2020%3A55%3A00&modifiedBy=1