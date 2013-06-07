package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.Player;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface PlayerDAO {
	
	public void addPlayer(Player player);
	public void updatePlayer(Player player);
	public Player getPlayer(int id);
	public void deletePlayer(int id);
	public List<Player> getPlayers();
	
}
