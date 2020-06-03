package ru.makarov.service;

import org.springframework.stereotype.Service;
import ru.makarov.model.User;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    private  final List<User> listUser = new ArrayList<>();

    public UserService() {
        listUser.add( new User(1L,"pass1","login1","Vladimir1","Makarov1","mrArxi@gmail.com",true));
        listUser.add( new User(2L,"pass2","login2","Vladimir2","Makarov2","mrArxi@gmail.com",true));
        listUser.add( new User(3L,"pass3","login3","Vladimir3","Makarov3","mrArxi@gmail.com",true));
        listUser.add( new User(4L,"pass4","login4","Vladimir4","Makarov4","mrArxi@gmail.com",true));
    }

    public List<User> getAll() {
        return listUser;
    }

    public void addUser(User user) {
       listUser.add(user);
    }
}
