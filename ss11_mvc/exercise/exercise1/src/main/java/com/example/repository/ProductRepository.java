package com.example.repository;

import com.example.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer, Product> data;

    static {
        data = new HashMap<>();
        data.put(1, new Product(1, "Bánh", 10000, "Ngon Ngon", "AceCooke"));
        data.put(2, new Product(2, "Bánh", 10000, "Ngon Ngon", "AceCooke"));
        data.put(3, new Product(3, "Bánh", 10000, "Ngon Ngon", "AceCooke"));
        data.put(4, new Product(4, "Bánh", 10000, "Ngon Ngon", "AceCooke"));
    }

    @Override
    public List<Product> list() {
        return new ArrayList<>(data.values());
    }

    @Override
    public void delete(int id) {
        data.remove(id);
    }

    @Override
    public void add(Product product) {
        data.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        data.put(id, product);
    }

    @Override
    public Product findById(int id) {
        return data.get(id);
    }

    @Override
    public List<Product> search(String name) {

        List<Product> list = new ArrayList<>();
        for (Product p : data.values()) {
            if (p.getName().toLowerCase().contains(name.toLowerCase()))
                list.add(p);
        }
        return list;
    }
}
