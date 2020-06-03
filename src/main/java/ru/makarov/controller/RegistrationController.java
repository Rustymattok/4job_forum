package ru.makarov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.makarov.model.User;
import ru.makarov.service.UserService;

@Controller
public class RegistrationController {
    private UserService userService;
    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("/registration")
    public String regForm(Model model){
        model.addAttribute("user",new User());
        model.addAttribute("listUser",userService.getAll());
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(@ModelAttribute("user") User user){
        userService.addUser(user);
        return "redirect:/registration";
    }
}
