package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.makarov.model.Topic;
import ru.makarov.model.User;
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

    /**
     * Main page of forum.
     *
     * @param model - attribute for all topics.
     * @return - index page.
     */
    @GetMapping({"/", "/index"})
    public String testPage(Model model) {
        User user = (User) org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        List<Topic> listTopic = topicStore.findAll();
        model.addAttribute("posts", listTopic);
        model.addAttribute("online", user);
        return "index";
    }
}