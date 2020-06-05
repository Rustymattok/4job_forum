package ru.makarov.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.makarov.model.Comments;
import ru.makarov.model.Post;
import ru.makarov.service.PostService;

/**
 * Controller for work with main page.
 */
@Controller
public class IndexControl {
    /**
     * Bean for Data Base messageStore.
     */
    private final PostService messageStore;

    public IndexControl(PostService posts) {
        this.messageStore = posts;
    }

    /**
     * Take info for present main  page.
     *
     * @param model - add data of all messageStore.
     * @return - page with data.
     */

    @GetMapping({"/", "/index"})
    public String index(Model model) {
        model.addAttribute("posts", messageStore.getAll());
        return "index";
    }

    /**
     * Get edit page by id.
     *
     * @param id    - id post.
     * @param model - created new post in forum.
     * @return - edit page of post with param.
     */

    @GetMapping("/index/{id}")
    public String postEdit(@PathVariable int id, Model model) {
        Post post = messageStore.getPostById(id);
        model.addAttribute("post", post);
        model.addAttribute("comments", new Comments());
        return "topic";
    }

    @PostMapping("/topic")
    public String postEdit(@ModelAttribute Comments comments) {
        messageStore.getPostById(comments.getId()).addComments(comments);
        String redirectUrl = "/index/" + comments.getId();
        return "redirect:" + redirectUrl;
    }

}