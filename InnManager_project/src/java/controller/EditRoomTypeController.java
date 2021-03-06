/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.base.BaseController;
import dal.RoomTypeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RoomType;
import validator.InputValidation;

/**
 *
 * @author firem
 */
public class EditRoomTypeController extends BaseController {

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
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        RoomTypeDBContext roomTypeSql = new RoomTypeDBContext();
        RoomType roomType = roomTypeSql.getRoomTypeById(id);
        
        request.setAttribute("roomType", roomType);
        request.getRequestDispatcher("../../view/editRoomType.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String priceString = request.getParameter("price");
        String areaString = request.getParameter("area");
        String quantityString = request.getParameter("quantity");
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        
        int successful = 0;
        RoomTypeDBContext roomTypeSql = new RoomTypeDBContext();
        RoomType roomType = roomTypeSql.getRoomTypeById(id);
        
        if(!roomType.getName().equals(name) && roomTypeSql.getRoomTypeByName(name)){
            String errorName = "T??n ki???u ph??ng ???? t???n t???i";
            request.setAttribute("errorName", errorName);
        }else if(!InputValidation.isDouble(priceString)){
            String errorPrice = "Gi?? tr??? kh??ng ph???i l?? s???";
            request.setAttribute("errorPrice", errorPrice);
        }else if(!InputValidation.isDouble(areaString)){
            String errorArea = "Gi?? tr??? kh??ng ph???i l?? s???";
            request.setAttribute("errorArea", errorArea);
        }else if(!InputValidation.isInteger(quantityString)){
            String errorQuantity = "Gi?? tr??? kh??ng ph???i l?? s???";
            request.setAttribute("errorQuantity", errorQuantity);
        }else if(!roomTypeSql.checkQuantityCustomer(id, Integer.parseInt(quantityString))){
            String errorQuantityCustomer = "C?? ph??ng ??ang ch???a s??? l?????ng nhi???u h??n";
            request.setAttribute("errorQuantityCustomer", errorQuantityCustomer);
        }
        else{
            double price = Double.parseDouble(priceString);
            double area = Double.parseDouble(areaString);
            int quantity = Integer.parseInt(quantityString);
            RoomType rt = new RoomType();
            rt.setId(id);
            rt.setName(name);
            rt.setQuantity(quantity);
            rt.setArea(area);
            rt.setPrice(price);
            roomTypeSql.updateRoomType(rt);
            successful = 1;
        }
        
        roomType = roomTypeSql.getRoomTypeById(id);
        request.setAttribute("roomType", roomType);
        request.setAttribute("successful", successful);
        request.getRequestDispatcher("../../view/editRoomType.jsp").forward(request, response);
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
