package controller;

import entity.Customer;
import service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/doLogin")
public class DoLoginServlet extends HttpServlet {
    private CustomerServiceImpl csi = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("username");
        String p = req.getParameter("pass");
        Customer customer = csi.login(u, p);

        if (customer != null) {
            HttpSession session = req.getSession();
            session.setAttribute("customer", customer);
            req.getRequestDispatcher("/index").forward(req, resp);
        } else {
            req.setAttribute("error", "登录失败，请检查账号和密码。");
            req.getRequestDispatcher("/login").forward(req, resp);
        }
    }
}