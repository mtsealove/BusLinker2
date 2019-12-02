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
}
