package ru.makarov.controller;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.test.web.servlet.MockMvc;
import ru.makarov.SpringWebApplication;
import ru.makarov.dao.UserServiceCrud;
import ru.makarov.model.Role;
import ru.makarov.model.User;

import java.util.LinkedHashSet;
import java.util.Set;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = SpringWebApplication.class)
@AutoConfigureMockMvc
public class RegistrationControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private UserServiceCrud users;


    /**
     * If User not login allow registration page.
     *
     * @throws Exception - in case if Except is not the same.
     */
    @Test
    @WithAnonymousUser
    public void shouldReDirectToLogin() throws Exception {
        this.mockMvc.perform(get("/registration"))
                .andDo(print())
                .andExpect(status().isOk());
    }

    /**
     * If put data to POST form save elements - work correct.
     *
     * @throws Exception - in case if Except status is not the same
     *                   - in case if Except firstName user is not the same
     *                   - in case if Except lastName user is not the same
     *                   - in case if Except username user is not the same
     *                   - in case if Except email user is not the same
     *                   - in case if Except password user is not the same
     *                   - in case if Except Role user is not the same (default USER role)
     */
    @Test
    @WithAnonymousUser
    public void shouldAddNewUser() throws Exception {
        String TOKEN_ATTR_NAME = "org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN";
        HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository = new HttpSessionCsrfTokenRepository();
        CsrfToken csrfToken = httpSessionCsrfTokenRepository.generateToken(new MockHttpServletRequest());
        this.mockMvc.perform(
                post("/registration")
                        .sessionAttr(TOKEN_ATTR_NAME, csrfToken)
                        .param(csrfToken.getParameterName(), csrfToken.getToken())
                        .param("firstName", "Vova")
                        .param("lastName", "Vova")
                        .param("username", "Vova")
                        .param("email", "Vova")
                        .param("password", "Vova"))
                .andDo(print())
                .andExpect(status().is3xxRedirection());
        Set<Role> roles = new LinkedHashSet<>();
        roles.add(Role.USER);
        ArgumentCaptor<User> argument = ArgumentCaptor.forClass(User.class);
        verify(users).save(argument.capture());
        assertThat(argument.getValue().getUsername(), is("Vova"));
        assertThat(argument.getValue().getFirstName(), is("Vova"));
        assertThat(argument.getValue().getLastName(), is("Vova"));
        assertThat(argument.getValue().getEmail(), is("Vova"));
        assertThat(argument.getValue().getPassword(), is("Vova"));
        assertThat(argument.getValue().getRoles(), is(roles));
    }
}
