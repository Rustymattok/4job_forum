package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.makarov.model.Topic;
import ru.makarov.service.TopicStore;

import java.util.List;

/**
 * Controller for work with main page.
 */
@Controller
public class IndexControl {
    /**
     * Bean for Data Base topics.
     */
    private TopicStore topicStore;

    @Autowired
    public IndexControl(TopicStore postStore) {
        this.topicStore = postStore;

    }

//todo for roles update method.

//    /**
//     * Get edit page by id.
//     *
//     * @param id    - id topic.
//     * @param model - created new topic in forum.
//     * @return - edit page of topic with param.
//     */
//
//    @GetMapping("/index/{id}")
//    public String postEdit(@PathVariable int id, Model model) {
//        Topic post = topicStore.findAllById((long) id);
//        model.addAttribute("post", post);
//        model.addAttribute("comments", new Comments());
//        return "topic";
//    }

    /**
     * Main page of forum.
     *
     * @param model - attribute for all topics.
     * @return - index page.
     */
    @GetMapping({"/", "/index"})
    public String testPage(Model model) {
        List<Topic> listTopic = topicStore.findAll();
        model.addAttribute("posts", listTopic);
        return "index";
    }
}