package BusLinker.Table;

import BusLinker.Database.DbConn;

import javax.naming.CompositeName;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TableManager {
    Connection connection;
    PreparedStatement ppst;

    public TableManager() {
        DbConn conn = new DbConn();
        connection = conn.getConn();
    }

    //화주사 목록 조회
    public ArrayList<Owner> getOwners(int page, int sep) {
        ArrayList<Owner> owners = new ArrayList<>();
        String query = "select M.Name, O.BusinessAddr, O.Contact, M.ID from Members M " +
                "join Owner O " +
                "on M.OptionID=O.OptionID " +
                "where M.Class=4 order by Name desc limit ?, ?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, page * sep);
            ppst.setInt(2, (page + 1) * sep);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String addr = rs.getString(2);
                String mobile = rs.getString(3);
                String mail = rs.getString(4);
                Owner owner = new Owner(name, addr, mobile, mail);
                owners.add(owner);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return owners;
    }

    //화주사 개수
    public int GetOwnerCount() {
        int result = 0;
        String query = "select count(*) as cnt from Members where class=4";
        try {
            ppst = connection.prepareStatement(query);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            result = rs.getInt(1);
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //운송사업자 목록 조회
    public ArrayList<Company> getCompanies(int page, int sep) {
        ArrayList<Company> companies = new ArrayList<>();
        String query = "select M.Name, C.BusinessAddr, C.Contact, M.ID from Members M " +
                "join Company C " +
                "on M.OptionID=C.optionID " +
                "where M.Class=2 order by Name desc limit ?, ?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, page * sep);
            ppst.setInt(2, (page + 1) * sep);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String addr = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
                Company company = new Company(name, addr, mobile, email);
                companies.add(company);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companies;
    }

    //운송사업자 개수 조회
    public int getCompanyCount() {
        int result = 0;
        String query = "select count(*) from Members where Class=2";
        try {
            ppst = connection.prepareStatement(query);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            result = rs.getInt(1);
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    //물류관리 직원 목록 조회
    public ArrayList<Staff> getStaffs(int page, int sep) {
        ArrayList<Staff> staffs = new ArrayList<>();
        String query = "select M.Name, S.Addr, S.Contact, M.ID from Members M \n" +
                "join Staff S\n" +
                "on M.OptionID=S.OptionID\n" +
                "where M.Class=5 order by Name desc limit ?, ?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, page * sep);
            ppst.setInt(2, (page + 1) * sep);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                String addr = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
                Staff staff = new Staff(name, addr, mobile, email);
                staffs.add(staff);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return staffs;
    }

    //물류관리 직원 개수
    public int getStaffCount() {
        int result = 0;
        String query = "select count(*) from Members where Class=5";
        try {
            ppst = connection.prepareStatement(query);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            result=rs.getInt(1);
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
