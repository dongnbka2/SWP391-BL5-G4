/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Order.Admin;

import dal.CustomerDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author Dong
 */
public class CreateOrderServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String preSite = req.getParameter("preSite");

        ArrayList<Product> plist = ProductDAO.getAllProduct();
        int index = 0;
        while (index < plist.size() && !plist.get(index).isStatus()) {
            index++;
        }
        DecimalFormat df = new DecimalFormat("#,###.##");
        df.setMaximumFractionDigits(8);
        req.setAttribute("df", df);
        req.setAttribute("productList", plist);
        req.setAttribute("orderList", OrderDAO.getAllOrder());
        req.setAttribute("fprice", plist.get(index).getPrice());
        req.setAttribute("preSite", Boolean.parseBoolean(preSite));

        req.setAttribute("cusList", CustomerDAO.getListCustomer());
        req.getRequestDispatcher("AdminPage/JSP/order-add.jsp").forward(req, resp);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("ddMMyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

            String code = sdf.format(new Date()) + "CU" + CustomerDAO.getQuantityOrderFromDate(sdf2.format(new Date()));
            String name = req.getParameter("name");
            String gender = req.getParameter("gender");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phoneNumber");
            String status = "true";
            String pass = "ThiBiViSiCamOn";
            HttpSession session = req.getSession();
            User u = (User) session.getAttribute("user");

            Customer c = new Customer(
                    code,
                    name,
                    Boolean.parseBoolean(gender),
                    email,
                    phoneNumber,
                    CustomerDAO.encryptPassword(pass),
                    Boolean.parseBoolean(status),
                    new Date(),
                    u.getUser_id(),
                    new Date(),
                    u.getUser_id()
            );
            int customerID = CustomerDAO.findCustomer(c); 
            Boolean newCustomer = false;
            if (!CustomerDAO.IfEmailExist(email)) {
                CustomerDAO.addCustomer(c);
                customerID = CustomerDAO.getMaxCustomerID();
                newCustomer = true;
            }
            
            code = sdf.format(new Date()) + "OD" + (OrderDAO.getQuantityOrderFromDate(sdf2.format(new Date()))+1);
            String orderCode = code;
            String address = req.getParameter("address");
            String total = req.getParameter("total").replace(",", "");
            String state = req.getParameter("state");
            status = "true";
            String payment = req.getParameter("payment");

            Order oder = new Order(customerID, u.getUser_id(), code, address,
                    Double.parseDouble(total), Integer.parseInt(state), Boolean.parseBoolean(status),
                    new Date(), u.getUser_id(),
                    new Date(), u.getUser_id(),
                    Boolean.parseBoolean(payment));

            OrderDAO.insertOrder(oder);

            int orderID = OrderDAO.getMaxOrderID();
            String[] productIDs = req.getParameterValues("productID");
            String[] quantitys = req.getParameterValues("quantity");
            String[] unitPrices = req.getParameterValues("unitPrice");
            status = "true";

            for (int i = 0; i < unitPrices.length; i++) {
                code = sdf.format(new Date()) + "ODT" + OrderDetailDAO.getQuantityOrderFromDate(sdf2.format(new Date()));
                OrderDetail od = new OrderDetail(
                        orderID,
                        Integer.parseInt(productIDs[i]),
                        code,
                        Integer.parseInt(quantitys[i]),
                        Double.parseDouble(unitPrices[i].replace(",", "")),
                        Boolean.parseBoolean(status),
                        new Date(),
                        u.getUser_id(),
                        new Date(),
                        u.getUser_id()
                );

                OrderDetailDAO.insertOrderDetail(od);
            }
            

            req.setAttribute("mess", "Add order successful");
            doGet(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(CreateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
