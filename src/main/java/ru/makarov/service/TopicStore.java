package ru.makarov.service;

import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.model.User;

import java.util.List;

public interface TopicStore {
    List<Topic> findAll();

    void save(Topic topic);

    Topic findAllById(Long id);

    List<Topic> findAllByAuthor(User user);
}
