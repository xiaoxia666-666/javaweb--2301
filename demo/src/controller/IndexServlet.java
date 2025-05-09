package controller;


import service.impl.GoodsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 继承HttpServlet
 *
 * @WebServlet 一是在容器注册，二是产生该servlet对象（ new）
 * urlPatterns:客户（请求）的网址，请求时会进行地址拼接   http://localhost:8080/login
 */
@WebServlet(urlPatterns = "/index")
public class IndexServlet extends HttpServlet {
    //    引入服务层对象
    GoodsServiceImpl gsi = new GoodsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//调用服务层方法，封装数据
        req.setAttribute("spList", gsi.findAll(null));
//        req.getRequestDispatcher("showData.jsp").forward(req, resp);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

}