package ru.makarov.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.makarov.dao.UserServiceCrud;
import ru.makarov.model.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService implements UserStore {
    private UserServiceCrud userServiceCrud;

    @Autowired
    public UserService(UserServiceCrud userServiceCrud) {
        this.userServiceCrud = userServiceCrud;
    }

    @Override
    @Transactional
    public User findByName(String username) {
        return userServiceCrud.findUserByUsername(username);
    }

    @Override
    @Transactional
    public void save(User user) {
        userServiceCrud.save(user);
    }

    @Override
    @Transactional
    public List<User> findAll() {
        return userServiceCrud.findAll();
    }

    @Override
    public User findById(Long id) {
        return userServiceCrud.findUserById(id);
    }
}
