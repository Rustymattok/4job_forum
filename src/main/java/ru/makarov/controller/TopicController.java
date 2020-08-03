package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.dao.CommentServiceCrud;
import ru.makarov.dao.UserServiceCrud;
import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.model.User;
import ru.makarov.service.CommentService;
import ru.makarov.service.TopicStore;

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
    private final UserServiceCrud userStore;
    private final TopicStore topicStore;
    private final CommentServiceCrud commentService;

    /**
     * @param userStore      - data base of users.
     * @param topicStore     - data base of topics.
     * @param commentService - data base of comments.
     */
    @Autowired
    public TopicController(UserServiceCrud userStore, TopicStore topicStore, CommentServiceCrud commentService) {
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
    @PostMapping("/singletopic/{id}")
    public String commentPost(@PathVariable int id, @ModelAttribute("comment") Comments comment, @ModelAttribute("topic") Topic currentTopic) {
        Topic topic = topicStore.findAllById(currentTopic.getId());
        Comments newComment = new Comments();
        newComment.setTopic(topic);
//        User user = (User) org.springframework.security.core.context.SecurityContextHolder
//                .getContext().getAuthentication().getPrincipal();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userStore.findUserByUsername(auth.getName());
        newComment.setAuthor(userStore.findUserByUsername(user.getUsername()));
        newComment.setText(comment.getText());
        commentService.save(newComment);
        String redirectUrl = "/singletopic/" + id;
        return "redirect:" + redirectUrl;
    }

    /**
     * Post method for create new Topic.
     *
     * @param topic - new Topic.
     * @return - new Topic add to data base, common page.
     */
    @PostMapping("/newtopic")
    public String createTopic(@ModelAttribute("topic") Topic topic) {
        Calendar currentTime = new GregorianCalendar();
        topic.setCreated(currentTime);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userStore.findUserByUsername(auth.getName());
        topic.setAuthor(userStore.findUserById(user.getId()));
        topicStore.save(topic);
        return "redirect:/index";
    }

}
