package service;

import entity.Goods;

import java.util.HashMap;
import java.util.List;

public interface IGoodsService {
    //    查询所有
    List<Goods> findAll(HashMap<String,Object> prop);
    //   根据ID精确查询
    Goods findById(int id);

}
