package dao.impl;

import dao.Db;
import dao.IBaseDao;
import entity.Goods;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 接口的实现
 */
public class GoodsDaoImpl extends Db implements IBaseDao<Goods>{
    //Statement stmt = null;
    private Connection conn = getConn();
    private Statement stmt = null;
    private ResultSet rs = null;
    private String sql;//要定义一个sql变量
    @Override
    public List<Goods> findByProp(HashMap<String, Object> prop) {
//      如果查询参数为null，则是全部查询
        if (prop==null){
            sql= "select * from goods";
        }else if(prop.containsKey("id")){
            sql= "select * from goods where id="+prop.get("id");
        }
        Goods goods=null;
        List<Goods> goodsList=new ArrayList<>();
        try {
            stmt = conn.createStatement();
//           String sql= "select * from goods";
            rs = stmt.executeQuery(sql);
            // 展开结果集数据库
            while (rs.next()) {
                goods=new Goods();

                goods.setId(rs.getInt("id"));
                goods.setStock(rs.getInt("stock"));
                goods.setKeywords(rs.getString("keywords"));
                goods.setCode(rs.getString("code"));
                goods.setSpec(rs.getString("spec"));
                goods.setImgUrl(rs.getString("imgUrl"));
                goods.setIn_price(rs.getDouble("in_price"));
                goods.setOut_price(rs.getDouble("out_price"));
                goodsList.add(goods);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return goodsList;
    }
//        stmt =  getConn().createStatement();
//        String  sql = "SELECT * FROM goods";
//        ResultSet rs = stmt.executeQuery(sql);
//        // 展开结果集数据库
//        while(rs.next()){
//            // 通过字段检索
//            int id  = rs.getInt("id");
//            // 输出数据
//            System.out.print("ID: " + id);
//            System.out.print("\n");



    @Override
    public int insert(Goods goods) {
        return 0;
    }

    @Override
    public int update(Goods goods) {
        return 0;
    }

    @Override
    public int delete(int id) {
        return 0;
    }
}
