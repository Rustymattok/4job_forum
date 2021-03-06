package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.makarov.dao.UserServiceCrud;
import ru.makarov.model.Comments;
import ru.makarov.model.Role;
import ru.makarov.model.Topic;
import ru.makarov.model.User;
import ru.makarov.service.CommentsStore;
import ru.makarov.service.TopicStore;

import java.util.*;

@Controller
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {
    private final UserServiceCrud userServiceCrud;
    private final TopicStore topicStore;
    private final CommentsStore commentsStore;

    @Autowired
    public AdminController(UserServiceCrud userServiceCrud, TopicStore topicStore, CommentsStore commentsStore) {
        this.userServiceCrud = userServiceCrud;
        this.topicStore = topicStore;
        this.commentsStore = commentsStore;
    }

    /**
     * Method for review list oa users.
     *
     * @param model - to jsp page.Online - user in system; users - list of all users; roles - all possible roles.
     * @return - page /admin.
     */
    @GetMapping("/admin")
    public String adminPanel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userServiceCrud.findUserByUsername(auth.getName());
        List<User> userList = userServiceCrud.findAll();
        model.addAttribute("request", "");
        model.addAttribute("online", user);
        model.addAttribute("users", userList);
        model.addAttribute("roles", Role.values());
        return "admin";
    }

    /**
     * Method for open user's topics page.
     *
     * @param id    - user chose.
     * @param model - to jsp page. Usertopic - list of all user's topic.
     * @return - page usertopics.
     */
    @PreAuthorize("hasAnyRole('USER','ADMIN')")
    @GetMapping("/usertopics/{id}")
    public String allTopic(@PathVariable int id, Model model) {
        List<Topic> topicList = topicStore.findAllByAuthor(userServiceCrud.findUserById((long) id));
        model.addAttribute("userTopic", topicList);
        return "usertopics";
    }

    /**
     * Method for open user's comments.
     *
     * @param id    - use choose.
     * @param model - to jsp page. comments - list of comments.
     * @return - page comments.
     */
    @GetMapping("/usercomments/{id}")
    public String allComments(@PathVariable int id, Model model) {
        List<Comments> commentsList = commentsStore.findAllByAuthor(userServiceCrud.findUserById((long) id));
        model.addAttribute("comments", commentsList);
        return "usercomments";
    }

    /**
     * Method for open user's data.
     *
     * @param id    - user choose.
     * @param model - to jsp page. rolesList - type of all roles; user - data for new User.
     * @return - page user form update.
     */
    @GetMapping("/admin/userform/{id}")
    public String adminPanelTest(@PathVariable int id, Model model) {
        User user = userServiceCrud.findUserById((long) id);
        User userForm = new User();
        Set<Role> roles = user.getRoles();
        userForm.setUsername(user.getUsername());
        userForm.setRoles(roles);
        userForm.setId(user.getId());
        userForm.setFirstName(user.getFirstName());
        userForm.setLastName(user.getLastName());
        userForm.setEmail(user.getEmail());
        userForm.setPassword(user.getPassword());
        model.addAttribute("rolesList", Role.values());
        model.addAttribute("user", userForm);
        return "userform";
    }

    /**
     * Method for update user data.
     *
     * @param user - wich was took from data.
     * @return - admin page.
     */
    @PostMapping("/admin/userform/{id}")
    public String userSaveRoles(
            @PathVariable int id,
            @ModelAttribute("user") User user) {
        User userEdit = userServiceCrud.findUserById((long) id);
        userEdit.getRoles().clear();
        userEdit.setRoles(user.getRoles());
        userEdit.setFirstName(user.getFirstName());
        userEdit.setLastName(user.getLastName());
        userEdit.setPassword(user.getPassword());
        userEdit.setEmail(user.getEmail());
        userEdit.setUsername(user.getUsername());
        userServiceCrud.save(userEdit);
        return "redirect:/admin";
    }

}
