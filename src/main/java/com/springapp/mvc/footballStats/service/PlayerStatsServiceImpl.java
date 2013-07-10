package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.dao.PlayerDAO;
import com.springapp.mvc.footballStats.dao.PlayerStatDAO;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.model.PlayerStat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PlayerStatsServiceImpl implements PlayerStatsService{

	@Autowired
	private PlayerStatDAO playerStatDAO;

    @Override
    public List<PlayerStat> getPlayerStats() {
        return playerStatDAO.getPlayerStats();
    }

    @Override
    public void updatePlayer(int player_id, PlayResult playResult){
        playerStatDAO.updatePlayer(player_id);
    }
}
