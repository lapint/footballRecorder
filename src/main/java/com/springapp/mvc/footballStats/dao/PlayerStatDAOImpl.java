package com.springapp.mvc.footballStats.dao;


import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.model.PlayerStat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PlayerStatDAOImpl implements PlayerStatDAO{

    @Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	public List<PlayerStat> getPlayerStats() {
        String user = SecurityContextHolder.getContext().getAuthentication().getName();

        List<PlayerStat> playerStats = (List<PlayerStat>) getCurrentSession().createQuery("from PlayerStat ps where ps.User_Id ='" + user+"'").list();
		return playerStats;
	}

    @Override
    public void updatePlayer(int player_id) {
        getCurrentSession().createQuery("from PlayerStat ps where ps.User_Id="+player_id);
    }

}
