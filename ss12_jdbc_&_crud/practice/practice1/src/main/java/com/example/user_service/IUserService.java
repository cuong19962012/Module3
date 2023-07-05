package com.example.user_service;

import com.example.user_model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id) throws SQLException;

    public List<User> selectAllUsers() throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> searchUser(String country) throws SQLException;

    public List<User> oderByUser() throws SQLException;

    public User getUserById(int id);
    public void insertUserStore(User user) throws SQLException;
    void addUserTransaction(User user,int[] permissions);
    void insertUpdateWithoutTransaction();
    void insertUpdateUseTransaction();
}
