package ru.makarov.service;

import org.springframework.stereotype.Service;
import ru.makarov.model.Comments;
import ru.makarov.model.Post;

import java.util.ArrayList;
import java.util.List;

/**
 * Class for simulate Data Base Table posts.
 */
@Service
public class PostService {

    private final List<Post> posts = new ArrayList<>();

    public PostService() {
        posts.add(Post.of("Продаю машину ладу 01."));
    }

    public void addPost(Post post) {
        posts.add(post);
    }

    public List<Post> getAll() {
        return posts;
    }

    public Post getPostById(int id) {
        return posts.get(id);
    }
}