package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.PlayerStat;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/4/13
 * Time: 2:10 AM
 * To change this template use File | Settings | File Templates.
 */
public interface PlayerStatDAO {
    public List<PlayerStat> getPlayerStats();
    public PlayerStat updatePlayer(int player_id, PlayResult playResult);
    public void addPlayer(PlayerStat playerStat);
}
