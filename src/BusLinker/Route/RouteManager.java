package BusLinker.Route;

import BusLinker.Database.DbConn;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class RouteManager {
    DbConn conn;
    Connection connection;
    PreparedStatement ppst;

    public RouteManager() {
        conn = new DbConn();
        connection = conn.getConn();
    }

    public boolean CreateRoute(String CompanyID, String CenterID, String Alias, String[] owner, int[] cat, int[] action, String[] address) {
        System.out.println(owner.length);
        System.out.println(cat.length);
        System.out.println(action.length);
        System.out.println(address.length);
        int RouteID = 0;
        String query = "insert into Route set CompanyID=?, CenterID=?, Alias=?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setString(1, CompanyID);
            ppst.setString(2, CenterID);
            ppst.setString(3, Alias);
            ppst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        String idQuery = "select RouteID from Route order by RouteID desc";
        try {
            ppst = connection.prepareStatement(idQuery);
            ResultSet rs = ppst.executeQuery();
            rs.first();
            RouteID = rs.getInt("RouteID");
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        for (int i = 0; i < cat.length; i++) {
            if (address[i] != null && address[i].length() != 0) {
                String timelineQuery = "insert into TimeLine set RouteID=?, ActionTime=?, PassID=?, DesID=?, Addr=?, OwnerID=?";
                try {
                    LocalTime localTime = LocalTime.of(i + 1, 0);
                    System.out.println(localTime.toString());
                    ppst = connection.prepareStatement(timelineQuery);
                    ppst.setInt(1, RouteID);
                    ppst.setString(2, localTime.toString());
                    ppst.setInt(3, action[i]);
                    ppst.setInt(4, cat[i]);
                    ppst.setString(5, address[i]);
                    //화주사일 경우에만 ID 설정
                    if (cat[i] == 2)
                        ppst.setString(6, owner[i]);
                    else
                        ppst.setString(6, "");
                    ppst.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }

        return true;
    }

    //물류센터
    public ArrayList<Route> getRouteList(int page, int sep) {
        ArrayList<Route> routes = new ArrayList<>();
        String query = "select R.*, Ct.Name CenterName from Route R join Center Ct\n" +
                "on R.CenterID=Ct.ID order by RouteID desc limit ?, ?";
        try {
            ppst = connection.prepareStatement(query);
            ppst.setInt(1, page * sep);
            ppst.setInt(2, (page + 1) * sep);
            ResultSet rs = ppst.executeQuery();
            while (rs.next()) {
                String idQuery = "select BusinessName from Company where OptionID in\n" +
                        "(select OptionID from Members where ID=?)";
                PreparedStatement ppst2 = connection.prepareStatement(idQuery);
                ppst2.setString(1, rs.getString("CompanyID"));
                ResultSet resultSet = ppst2.executeQuery();
                resultSet.first();
                String CompanyName = resultSet.getString(1);
                String alias = rs.getString("Alias");
                String CenterName = rs.getString("CenterName");
                int RouteID = rs.getInt("RouteID");
                String addrQuery = "select Addr from timeline where RouteID=? order by ActionTime asc";
                PreparedStatement ppst3 = connection.prepareStatement(addrQuery);
                ppst3.setInt(1, RouteID);
                ResultSet rs3 = ppst3.executeQuery();
                rs3.first();
                String addr = rs3.getString(1);
                Route route = new Route(alias, CenterName, CompanyName, addr);
                routes.add(route);
            }
            rs.close();
            ppst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return routes;
    }
}
