package ru.makarov.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.*;

/**
 * Model of Post elements.
 */
@Data
@RequiredArgsConstructor
public class Post {
    private int id;
    private String name;
    private String desc;
    private Calendar created;
    private List<Comments> comments = new ArrayList<>();

    public static Post of(String name) {
        Post post = new Post();
        post.name = name;
        return post;
    }

    public void addComments(Comments comment) {
        comments.add(comment);
    }
}