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

@Controller
public class EditController {
    private PostService postService;
    @Autowired
    public EditController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/edit")
    public String postForm(Model model){
        model.addAttribute("posts",postService.getAll());
        model.addAttribute("newPost", new Post());
        return "edit";
    }

    @GetMapping ("/editPost/{id}")
    public String postEdit(@PathVariable int id, Model model){
        Post post = postService.getPostById(id);
        model.addAttribute("post", post);
        return "editPost";
    }

    @PostMapping("/editPost")
    public String postEdit(@ModelAttribute Post post){
        Post postNew = postService.getPostById(post.getId());
        postService.getAll().remove(post.getId());
        postNew.setName(post.getName());
        postNew.setDesc(post.getDesc());
        postService.addPost(postNew);
        return "redirect:/edit";
    }

    @PostMapping("/edit")
    public String createPost(@ModelAttribute("newPost") Post post){
        postService.addPost(post);
        return "redirect:/edit";
    }
}
