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
import model.Conduct;
import model.ConductType;
import model.Contract;
import model.Customer;
import model.Room;
import model.RoomType;

/**
 *
 * @author firem
 */
public class ContractDBContext extends DBContext {

    public Contract getContractByIdRoom(int id, int status) {
        String sql = "select t.Id,t.Deposit,t.PriceConduct,t.HireDate,t.CheckOutDate,t.[Status],\n"
                + "t.CustomerId,c.[Name] as CustomerName,c.DateOfBirth,c.PhoneNumber,\n"
                + "c.IdentityCard,c.Gender,c.[Address],c.Email,c.HireDate as HireDateCustomer,c.[Status] as CustomerStatus,\n"
                + "t.RoomId,r.[Name] as RoomName,r.[Floor],r.[Status] as RoomStatus,\n"
                + "r.TypeId,p.[Name] as RoomTypeName,p.Price,p.Area,p.Quantity,\n"
                + "c.AccountId,a.Username,a.[Password]\n"
                + "from [Contract] as t\n"
                + "inner join Customer as c on c.Id = t.CustomerId\n"
                + "inner join Room as r on r.Id = t.RoomId\n"
                + "inner join Account as a on a.Id = c.AccountId\n"
                + "inner join RoomType as p on p.Id = r.TypeId\n"
                + "where t.RoomId = ? and t.[Status] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, status);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {

                Contract ct = new Contract();
                ct.setId(rs.getInt("Id"));
                ct.setDeposit(rs.getDouble("Deposit"));
                ct.setPriceConduct(rs.getDouble("PriceConduct"));
                ct.setHireDate(rs.getDate("HireDate"));
                ct.setCheckOutDate(rs.getDate("CheckOutDate"));
                ct.setStatus(rs.getBoolean("Status"));

                RoomType rt = new RoomType();
                rt.setId(rs.getInt("TypeId"));
                rt.setName(rs.getString("RoomTypeName"));
                rt.setPrice(rs.getDouble("Price"));
                rt.setArea(rs.getDouble("Area"));
                rt.setQuantity(rs.getInt("Quantity"));

                Room rm = new Room();
                rm.setId(rs.getInt("RoomId"));
                rm.setName(rs.getString("RoomName"));
                rm.setFloor(rs.getInt("Floor"));
                rm.setStatus(rs.getBoolean("RoomStatus"));
                rm.setRoomType(rt);

                Account ac = new Account();
                ac.setId(rs.getInt("AccountId"));
                ac.setUsername(rs.getString("Username"));
                ac.setPassword(rs.getString("Password"));

                Customer cs = new Customer();
                cs.setId(rs.getInt("CustomerId"));
                cs.setName(rs.getString("CustomerName"));
                cs.setDob(rs.getDate("DateOfBirth"));
                cs.setGender(rs.getBoolean("Gender"));
                cs.setPhone(rs.getString("PhoneNumber"));
                cs.setIdentity(rs.getString("IdentityCard"));
                cs.setAddress(rs.getString("Address"));
                cs.setEmail(rs.getString("Email"));
                cs.setHireDate(rs.getDate("HireDateCustomer"));
                cs.setStatus(rs.getBoolean("CustomerStatus"));
                cs.setRoom(rm);
                cs.setAccount(ac);

                ct.setCustomer(cs);
                ct.setRoom(rm);
                ArrayList<Conduct> list = getListConductByContractId(rs.getInt("Id"));
                ct.setListConduct(list);
                return ct;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Conduct> getListConductByContractId(int id) {
        String sql = "select c.Id,c.[Name],c.Price,c.TypeId,t.[Name] as ConductTypeName\n"
                + "from ConductService as s\n"
                + "inner join Conduct as c on c.Id = s.ConductId\n"
                + "inner join ConductType as t on c.TypeId = t.Id\n"
                + "where s.ContractId = ? ";
        ArrayList<Conduct> list = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Conduct cd = new Conduct();
                cd.setId(rs.getInt("Id"));
                cd.setName(rs.getString("Name"));
                cd.setPrice(rs.getDouble("Price"));
                
                ConductType ct = new ConductType();
                ct.setId(rs.getInt("TypeId"));
                ct.setName(rs.getString("ConductTypeName"));
                
                cd.setConductType(ct);
                list.add(cd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}