package BusLinker.Route;

import BusLinker.Database.DbConn;

import java.sql.Connection;
import java.util.ArrayList;

public class RouteManager {
    DbConn conn;
    Connection connection;

    public RouteManager() {
        conn = new DbConn();
        connection = conn.getConn();
    }

}
