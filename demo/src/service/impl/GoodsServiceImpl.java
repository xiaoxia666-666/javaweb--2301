package service.impl;

import dao.impl.GoodsDaoImpl;
import entity.Goods;
import service.IGoodsService;

import java.util.HashMap;
import java.util.List;

//服务层的实现
public class GoodsServiceImpl implements IGoodsService {
    //  引入持久层对象
    GoodsDaoImpl dai=new GoodsDaoImpl();
    @Override
    public List<Goods> findAll(HashMap<String, Object> prop) {
        return dai.findByProp(null);
    }
    @Override
    public Goods findById(int id) {
        HashMap<String, Object> newProp = new HashMap<>();
        newProp.put("id", id);
        return dai.findByProp(newProp).get(0);
    }
}