package ru.makarov.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.makarov.dao.TopicServiceCrud;
import ru.makarov.model.Topic;

import java.util.List;

/**
 * Class for simulate Data Base Table posts.
 */
@Service
public class TopicService implements TopicStore {
    private final TopicServiceCrud topicServiceCrud;

    @Autowired
    public TopicService(TopicServiceCrud topicServiceCrud) {
        this.topicServiceCrud = topicServiceCrud;
    }

    @Override
    @Transactional
    public List<Topic> findAll() {
        return topicServiceCrud.findAll();
    }

    @Override
    @Transactional
    public void save(Topic topic) {
        topicServiceCrud.save(topic);
    }

    @Override
    public Topic findAllById(Long id) {
        return topicServiceCrud.findAllById(id);
    }
}