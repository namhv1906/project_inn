/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PaymentHistory;

/**
 *
 * @author firem
 */
public class PaymentHistoryDBContext extends DBContext{
    public void insertPaymentHistory(PaymentHistory ph){
        String sql = "INSERT INTO [dbo].[PaymentHistory]\n" +
                    "           ([PaymentId]\n" +
                    "           ,[BillId]\n" +
                    "           ,[FromDate]\n" +
                    "           ,[ToDate])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ph.getPayment().getId());
            stm.setInt(2, ph.getBill().getId());
            stm.setDate(3, ph.getFromDate());
            stm.setDate(4, ph.getToDate());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentHistoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
