/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Payment;

/**
 *
 * @author firem
 */
public class PaymentDBContext extends DBContext{
    public void insertPayment(Payment pm){
        String sql = "INSERT INTO [dbo].[Payment]\n" +
                    "           ([ContractId]\n" +
                    "           ,[CurrentBillId]\n" +
                    "           ,[FromDate]\n" +
                    "           ,[ToDate]\n" +
                    "           ,[Status])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?\n" +
                    "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pm.getContract().getId());
            stm.setNull(2, Types.INTEGER);
            stm.setDate(3, pm.getFromDate());
            stm.setDate(4, pm.getToDate());
            stm.setBoolean(5, true);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
