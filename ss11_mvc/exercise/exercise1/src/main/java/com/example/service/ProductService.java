package com.example.service;

import com.example.model.Product;
import com.example.repository.IProductRepository;
import com.example.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> list() {
        return iProductRepository.list();
    }

    @Override
    public void delete(int id) {
        iProductRepository.delete(id);
    }

    @Override
    public void add(Product product) {
        iProductRepository.add(product);
    }

    @Override
    public void edit(int id, Product product) {
        iProductRepository.edit(id, product);
    }

    @Override
    public Product findById(int id) {
        return iProductRepository.findById(id);
    }

    @Override
    public List<Product> search(String name) {
        return iProductRepository.search(name);
    }
}
