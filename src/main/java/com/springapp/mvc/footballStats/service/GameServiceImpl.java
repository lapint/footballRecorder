package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.dao.GameDAO;
import com.springapp.mvc.footballStats.model.Game;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/5/13
 * Time: 11:11 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional
public class GameServiceImpl implements  GameService {

    @Autowired
    GameDAO gameDAO;

    @Override
    public void addGame(Game game) {
        gameDAO.addGame(game);
    }

    @Override
    public List<Game> getGames() {
        return gameDAO.getGames();
    }

    @Override
    public Game getGame(Integer id) {
        return gameDAO.getGame(id);
    }

    @Override
    public void deleteGame(Integer id) {
        gameDAO.deleteGame(id);
    }
}
