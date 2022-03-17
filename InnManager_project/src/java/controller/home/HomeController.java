/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import controller.base.BaseController;
import dal.CustomerDBContext;
import dal.PaymentHistoryDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.PaymentHistory;
import model.Room;

/**
 *
 * @author firem
 */
public class HomeController extends BaseController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoomDBContext roomSql = new RoomDBContext();
        ArrayList<Room> listRoom = roomSql.getListRoom();
        int totalRoom = 0;
        int totalEmptyRoom = 0;
        int totalHireRoom = 0;
        for (Room room : listRoom) {
            totalRoom++;
            if(room.isStatus()){
                totalHireRoom++;
            }else{
                totalEmptyRoom++;
            }
        }
        
        CustomerDBContext customerSql = new CustomerDBContext();
        ArrayList<Customer> listCustomer = customerSql.getListCustomer();
        int totalHireCustomer = 0;
        for (Customer cs : listCustomer) {
            if(cs.isStatus()){
                totalHireCustomer++;
            }
        }
        
        PaymentHistoryDBContext paymentHistorySql = new PaymentHistoryDBContext();
        ArrayList<PaymentHistory> listPaymentHistory = paymentHistorySql.getListPaymentHistory();
        double revenue = 0;
        for (PaymentHistory ph : listPaymentHistory) {
            revenue += ph.getBill().getPrice() + ph.getPayment().getContract().getContractDetail().getPrice();
            if(!ph.getPayment().getContract().isStatus()){
                revenue += ph.getPayment().getContract().getPriceConduct();
                revenue -= ph.getPayment().getContract().getDeposit();
            }
        }
        
        long revenuePrice = (long) revenue;
        double a = totalHireRoom * 1.0/totalRoom;
        long percent = Math.round(a*100);
        long deg = Math.round((percent * 360)/100);
        
        request.setAttribute("totalRoom", totalRoom);
        request.setAttribute("totalEmptyRoom", totalEmptyRoom);
        request.setAttribute("totalHireRoom", totalHireRoom);
        request.setAttribute("totalHireCustomer", totalHireCustomer);
        request.setAttribute("revenue", revenuePrice);
        request.setAttribute("percent", percent);
        request.setAttribute("deg", deg);
        request.getRequestDispatcher("../view/home.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
