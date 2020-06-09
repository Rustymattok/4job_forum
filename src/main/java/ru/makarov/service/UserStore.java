package ru.makarov.service;

import ru.makarov.model.User;

import java.util.List;

public interface UserStore {
    User findByName(String username);

    User findById(Long id);

    void save(User user);

    List<User> findAll();
}
