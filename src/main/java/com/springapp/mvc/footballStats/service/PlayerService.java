package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.model.Player;

import java.util.List;

public interface PlayerService {
	
	public void addPlayer(Player player);
	public void updatePlayer(Player player);
	public Player getPlayer(int id);
	public void deletePlayer(int id);
	public List<Player> getPlayers();
}
