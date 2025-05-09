package controller;

import entity.Goods;
import entity.GoodsItem;
import service.impl.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 继承HttpServlet
 * 控制层
 *
 * @WebServlet 一是在容器注册，二是产生该servlet对象（ new）
 * urlPatterns:客户（请求）的网址，请求时会进行地址拼接   http://localhost:8080/login
 */
@WebServlet(urlPatterns = "/session")
public class SessionServlet extends HttpServlet {
    //    调用服务层
    GoodsServiceImpl gsi=  new GoodsServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean flag=false;
       // 接收String的ID，转int
        int id = Integer.parseInt(req.getParameter("id"));
//      购物项
        GoodsItem goodsItem = null;
//        商品
        Goods goods = null;
//        获取session对象
        HttpSession session = req.getSession();
//       从session 中拿到购物车数据
        List<GoodsItem> cart =(List<GoodsItem>)session.getAttribute("cart");

        //若购物车数据为空，则代表第一次购物，生成购物车
        if(cart == null) {
            cart = new ArrayList<>();
        }
        for(GoodsItem g:cart){
            if (g.getGoodsId() == id) {
                goodsItem = g;
                flag = true;
            }
        }
        if(flag) {
            goodsItem.setNum(goodsItem.getNum() + 1);
        }
        else {
            GoodsItem goodsItem1 = new GoodsItem();
            goodsItem1.setNum(1);
            goodsItem1.setGoods(gsi.findById(id));
            goodsItem1.setGoodsId(id);
            cart.add(goodsItem1);
        }
        // 将购物车数据写入session
        session.setAttribute("cart", cart);


//
////        生成购物项数据并添加进列表
//        for (int i = 90005; i <= 90009; i++) {
//            goodsItem = new GoodsItem();
//            goodsItem.setNum(i%1000+3);
////      关键
//            goods=gsi.findById(i);
////
//            goodsItem.setGoods(goods);
//            goodsItem.setGoodsId(goods.getId());
//            goodsItemList.add(goodsItem);
//        }

//      将购物项列表数据写入session（此对象可以跨域保存数据）
               /// session.setAttribute("goodsList", goodsItem);

//        转至购物车页
                req.getRequestDispatcher("/index").forward(req, resp);
            }
        }

