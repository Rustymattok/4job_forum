package ru.makarov.controller;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.test.web.servlet.MockMvc;
import ru.makarov.SpringWebApplication;
import ru.makarov.dao.CommentServiceCrud;
import ru.makarov.model.Comments;
import ru.makarov.model.Topic;
import ru.makarov.service.CommentService;
import ru.makarov.service.TopicService;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = SpringWebApplication.class)
@AutoConfigureMockMvc
public class TopicControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private TopicService topics;

    @MockBean
    private CommentServiceCrud comments;

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
    @WithMockUser("Rustymattok")
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
    @WithMockUser("Rustymattok")
    public void shouldOkPageByChoosedUser() throws Exception {
        this.mockMvc.perform(get("/singletopic/1"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("singletopic"));
    }

    /**
     * If put data to POST form save elements - work correct.
     *
     * @throws Exception - in case if Except status is not the same
     *                   - in case if Except name topic is not the same
     *                   - in case if Except content topic is not the same
     *                   - in case if Except session user name is not the same
     */
    @Test
    @WithMockUser("Rustymattok")
    public void shouldReturnNewTopic() throws Exception {
        String TOKEN_ATTR_NAME = "org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN";
        HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository = new HttpSessionCsrfTokenRepository();
        CsrfToken csrfToken = httpSessionCsrfTokenRepository.generateToken(new MockHttpServletRequest());
        this.mockMvc.perform(
                post("/newtopic")
                        .sessionAttr(TOKEN_ATTR_NAME, csrfToken)
                        .param(csrfToken.getParameterName(), csrfToken.getToken())
                        .param("name", "privet3")
                        .param("content", "smth"))
                .andDo(print())
                .andExpect(status().is3xxRedirection());
        ArgumentCaptor<Topic> argument = ArgumentCaptor.forClass(Topic.class);
        verify(topics).save(argument.capture());
        assertThat(argument.getValue().getName(), is("privet3"));
        assertThat(argument.getValue().getContent(), is("smth"));
        assertThat(argument.getValue().getAuthor().getUsername(), is("Rustymattok"));
    }

    /**
     * If put data to POST form add comments - work correct.
     *
     * @throws Exception - in case if Except status is not the same
     *                   - in case if Except content comment is not the same
     *                   - in case if Except id topic is not the same
     *                   - in case if Except session user name is not the same
     */
    @Test
    @WithMockUser("Rustymattok")
    public void shouldReturnNewComment() throws Exception {
        String TOKEN_ATTR_NAME = "org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN";
        HttpSessionCsrfTokenRepository httpSessionCsrfTokenRepository = new HttpSessionCsrfTokenRepository();
        CsrfToken csrfToken = httpSessionCsrfTokenRepository.generateToken(new MockHttpServletRequest());
        this.mockMvc.perform(
                post("/singletopic/1")
                        .sessionAttr(TOKEN_ATTR_NAME, csrfToken)
                        .param(csrfToken.getParameterName(), csrfToken.getToken())
                        .param("text", "spring boot help"))
                .andDo(print())
                .andExpect(status().is3xxRedirection());
        ArgumentCaptor<Comments> argument = ArgumentCaptor.forClass(Comments.class);
        verify(comments).save(argument.capture());
        assertThat(argument.getValue().getText(), is("spring boot help"));
        assertThat(argument.getValue().getAuthor().getUsername(), is("Rustymattok"));
    }
}
