package com.springapp.mvc.footballStats.service;


import com.springapp.mvc.footballStats.dao.PlayResultDAO;
import com.springapp.mvc.footballStats.dao.RegisterDAO;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.User;
import com.springapp.mvc.footballStats.model.UserRole;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class RegisterServiceImpl implements RegisterService{


    @Autowired
    private RegisterDAO registerDAO;

    public void addUser(User user) {
        registerDAO.addUser(user);
    }

    public void addUserRole(UserRole userRole) {
        registerDAO.addUserRole(userRole);
    }
}
