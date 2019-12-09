package BusLinker;

import BusLinker.Database.DbConn;
import com.sun.tools.javah.Gen;

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

    //ID 중복 확인
    public boolean IDCheck(String ID) {
        int count = 0;
        String query = "select count(*) as cnt from Members where ID=?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, ID);
            ResultSet rs = ppst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (count != 0) return false;
        else return true;
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
            ppst.close();
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
            rs.first();
            OptionID = rs.getInt("OptionID");
            rs.close();
            ppst.close();
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
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //버스사 생성
    public boolean CreateCompany(String BusinessName, String BusinessNum, String BusinessAddr,
                                 String CenterAddr, String Contact, String Mail, String Password, String fileName) {
        //옵션 생성
        String OptionQuery = "insert into Company set BusinessName=?, BusinessNum=?, BusinessAddr=?, CenterAddr=?, Contact=?, FilePath=?";
        try {
            ppst = connection.prepareStatement(OptionQuery);
            ppst.setString(1, BusinessName);
            ppst.setString(2, BusinessNum);
            ppst.setString(3, BusinessAddr);
            ppst.setString(4, CenterAddr);
            ppst.setString(5, Contact);
            ppst.setString(6, fileName);
            ppst.executeUpdate();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        //옵션 가져오기
        int optionID = 1;
        String getOption = "select OptionID from Company ";
        try {
            ppst = connection.prepareStatement(getOption);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            optionID = rs.getInt("OptionID");
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        //사용자 생성
        String MemberQuery = "insert into Members set ID=?, Password=?, Name=?, Class=2, OptionID=?";
        try {
            ppst = connection.prepareStatement(MemberQuery);
            ppst.setString(1, Mail);
            ppst.setString(2, Password);
            ppst.setString(3, BusinessName);
            ppst.setInt(4, optionID);
            ppst.executeUpdate();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //물류관리 직원 생성
    public boolean CreateStaff(String Name, String Gender, int Age, String Contact, String Addr, String Mail, String Password) {
        //옵션 생성
        String OptionQuery = "insert into Staff set Gender=?, Age=?, Contact=?, Addr=?";
        try {
            ppst = connection.prepareStatement(OptionQuery);
            ppst.setString(1, Gender);
            ppst.setInt(2, Age);
            ppst.setString(3, Contact);
            ppst.setString(4, Addr);
            ppst.executeUpdate();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        //옵션 ID 얻기
        int optionID = 1;
        String getOption = "select OptionID from Staff order by OptionID desc";
        try {
            ppst = connection.prepareStatement(getOption);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            optionID = rs.getInt(1);
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        //사용자 생성
        String MemberQuery = "insert into Members set ID=?, Password=?, Name=?, Class=5, OptionID=?";
        try {
            ppst = connection.prepareStatement(MemberQuery);
            ppst.setString(1, Mail);
            ppst.setString(2, Password);
            ppst.setString(3, Name);
            ppst.setInt(4, optionID);
            ppst.executeUpdate();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //물류센터 생성
    public boolean CreateCenter(String Name, String BusinessNum, String BusinessAddr, String CenterAddr, String Contact, String ID) {
        String query = "insert into Center set Name=?, BusinessNum=?, BusinessAddr=?, CenterAddr=?, Contact=?, ID=?";

        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, Name);
            ppst.setString(2, BusinessNum);
            ppst.setString(3, BusinessAddr);
            ppst.setString(4, CenterAddr);
            ppst.setString(5, Contact);
            ppst.setString(6, ID);

            ppst.executeUpdate();
            ppst.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
