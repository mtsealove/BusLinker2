package BusLinker.Table;

import BusLinker.Database.DbConn;
import BusLinker.Table.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class NoticeManager {
    DbConn dbConn;
    Connection connection;
    PreparedStatement ppst;
    //페이지에 표시할 개수
    int sep;

    public NoticeManager(int sep) {
        dbConn = new DbConn();
        connection = dbConn.getConn();
        this.sep = sep;
    }

    //새 공지사항 생성
    public boolean CreateNotice(String memberID, String title, String content, String fileName) {
        //현재 시간 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String noticeTime = dateFormat.format(new Date(System.currentTimeMillis()));
        String query = "insert into Notice set memberID=?, title=?, content=?, FilePath=?, NoticeTime=?";

        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, memberID);
            ppst.setString(2, title);
            ppst.setString(3, content);
            ppst.setString(4, fileName);
            ppst.setString(5, noticeTime);

            ppst.executeUpdate();
            ppst.close();
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //공지사항 업데이트
    public boolean UpdateNotice(int noticeID, String title, String content, String fileName) {
        //현재 시간 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String noticeTime = dateFormat.format(new Date(System.currentTimeMillis()));
        String query = "update Notice set title=?, content=?, FilePath=?, NoticeTime=? where NoticeID=?";

        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, title);
            ppst.setString(2, content);
            ppst.setString(3, fileName);
            ppst.setString(4, noticeTime);
            ppst.setInt(5, noticeID);

            ppst.executeUpdate();
            ppst.close();
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //공지사항 삭제
    public boolean DeleteNotice(int noticeID) {
        try {
            String query = "delete from notice where noticeID=?";
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, noticeID);
            ppst.executeUpdate();
            ppst.close();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }


    //공지사항 리스트 반환
    public ArrayList<Notice> GetNotice(int page) {
        ArrayList<Notice> notices = new ArrayList<>();
        String query = "select * from Notice order by NoticeID Desc limit ?, ?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, page * sep);
            ppst.setInt(2, (page + 1) * sep);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                int NoticeID = rs.getInt("NoticeID");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String MemberID = rs.getString("MemberID");
                String FilePath = rs.getString("FilePath");
                String NoticeTime = rs.getString("NoticeTime");
                Notice notice = new Notice(NoticeID, MemberID, title, content, FilePath, NoticeTime);
                notices.add(notice);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }
        return notices;
    }

    //페이지 개수 반환
    public int GetNoticePage() {
        int cnt = 0;
        String query = "select count(*) as cnt from Notice";
        try {
            ppst = connection.prepareStatement(query);
            ResultSet rs = ppst.executeQuery();

            while (rs.next()) {
                cnt = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        cnt = (int) Math.ceil(cnt / sep);
        return cnt;
    }

    public Notice getNoticeById(int noticeID) {
        Notice notice = null;
        String query = "select distinct * from Notice where NoticeID=?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, noticeID);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                String memberID = rs.getString(2);
                String title = rs.getString(3);
                String content = rs.getString(4);
                String FilePath = rs.getString(5);
                String NoticeTime = rs.getString(6);
                notice = new Notice(noticeID, memberID, title, content, FilePath, NoticeTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notice;
    }
}
