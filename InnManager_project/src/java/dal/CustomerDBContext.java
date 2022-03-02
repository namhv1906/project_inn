/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Customer;
import model.Room;
import model.RoomType;

/**
 *
 * @author firem
 */
public class CustomerDBContext extends DBContext{
    public ArrayList<Customer> getListCustomer(){
        String sql = "select c.Id,c.[Name],c.DateOfBirth,c.PhoneNumber,c.IdentityCard,c.[Address],c.Email,c.HireDate,c.[Status],\n" +
                    "c.RoomId,r.[Name] as NameRoom,r.[Floor],r.[Status] as statusRoom,r.TypeId,\n" +
                    "c.AccountId,a.Username,a.[Password]\n" +
                    "from Customer as c \n" +
                    "inner join Room as r on c.RoomId = r.Id\n" +
                    "inner join Account as a on c.AccountId = a.Id";
        ArrayList<Customer> list = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Customer cs = new Customer();
                cs.setId(rs.getInt("Id"));
                cs.setName(rs.getString("Name"));
                cs.setDob(rs.getDate("DateOfBirth"));
                cs.setPhone(rs.getString("PhoneNumber"));
                cs.setIdentity(rs.getString("IdentityCard"));
                cs.setAddress(rs.getString("Address"));
                cs.setEmail(rs.getString("Email"));
                cs.setHireDate(rs.getDate("HireDate"));
                cs.setStatus(rs.getBoolean("Status"));
                Room room = new Room();
                room.setId(rs.getInt("RoomId"));
                room.setName(rs.getString("NameRoom"));
                room.setFloor(rs.getInt("Floor"));
                RoomType rt = new RoomType();
                rt.setId(rs.getInt("TypeId"));
                room.setRoomType(rt);
                cs.setRoom(room);
                Account ac = new Account();
                ac.setId(rs.getInt("AccountId"));
                ac.setUsername(rs.getString("Username"));
                ac.setPassword(rs.getString("Password"));
                cs.setAccount(ac);
                list.add(cs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
