package ramly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ramly.dao.AdminDAO;
import ramly.dao.CustomerDAO;
import ramly.dao.RiderDAO;
import ramly.model.Admin;
import ramly.model.Customer;
import ramly.model.Rider;

public class LoginController extends HttpServlet {

    public LoginController() {
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("loginCustomer")) { 
            try (PrintWriter out = response.getWriter()) {
                String custUsername = request.getParameter("custUsername");
                String custPassword = request.getParameter("custPassword");
                CustomerDAO db =  new CustomerDAO();
                Customer customer = db.login(custUsername, custPassword);

                if(customer != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", customer);
                    response.sendRedirect("HomepageCustomer.jsp");
                }
                else {
                    request.setAttribute("errMessage", "User not found. Please try again.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginCustomer.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }
        else if(action.equalsIgnoreCase("loginRider")) { 
            try (PrintWriter out = response.getWriter()) {
                int riderID = Integer.parseInt(request.getParameter("riderID"));
                String riderPassword = request.getParameter("riderPassword");
                RiderDAO db =  new RiderDAO();
                Rider rider = db.login(riderID, riderPassword);

                if(rider != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", rider);
                    response.sendRedirect("HomepageRider.jsp");
                }
                else {
                    request.setAttribute("errMessage", "User not found. Please try again.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginRider.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }
        else if(action.equalsIgnoreCase("loginAdmin")) { 
            try (PrintWriter out = response.getWriter()) {
                int adminID = Integer.parseInt(request.getParameter("adminID"));
                String adminPassword = request.getParameter("adminPassword");
                AdminDAO db =  new AdminDAO();
                Admin admin = db.login(adminID, adminPassword);

                if(admin != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", admin);
                    response.sendRedirect("HomepageAdmin.jsp");
                }
                else {
                    request.setAttribute("errMessage", "User not found. Please try again.");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginAdmin.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
        }
    }
}
