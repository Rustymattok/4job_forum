package ru.makarov.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.model.User;

import java.util.List;

/**
 * Connect JPA data for Comments.
 */
@Repository
public interface CommentServiceCrud extends JpaRepository<Comments, Long> {
    List<Comments> findAllByTopic(Topic topic);

    List<Comments> findAllByAuthor(User user);
}
