package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.User;
import com.springapp.mvc.footballStats.model.UserRole;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RegisterDAOImpl implements RegisterDAO{

    @Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}

    @Override
    public void addUser(User user) {
        getCurrentSession().save(user);
    }

    @Override
    public void addUserRole(UserRole userRole) {
        getCurrentSession().save(userRole);
    }
}
