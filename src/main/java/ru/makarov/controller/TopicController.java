package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.service.CommentService;
import ru.makarov.service.TopicStore;
import ru.makarov.service.UserStore;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;
import java.util.List;

/**
 * Controller for work with topics.
 * Present topic page.
 * Add comments for topic.
 * Present and create new topic.
 */
@Controller
public class TopicController {
    private final UserStore userStore;
    private final TopicStore topicStore;
    private final CommentService commentService;

    /**
     * @param userStore      - data base of users.
     * @param topicStore     - data base of topics.
     * @param commentService - data base of comments.
     */
    @Autowired
    public TopicController(UserStore userStore, TopicStore topicStore, CommentService commentService) {
        this.userStore = userStore;
        this.topicStore = topicStore;
        this.commentService = commentService;
    }

    /**
     * Present create form page.
     *
     * @param model - create Topic object for father POST method work.
     * @return - page for create topic.
     */
    @GetMapping("/newtopic")
    public String topicForm(Model model) {
        model.addAttribute("topic", new Topic());
        return "newtopic";
    }

    /**
     * Present topic by link in main page. Link url include /id of topic.
     *
     * @param id    - topic id and url /value id.
     * @param model - inject: topic by id, create object Comments for POST method,all comments due topic.
     * @return - topic single page.
     */
    @GetMapping("/singletopic/{id}")
    public String commentForm(@PathVariable int id, Model model) {
        Topic post = topicStore.findAllById((long) id);
        List<Comments> listComments = new LinkedList<Comments>();
        listComments = commentService.findAllByTopic(post);
        model.addAttribute("topic", post);
        model.addAttribute("comment", new Comments());
        model.addAttribute("comments", listComments);
        return "singletopic";
    }

    /**
     * Post method for work with create new comment.
     *
     * @param comment      - object with text of comment only, other elements null.
     * @param currentTopic - current topic.
     * @return - page of current topic, connect new comment to all comments.
     */
    //todo add user instead of 1L during connect security + roles.
    @PostMapping("/singletopic")
    public String commentPost(@ModelAttribute("comment") Comments comment,
                              @ModelAttribute("topic") Topic currentTopic) {
        Topic topic = topicStore.findAllById(currentTopic.getId());
        comment.setTopic(topic);
        comment.setAuthor(userStore.findById(1L));
        commentService.addComments(comment);
        String redirectUrl = "/singletopic/" + topic.getId();
        return "redirect:" + redirectUrl;
    }

    /**
     * Post method for create new Topic.
     *
     * @param topic - new Topic.
     * @return - new Topic add to data base, common page.
     */
    //todo add user instead of 1L during connect security + roles.
    @PostMapping("/newtopic")
    public String createTopic(@ModelAttribute("topic") Topic topic) {
        Calendar currentTime = new GregorianCalendar();
        topic.setCreated(currentTime);
        topic.setAuthor(userStore.findById(1L));
        topicStore.save(topic);
        return "redirect:/index";
    }

}
