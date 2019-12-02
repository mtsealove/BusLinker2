package BusLinker.Database;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbConn {
    private Connection conn;   //데이터베이스에 접근하기 위한 객체
    private PreparedStatement pstmt;
    private ResultSet rs;   //정보를 담을 수 있는 변수를 생성

    public DbConn() {
        try {
            //생성자
            String dbURL = "jdbc:mysql://localhost:3306/BusLinker2?serverTimezone=UTC";
            String dbID = "buslinker";
            String dbPassword = getPassword();
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConn() {
        return conn;
    }

    //비밀번호 읽기
    private String getPassword() {
        String pw = null;
        File file = new File("./pw.dat");
        try {
            BufferedReader br = new BufferedReader(new FileReader(file));
            pw = br.readLine();
            br.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return pw;
    }
}
