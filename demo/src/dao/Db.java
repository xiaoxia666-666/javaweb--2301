package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Db {
    private static Connection conn = null;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String u ="root";
            String p ="xyammx237";
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",u,p);
        } catch (ClassNotFoundException e) {
            System.out.println("没有找到驱动类");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
}
}
