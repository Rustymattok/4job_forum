package ru.makarov.controller;

import org.springframework.stereotype.Controller;

/**
 * Controller for work with edit page.
 */
@Controller
//todo realize for roles + security.
public class EditController {
//    /**
//     * Parameter for data posts bean.
//     */
//    private PostService messageStore;
//
//    /**
//     * @param postService - Bean postService.
//     */
//    @Autowired
//    public EditController(PostService postService) {
//        this.messageStore = postService;
//    }
//
//    /**
//     * Get common edit page.
//     *
//     * @param model - include data of all posts.
//     *              - include data of new created topic.
//     * @return - link to edin.jsp.
//     */
//    @GetMapping("/edit")
//    public String postForm(Model model) {
//        model.addAttribute("posts", messageStore.getAll());
//        model.addAttribute("newPost", new Topic());
//        return "edit";
//    }
//
//    /**
//     * Get edit page by id.
//     *
//     * @param id    - id topic.
//     * @param model - created new topic in forum.
//     * @return - edit page of topic with param.
//     */
//
//    @GetMapping("/editPost/{id}")
//    public String postEdit(@PathVariable int id, Model model) {
//        Topic topic = messageStore.getPostById(id);
//        model.addAttribute("topic", topic);
//        return "editPost";
//    }
//
//    /**
//     * Took info from edit.jsp page - topic update.
//     *
//     * @param topic - model of edit info.
//     * @return - data in form.
//     */
//
//    @PostMapping("/editPost")
//    public String postEdit(@ModelAttribute Topic topic) {
//        Topic postNew = messageStore.getPostById(topic.getId());
//        messageStore.getAll().remove(topic.getId());
//        postNew.setName(topic.getName());
//        postNew.setContent(topic.getContent());
//        messageStore.addPost(postNew);
//        return "redirect:/edit";
//    }
//
//    /**
//     * Method from edit.jsp page - new topic.
//     *
//     * @param topic - model of new topic.
//     * @return - data of new topic.
//     */
//
//    @PostMapping("/edit")
//    public String createPost(@ModelAttribute("newPost") Topic topic) {
//        messageStore.addPost(topic);
//        return "redirect:/edit";
//    }
}
