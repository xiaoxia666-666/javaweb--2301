package test;

import service.impl.CustomerServiceImpl;
import entity.Customer;

public class TestCustomerLogin {
    public static void main(String[] args) {
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        String username = "zhan";
        String password = "123456";
        Customer customer = customerService.login(username, password);
        if (customer != null) {
            System.out.println("登录成功，欢迎：" + customer.getUsername());
        } else {
            System.out.println("登录失败，请检查账号和密码。");
        }
    }
}