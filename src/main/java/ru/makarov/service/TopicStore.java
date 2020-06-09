package ru.makarov.service;

import ru.makarov.model.Comments;
import ru.makarov.model.Topic;

import java.util.List;

public interface TopicStore {
    List<Topic> findAll();

    void save(Topic topic);

    Topic findAllById(Long id);
}
