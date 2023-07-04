package com.example.user_service;

import com.example.model.User;
import com.example.user_repository.IUserRepository;
import com.example.user_repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) throws SQLException {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() throws SQLException {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchUser(String country) throws SQLException {
        List<User> listUser = userRepository.selectAllUsers();
        for (User u : listUser) {
            if (!country.toLowerCase().contains(u.getCountry().toLowerCase()))
                listUser.remove(u);
        }
        return listUser;
    }

    @Override
    public List<User> oderByUser() throws SQLException {
        return userRepository.oderByUser();
    }
}
