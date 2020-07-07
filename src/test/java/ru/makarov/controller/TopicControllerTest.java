package ru.makarov.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.web.servlet.MockMvc;
import ru.makarov.SpringWebApplication;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = SpringWebApplication.class)
@AutoConfigureMockMvc
public class TopicControllerTest {
    @Autowired
    private MockMvc mockMvc;

    /**
     * If User not login rederect him to login page.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithAnonymousUser
    public void shouldReDirectToLogin() throws Exception {
        this.mockMvc.perform(get("/newtopic"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("http://localhost/login"));
    }

    /**
     * If Logined user can created new topic.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithUserDetails("Rustymattok")
    public void shouldOkPage() throws Exception {
        this.mockMvc.perform(get("/newtopic"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("newtopic"));
    }

    /**
     * If user login can open each topic of user.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithUserDetails("Rustymattok")
    public void shouldOkPageByChoosedUser() throws Exception {
        this.mockMvc.perform(get("/singletopic/1"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("singletopic"));
    }
}
