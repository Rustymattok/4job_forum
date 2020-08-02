package ru.makarov.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.*;

/**
 * Model of Topic elements.
 */
@Data
@RequiredArgsConstructor
@NoArgsConstructor
@Entity
public class Topic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NonNull
    private String name;
    @NonNull
    private String content;
    @NonNull
    private Calendar created;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
//    @OneToMany(fetch = FetchType.EAGER)
//    @JoinColumn(name = "comments_id")
//    @JoinTable(name = "topic_comments", joinColumns = @JoinColumn(name = "topic_id"), inverseJoinColumns = @JoinColumn(name = "comments_id"))
//    private Set<Comments> comments;
}