package test;

import entity.Goods;
import service.impl.GoodsServiceImpl;

public class TestGoodsServcieImpl {
    public static void main(String[] args) {
//        System.out.println(new GoodsDaoImpl().findByProp(null).size());
        for (Goods g : new GoodsServiceImpl().findAll(null)){
            System.out.println(g);
        }
    }
}