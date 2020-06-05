package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.model.User;
import ru.makarov.service.UserService;

/**
 * Controller for registration form of users.
 */
@Controller
public class RegistrationController {
    /**
     * Bean of data base users.
     */
    private UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
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
        model.addAttribute("listUser", userService.getAll());
        return "registration";
    }

    /**
     * Post method to send new data of new user.
     *
     * @param user - data from form due User.
     * @return - registration page and add new user to Data.
     */

    @PostMapping("/registration")
    public String addUser(@ModelAttribute("user") User user) {
        userService.addUser(user);
        return "redirect:/registration";
    }
}
