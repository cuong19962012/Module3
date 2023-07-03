package com.example.repository;

import com.example.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> list();

    void delete(int id);

    void add(Product product);

    void edit(int id, Product product);

    Product findById(int id);

    List<Product> search(String name);

}
