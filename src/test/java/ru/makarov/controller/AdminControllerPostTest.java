package ru.makarov.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.test.web.servlet.MockMvc;
import ru.makarov.SpringWebApplication;
import ru.makarov.model.User;

import java.util.LinkedList;
import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = SpringWebApplication.class)
@AutoConfigureMockMvc
public class AdminControllerPostTest {
    @Autowired
    private MockMvc mockMvc;

    /**
     * If put data to POST form update elements - work correct.
     *
     * @throws Exception - in case if Except status is not the same.
     *
     */
    @Test
    @WithUserDetails("Rustymattok")
    public void shouldReturnNewTopic() throws Exception {
        String TOKEN_ATTR_NAME = "org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN";
        HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository = new HttpSessionCsrfTokenRepository();
        CsrfToken csrfToken = httpSessionCsrfTokenRepository.generateToken(new MockHttpServletRequest());
        List<User> list = new LinkedList<>();
        this.mockMvc.perform(
                post("/admin/userform/1")
                        .sessionAttr(TOKEN_ATTR_NAME, csrfToken)
                        .param(csrfToken.getParameterName(), csrfToken.getToken())
                        .param("firstName", "Aksana")
                        .param("lastName", "Makarova")
                        .param("password", "12345")
                        .param("email", "mrArxi@gmail.com")
                        .param("username", "Aksana"))
                .andDo(print())
                .andExpect(status().is3xxRedirection());
    }
}
