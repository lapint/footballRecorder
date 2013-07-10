package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.Game;
import com.springapp.mvc.footballStats.model.Play;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/5/13
 * Time: 11:15 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class GameDAOImpl implements GameDAO {

    @Autowired
    SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addGame(Game game) {
        getCurrentSession().save(game);
    }


    public List<Game> getGames() {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();

        return getCurrentSession().createQuery("from Game g where g.User_Id ='" + user+"'").list();
    }

    public Game getGame(Integer id) {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();

        return (Game) getCurrentSession().createQuery("from Game g where g.User_Id ='" + user+"' AND g.id="+id).list().get(0);
    }
}
