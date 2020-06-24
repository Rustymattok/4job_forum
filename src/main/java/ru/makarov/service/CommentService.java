package ru.makarov.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.makarov.dao.CommentServiceCrud;
import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.model.User;

import java.util.List;

@Service
public class CommentService implements CommentsStore {
    private final CommentServiceCrud commentServiceCrud;

    @Autowired
    public CommentService(CommentServiceCrud commentServiceCrud) {
        this.commentServiceCrud = commentServiceCrud;
    }

    @Override
    @Transactional
    public List<Comments> findAll() {
        return commentServiceCrud.findAll();
    }

    @Override
    @Transactional
    public void addComments(Comments comments) {
        commentServiceCrud.save(comments);
    }

    @Override
    @Transactional
    public List<Comments> findAllByTopic(Topic topic) {
        return commentServiceCrud.findAllByTopic(topic);
    }

    @Override
    @Transactional
    public List<Comments> findAllByAuthor(User user) {
        return commentServiceCrud.findAllByAuthor(user);
    }
}
