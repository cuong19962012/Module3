package repository;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> data = new ArrayList<>();

    static {
        data.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://top10danang.vn/wp-content/uploads/2022/10/hinh-anh-da-nang-1.jpg"));
        data.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Hà Nội", "https://top10danang.vn/wp-content/uploads/2022/10/hinh-anh-da-nang-1.jpg"));
        data.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://top10danang.vn/wp-content/uploads/2022/10/hinh-anh-da-nang-1.jpg"));
    }

    @Override
    public List<Customer> display() {
        return data;
    }
}
