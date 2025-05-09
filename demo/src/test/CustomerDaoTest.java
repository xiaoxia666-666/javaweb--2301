package test;

import dao.impl.CustomerDaoImpl;
import entity.Customer;

import java.util.Date;

public class CustomerDaoTest {
    public static void main(String[] args) {
        CustomerDaoImpl customerDao = new CustomerDaoImpl();
        Customer customer = new Customer();
        customer.setRealname("张三");
        customer.setUsername("zhan");
        customer.setPass("123456");
        customer.setImgUrl("default.jpg");
        customer.setIntro("这是一个测试用户");
        customer.setTel("13800138000");
        customer.setEmail("zhangs@le.com");
        customer.setGender("男");
        customer.setCardID("123456789012345678");
        customer.setRegTime(new Date());
        customer.setState(1);
        customer.setLevel(1);

        int result = customerDao.insert(customer);
        if (result > 0) {
            System.out.println("插入成功");
        } else {
            System.out.println("插入失败");
        }
    }
}