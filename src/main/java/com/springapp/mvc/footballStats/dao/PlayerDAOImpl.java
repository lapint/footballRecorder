package com.springapp.mvc.footballStats.dao;


import com.springapp.mvc.footballStats.model.Player;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PlayerDAOImpl implements PlayerDAO{

    @Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void addPlayer(Player player) {
		getCurrentSession().save(player);
	}

	public void updatePlayer(Player player) {
		Player playerToUpdate = getPlayer(player.getId());
		playerToUpdate.setName(player.getName());
		playerToUpdate.setPlatoon(player.getPlatoon());
		playerToUpdate.setPosition(player.getPosition());
		playerToUpdate.setYear(player.getYear());
		getCurrentSession().update(playerToUpdate);
	}

	public Player getPlayer(int id) {
		Player player = (Player) getCurrentSession().get(Player.class, id);
		return player;
	}

	public void deletePlayer(int id) {
		Player player = getPlayer(id);
		if(player != null)
			getCurrentSession().delete(player);
	}

	@SuppressWarnings("unchecked")
	public List<Player> getPlayers() {
		ArrayList<Player> players = (ArrayList<Player>) getCurrentSession().createQuery("from Player").list();
		return players;
	}

}
