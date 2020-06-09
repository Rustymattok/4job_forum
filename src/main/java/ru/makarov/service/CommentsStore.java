package ru.makarov.service;

import ru.makarov.model.Comments;
import ru.makarov.model.Topic;

import java.util.List;

public interface CommentsStore {
    List<Comments> findAll();

    void addComments(Comments comments);

    List<Comments> findAllByTopic(Topic topic);
}
