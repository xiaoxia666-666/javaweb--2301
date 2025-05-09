package xia;


import entity.Sp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/ShowData")
public class ShowDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("spList", spList());
        req.getRequestDispatcher("ShowData.jsp").forward(req, resp);
    }

    private ArrayList<Sp> spList() {
        ArrayList<Sp> spList = new ArrayList<>();
        for (int i = 1; i <= 6; i++) {
            //产生一件商品
            Sp sp = new Sp();
            // 商品数据写入
            sp.setId(1000 + i);
            sp.setIntro("居家首选销量大" + i);
            sp.setName("居家用品" + i);
            sp.setPrice(i * 10);
            sp.setStock(11 * i);
            sp.setPicPath("rose-bear.png");
            //将商品添加至商品列表
            spList.add(sp);
        }
        //返回商品列表
        return spList;

//        ArrayList<Sp> goods=new ArrayList<Sp>();
//        for(int i=1;i<=10 ;i++) {
//            Sp sp1 = new Sp();
//            sp1.setId(100 + i);
//            sp1.setIntro("销量第" + i);
//            sp1.setPicPath("contact.png");
//            sp1.setPrice(11.3 * i);
//            sp1.setStock(100 * i);
//
//            Sp.add(sp1);
//        }
//        req.setAttribute("data",sp);
//        req.getRequestDispatcher("ShowData.jsp").forward(req,resp);

    }
}
