package test;


import dao.impl.GoodsDaoImpl;

import java.sql.SQLException;

public class TestGoods {
    public static void main(String[] args) throws SQLException {
        System.out.println(new GoodsDaoImpl().findByProp(null).size());
    }
}