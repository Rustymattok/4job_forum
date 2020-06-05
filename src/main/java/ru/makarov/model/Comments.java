package ru.makarov.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * Model for comments.
 */
@Data
@RequiredArgsConstructor
public class Comments {
    private int id;
    private String name;
}
