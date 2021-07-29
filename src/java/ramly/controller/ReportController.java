package ramly.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ramly.dao.OrderDAO;

public class ReportController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String VIEW_REPORT = "Report.jsp";
    private OrderDAO daoOrder;  
    String forward = null;
        
    public ReportController() {
        super();
        daoOrder = new OrderDAO();
    }    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("viewReport")) {	
            int month = Integer.parseInt(request.getParameter("month"));
            String[] monthName = {"","January","February","March","April","May","June","July","August","September","October","November","December"}; 
            
            for(int i=1; i <= 12; i++) {
                if(month == i) {
                    request.setAttribute("monthName", monthName[i] );
                }
            }           
            forward = VIEW_REPORT;       		
            request.setAttribute("order", daoOrder.getSales(month) );  
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
