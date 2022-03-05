/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDBContext;
import dal.ConductDBContext;
import dal.ContractDBContext;
import dal.CustomerDBContext;
import dal.PaymentDBContext;
import dal.RoomDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Conduct;
import model.Contract;
import model.Customer;
import model.Payment;
import model.Room;

/**
 *
 * @author firem
 */
public class AddContractController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addContractController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addContractController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //lay thong tin tu web
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        
        //lay thong tin tu database
        RoomDBContext roomSql = new RoomDBContext();
        Room room = roomSql.getRoomById(id);
        ConductDBContext conductSql = new ConductDBContext();
        ArrayList<Conduct> listConduct = conductSql.getListConduct();
        
        request.setAttribute("room", room);
        request.setAttribute("listConduct", listConduct);
        request.getRequestDispatcher("../view/addContract.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay thong tin tu web
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String nameCustomerString = request.getParameter("nameCustomer");
        String genderCustomerString = request.getParameter("genderCustomer");
        String dobCustomerString = request.getParameter("dobCustomer");
        String phoneCustomerString = request.getParameter("phoneCustomer");
        String identityCustomerString = request.getParameter("identityCustomer");
        String addressCustomerString = request.getParameter("addressCustomer");
        String emailCustomerString = request.getParameter("emailCustomer");
        
        String idRoomString = request.getParameter("idRoom");
        String depositString = request.getParameter("deposit");
        String hireDateString = request.getParameter("hireDate");
        
        boolean gender = genderCustomerString.equals("1");
        Date dob = Date.valueOf(dobCustomerString);
        int idRoom = Integer.parseInt(idRoomString);
        double deposit = Double.parseDouble(depositString);
        Date hireDate = Date.valueOf(hireDateString);
        
        //insert thong tin
        AccountDBContext accountSql = new AccountDBContext();
        accountSql.insertAccount(username, password);
        int accountId = accountSql.getAccountInLast();
        
        Customer cs = new Customer();
        cs.setName(nameCustomerString);
        cs.setGender(gender);
        cs.setDob(dob);
        cs.setPhone(phoneCustomerString);
        cs.setIdentity(identityCustomerString);
        cs.setAddress(addressCustomerString);
        cs.setEmail(emailCustomerString);
        cs.setHireDate(hireDate);
        Account account = new Account();
        account.setId(accountId);
        account.setUsername(username);
        account.setPassword(password);
        cs.setAccount(account);
        Room room = new Room();
        room.setId(idRoom);
        cs.setRoom(room);

        CustomerDBContext customerSql = new CustomerDBContext();
        customerSql.insertCustomer(cs);
        int customerId = customerSql.getCustomerInLast();
        cs.setId(customerId);
        
        Contract contract = new Contract();
        contract.setCustomer(cs);
        contract.setRoom(room);
        contract.setDeposit(deposit);
        contract.setHireDate(hireDate);
        ContractDBContext contractSql = new ContractDBContext();
        contractSql.insertContract(contract);
        int contractId = contractSql.getContractInLast();
        contract.setId(contractId);
        
        ConductDBContext conductSql = new ConductDBContext();
        ArrayList<Conduct> listConduct = conductSql.getListConduct();
        for (Conduct cd : listConduct) {
            String numberString = request.getParameter("conduct" + cd.getId());
            int number = Integer.parseInt(numberString);
            for (int i = 0; i < number; i++) {
                conductSql.insertConductService(cd.getId(), contractId);
            }
        }
        
        Payment pm = new Payment();
        pm.setContract(contract);
        pm.setFromDate(hireDate);
        Date toDate = Date.valueOf(hireDate.toLocalDate().plusMonths(1));
        pm.setToDate(toDate);
        PaymentDBContext paymentSql = new PaymentDBContext();
        paymentSql.insertPayment(pm);
//        
        response.sendRedirect("add?id="+idRoomString);
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
