/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.base.BaseController;
import dal.ContractDBContext;
import dal.CustomerDBContext;
import dal.PaymentHistoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Contract;
import model.Customer;
import model.Payment;
import model.PaymentHistory;

/**
 *
 * @author firem
 */
public class ListRevenueController extends BaseController {

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
        String fromDateString = request.getParameter("fromDate");
        String toDateString = request.getParameter("toDate");
        String searchString = request.getParameter("search");
//        Date fromDate = null;
//        Date toDate = null;
        if(fromDateString == null){
            fromDateString = "";
        }
        if(toDateString == null){
            toDateString = "";
        }
        if(searchString == null){
            searchString = "";
        }
        PaymentHistoryDBContext paymentHistorySql = new PaymentHistoryDBContext();
        ArrayList<PaymentHistory> listPaymentHistory = paymentHistorySql.getListPaymentHistoryByCondition(fromDateString, toDateString, searchString);
               
        request.setAttribute("listPaymentHistory", listPaymentHistory);
        request.setAttribute("fromDate", fromDateString);
        request.setAttribute("toDate", toDateString);
        request.setAttribute("search", searchString);
        request.getRequestDispatcher("../../view/listRevenue.jsp").forward(request, response);
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
