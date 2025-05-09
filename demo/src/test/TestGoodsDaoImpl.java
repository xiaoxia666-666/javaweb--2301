package test;

import dao.impl.GoodsDaoImpl;
import entity.Goods;

public class TestGoodsDaoImpl {
    public static void main(String[] args) {
//        System.out.println(new GoodsDaoImpl().findByProp(null).size());
        for (Goods g : new GoodsDaoImpl().findByProp(null)){
            System.out.println(g);
        }
    }
}
