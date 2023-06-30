package service;

import model.Customer;
import repository.CustomerRepository;
import repository.ICustomerRepository;

import java.util.List;

public class ServiceCustomer implements ICustomerService {
    private static ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> display() {
        List<Customer> data = iCustomerRepository.display();
        return data;
    }
}
