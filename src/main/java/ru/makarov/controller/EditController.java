package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.model.Post;
import ru.makarov.service.PostService;

/**
 * Controller for work with edit page.
 */
@Controller
public class EditController {
    /**
     * Parameter for data posts bean.
     */
    private PostService messageStore;

    /**
     * @param postService - Bean postService.
     */
    @Autowired
    public EditController(PostService postService) {
        this.messageStore = postService;
    }

    /**
     * Get common edit page.
     *
     * @param model - include data of all posts.
     *              - include data of new created post.
     * @return - link to edin.jsp.
     */
    @GetMapping("/edit")
    public String postForm(Model model) {
        model.addAttribute("posts", messageStore.getAll());
        model.addAttribute("newPost", new Post());
        return "edit";
    }

    /**
     * Get edit page by id.
     *
     * @param id    - id post.
     * @param model - created new post in forum.
     * @return - edit page of post with param.
     */

    @GetMapping("/editPost/{id}")
    public String postEdit(@PathVariable int id, Model model) {
        Post post = messageStore.getPostById(id);
        model.addAttribute("post", post);
        return "editPost";
    }

    /**
     * Took info from edit.jsp page - post update.
     *
     * @param post - model of edit info.
     * @return - data in form.
     */

    @PostMapping("/editPost")
    public String postEdit(@ModelAttribute Post post) {
        Post postNew = messageStore.getPostById(post.getId());
        messageStore.getAll().remove(post.getId());
        postNew.setName(post.getName());
        postNew.setDesc(post.getDesc());
        messageStore.addPost(postNew);
        return "redirect:/edit";
    }

    /**
     * Method from edit.jsp page - new post.
     *
     * @param post - model of new post.
     * @return - data of new post.
     */

    @PostMapping("/edit")
    public String createPost(@ModelAttribute("newPost") Post post) {
        messageStore.addPost(post);
        return "redirect:/edit";
    }
}
