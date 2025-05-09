package dao;

import entity.Customer;

public interface ICustomerDao {
    int insert(Customer customer);

    int addCustomer(Customer customer);
}

