package ru.makarov.controller;

import org.springframework.stereotype.Controller;

/**
 * Controller for registration form of users.
 */
//todo realize reg form during injection security + roles.
@Controller
public class RegistrationController {
//    /**
//     * Bean of data base users.
//     */
//    private UserService userService;
//
//    @Autowired
//    public RegistrationController(UserService userService) {
//        this.userService = userService;
//    }
//
//    /**
//     * Get registration form for filling.
//     *
//     * @param model - to show all users in system.
//     * @return - registration page with data users.
//     */
//    @GetMapping("/registration")
//    public String regForm(Model model) {
//        model.addAttribute("user", new User());
//        model.addAttribute("listUser", userService.getAll());
//        return "registration";
//    }
//
//    /**
//     * Topic method to send new data of new user.
//     *
//     * @param user - data from form due User.
//     * @return - registration page and save new user to Data.
//     */
//
//    @PostMapping("/registration")
//    public String addUser(@ModelAttribute("user") User user) {
//        userService.addUser(user);
//        return "redirect:/registration";
//    }
}
