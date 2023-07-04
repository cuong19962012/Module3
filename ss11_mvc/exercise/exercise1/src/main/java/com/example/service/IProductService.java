package com.example.service;

import com.example.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> list();

    void delete(int id);

    void add(String name, double price, String description, String maker);

    void edit(int id, Product product);

    Product findById(int id);

    List<Product> search(String name);
}
