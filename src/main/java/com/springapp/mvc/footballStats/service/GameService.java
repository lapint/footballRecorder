package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.model.Game;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/5/13
 * Time: 11:11 AM
 * To change this template use File | Settings | File Templates.
 */
public interface GameService {
    public void addGame(Game game);
    public List<Game> getGames();
    public Game getGame(Integer id);
}
