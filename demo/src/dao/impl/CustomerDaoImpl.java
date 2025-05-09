package dao.impl;

import dao.ICustomerDao;
import entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import static dao.Db.getConn;

public class CustomerDaoImpl implements ICustomerDao {

    @Override
    public int insert(Customer customer) {
        int i = 0;
        String sql = "INSERT INTO customer (realname, username, pass, imgUrl, intro, tel, email, gender, cardID, regTime, state, level) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement prst = null;

        try {
            // 获取数据库连接
            conn = getConn();
            System.out.println("数据库连接获取成功");

            // 准备SQL语句
            prst = conn.prepareStatement(sql);
            prst.setString(1, customer.getRealname());
            prst.setString(2, customer.getUsername());
            prst.setString(3, customer.getPass());
            prst.setString(4, customer.getImgUrl());
            prst.setString(5, customer.getIntro());
            prst.setString(6, customer.getTel());
            prst.setString(7, customer.getEmail());
            prst.setString(8, customer.getGender());
            prst.setString(9, customer.getCardID());

            // 设置注册时间
            Date regTime = customer.getRegTime();
            if (regTime != null) {
                prst.setTimestamp(10, new Timestamp(regTime.getTime()));
            } else {
                prst.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            }

            prst.setInt(11, customer.getState());
            prst.setInt(12, customer.getLevel());

            // 执行SQL语句
            i = prst.executeUpdate();
            System.out.println("SQL执行成功，插入行数: " + i);

        } catch (SQLException throwables) {
            // 打印详细的SQL错误信息
            System.err.println("SQL执行错误: " + throwables.getMessage());
            System.err.println("错误代码: " + throwables.getErrorCode());
            System.err.println("SQL状态: " + throwables.getSQLState());
            throwables.printStackTrace();

        } finally {
            // 确保资源被关闭
            try {
                if (prst != null) prst.close();
                if (conn != null) conn.close();
                System.out.println("数据库资源已关闭");
            } catch (SQLException e) {
                System.err.println("关闭资源时出错: " + e.getMessage());
                e.printStackTrace();
            }
        }

        return i;
    }

    @Override
    public int addCustomer(Customer customer) {
        return insert(customer);
    }
}