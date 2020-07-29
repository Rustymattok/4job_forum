package ru.makarov.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import ru.makarov.SpringWebApplication;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = SpringWebApplication.class)
@AutoConfigureMockMvc
public class AdminControllerTest {
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
        this.mockMvc.perform(get("/admin"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("http://localhost/login"));
    }

    /**
     * If Logined user have role Admin allow to open admin page.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithMockUser(username = "Rustymattok", roles = {"USER", "ADMIN"})
    public void shouldOkPage() throws Exception {
        this.mockMvc.perform(get("/admin"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("admin"));
    }

    /**
     * If user have role Admin allow to open admin page for edit choose user.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithMockUser(username = "Rustymattok", roles = {"USER", "ADMIN"})
    public void shouldOkPageByChoosedUser() throws Exception {
        this.mockMvc.perform(get("/admin/userform/1"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("userform"));
    }

    /**
     * If user have role Admin allow to open admin page for see all comments of user.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithMockUser(username = "Rustymattok", roles = {"USER", "ADMIN"})
    public void shouldOkPageByChoosedUserComments() throws Exception {
        this.mockMvc.perform(get("/usercomments/1"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("usercomments"));
    }
}
