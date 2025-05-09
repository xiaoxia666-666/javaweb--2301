
package test;

import entity.Customer;
import service.impl.CustomerServiceImpl;

import java.util.Date;

public class CustomerServiceTest {
    public static void main(String[] args) {
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        Customer customer = new Customer();
        customer.setRealname("李四");
        customer.setUsername("li");
        customer.setPass("654321");
        customer.setImgUrl("default.jpg");
        customer.setIntro("这是另一个测试用户");
        customer.setTel("1390013");
        customer.setEmail("lisi@le.com");
        customer.setGender("女");
        customer.setCardID("876543210987654321");
        customer.setRegTime(new Date());
        customer.setState(1);
        customer.setLevel(1);

        int result = customerService.addCustomer(customer);
        if (result > 0) {
            System.out.println("添加成功");
        } else {
            System.out.println("添加失败");
        }
    }
}