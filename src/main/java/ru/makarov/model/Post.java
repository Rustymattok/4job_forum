package ru.makarov.model;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import java.util.Calendar;
@Data
@RequiredArgsConstructor
public class Post {
    private int id;
    private String name;
    private String desc;
    private Calendar created;

    public static Post of(String name) {
        Post post = new Post();
        post.name = name;
        return post;
    }
}