package ru.makarov.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import ru.makarov.model.User;

import java.util.List;

/**
 * Connect JPA data for users.
 */
@Repository
public interface UserServiceCrud extends JpaRepository<User, Long> {
    User findUserByUsername(String username);

    User findUserById(Long id);
}
