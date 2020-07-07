package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.dao.UserServiceCrud;
import ru.makarov.model.Role;
import ru.makarov.model.User;

import java.util.Collections;

/**
 * Controller for registration form of users.
 */
//todo realize reg form during injection security + roles.
@Controller
public class RegistrationController {
    /**
     * Bean of data base users.
     */
    private UserServiceCrud userServiceCrud;

    @Autowired
    public RegistrationController(UserServiceCrud userService) {
        this.userServiceCrud = userService;
    }

    /**
     * Get registration form for filling.
     *
     * @param model - to show all users in system.
     * @return - registration page with data users.
     */
    @GetMapping("/registration")
    public String regForm(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

    /**
     * Topic method to send new data of new user.
     *
     * @param user - data from form due User.
     * @return - registration page and save new user to Data.
     */
    @PostMapping("/registration")
    public String addUser(@ModelAttribute("user") User user) {
        System.out.println(user.getFirstName());
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userServiceCrud.save(user);
        return "redirect:/login";
    }
}
