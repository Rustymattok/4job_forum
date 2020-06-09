package ru.makarov.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.makarov.model.Topic;

/**
 * Connect JPA data for Topics.
 */
@Repository
public interface TopicServiceCrud extends JpaRepository<Topic, Long> {
    Topic findAllById(Long id);
}
