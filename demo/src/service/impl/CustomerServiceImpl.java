// src/service/impl/CustomerServiceImpl.java
package service.impl;


import dao.ICustomerDao;

import dao.impl.CustomerDaoImpl;
import entity.Customer;
import service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {
    private ICustomerDao customerDao = new CustomerDaoImpl();

    @Override
    public int addCustomer(Customer customer) {
        return customerDao.insert(customer);
    }
}