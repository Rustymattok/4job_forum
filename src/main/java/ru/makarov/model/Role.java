package ru.makarov.model;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN, MODERATOR, BLACK;

    @Override
    public String getAuthority() {
        return name();
    }
}
