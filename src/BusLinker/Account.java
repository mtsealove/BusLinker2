package BusLinker;

import BusLinker.Database.DbConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//계정 관련 메서드
public class Account {
    DbConn db;
    Connection connection;
    PreparedStatement ppst;

    public Account() {
        db = new DbConn();
        connection = db.getConn();
    }

    //로그인 수행
    public Member Login(String id, String pw) {
        String query = "select Name, Class, Boss from Members where ID=? and Password=?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, id);
            ppst.setString(2, pw);

            ResultSet rs = ppst.executeQuery();
            Member member = null;
            while (rs.next()) {
                String Name = rs.getString("Name");
                String Boss = rs.getString("Boss");
                int classID = rs.getInt("Class");
                member = new Member(id, Name, Boss, classID);
            }
            return member;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    //화주사 생성
    public boolean CreateOwner(String Name, String BusinessNum, String BusinessAddr, String CenterAddr, String Category, String Contact, String Mail, String Password) {
        String OptionQuery = "insert into Owner set BusinessNum=?, BusinessAddr=?, CenterAddr=?,Category=?, Contact=?";

        //옵션 먼저 생성
        try {
            ppst = connection.prepareStatement(OptionQuery);
            ppst.setString(1, BusinessNum);
            ppst.setString(2, BusinessAddr);
            ppst.setString(3, CenterAddr);
            ppst.setString(4, Category);
            ppst.setString(5, Contact);
            ppst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        //생성한 옵션 ID얻어오기
        int OptionID = 1;
        String getOption = "select OptionID from Owner order by OptionID desc";
        try {
            ppst = connection.prepareStatement(getOption);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                OptionID = rs.getInt("OptionID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        //사용자 생성
        String MemberQuery = "insert into Members set ID=?, Password=?, Name=?, Class=4, OptionID=?";
        try {
            ppst = connection.prepareStatement(MemberQuery);
            ppst.setString(1, Mail);
            ppst.setString(2, Password);
            ppst.setString(3, Name);
            ppst.setInt(4, OptionID);
            ppst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
