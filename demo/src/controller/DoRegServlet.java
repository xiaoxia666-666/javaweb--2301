package controller;

import entity.Customer;
import service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/doReg")
public class DoRegServlet extends HttpServlet {
    private CustomerServiceImpl csi = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        try {
            String realname = req.getParameter("realname");//以下这些双引号里面的东西，单词，要和jsp的name属性一样才能传参。
            String username = req.getParameter("username");
            String pass = req.getParameter("pass");
            String confirmPass = req.getParameter("confirmPassword");
            String imgUrl = req.getParameter("imgUrl");
            String intro = req.getParameter("introl");
            String tel = req.getParameter("tel");
            String email = req.getParameter("email");
            String gender = req.getParameter("gender");
            String cardID = req.getParameter("cardID");
            String stateStr = req.getParameter("state");
            String levelStr = req.getParameter("level");

            if (!pass.equals(confirmPass)) {
                req.setAttribute("error", "两次输入的密码不一致");
                req.getRequestDispatcher("/reg").forward(req, resp);
                return;
            }

            Customer cus = new Customer();
            cus.setRealname(realname);
            cus.setUsername(username);
            cus.setPass(pass);
            cus.setImgUrl(imgUrl != null ? imgUrl : "default.jpg");
            cus.setIntro(intro);
            cus.setTel(tel);
            cus.setEmail(email);
            cus.setGender(gender);
            cus.setCardID(cardID);
            cus.setRegTime(new Date());

            int state = stateStr != null ? Integer.parseInt(stateStr) : 1;
            int level = levelStr != null ? Integer.parseInt(levelStr) : 1;
            cus.setState(state);
            cus.setLevel(level);

            int i = csi.addCustomer(cus);
            if (i > 0) {
                req.getRequestDispatcher("/index").forward(req, resp);
            } else {
                req.setAttribute("error", "注册失败，请检查信息是否完整");
                req.getRequestDispatcher("/reg").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "注册过程中出现异常，请稍后再试");
            req.getRequestDispatcher("/reg").forward(req, resp);
        }
    }
}