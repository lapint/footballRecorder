package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.Game;
import com.springapp.mvc.footballStats.model.Play;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/5/13
 * Time: 11:15 AM
 * To change this template use File | Settings | File Templates.
 */
public interface GameDAO {
    public void addGame(Game game);
    public List<Game> getGames();
    public Game getGame(Integer id);
    public void deleteGame(Integer id);
}
