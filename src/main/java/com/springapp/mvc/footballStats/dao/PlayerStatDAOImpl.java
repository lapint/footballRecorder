package com.springapp.mvc.footballStats.dao;


import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.model.PlayerStat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
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
    public PlayerStat updatePlayer(int player_id, PlayResult playResult) {
        List<PlayerStat> playerStats = getCurrentSession().createQuery("from PlayerStat ps where ps.Player_Id="+player_id).list();
        PlayerStat playerStat;
        if(playerStats.size()>0){
            playerStat = playerStats.get(0);

            if(playResult.getPlay_Type().equals("Pass")){
                if(playerStat.getRecYds()!=null){
                    playerStat.setRecYds(playResult.getYards()+playerStat.getRecYds());
                    playerStat.setRecs(playerStat.getRecs() + 1);
                }else{
                    playerStat.setRecYds(playResult.getYards());
                    playerStat.setRecs(1);
                }
            }
            else if(playResult.getPlay_Type().equals("Run")){
                playerStat.setRecYds(playResult.getYards()+playerStat.getRushYds());
            }
            if(playResult.getResult().equals("TD")){
                if(playerStat.getTDs()!=null)
                playerStat.setTDs(playerStat.getTDs()+1);
                else{
                    playerStat.setTDs(1);
                }
            }
            playerStat.setOpponent(playResult.getOpponent());
            playerStat.setDate(playResult.getDate());
            getCurrentSession().save(playerStat);
        }
        else{
            playerStat = new PlayerStat();
            playerStat.setName(playResult.getCarrier());
            playerStat.setUser_Id(playResult.getUser_Id());
            Date date = new Date();

            playerStat.setDate(date.toString());
            playerStat.setPlayer_Id(playResult.getCarrier_Id());
            if(playResult.getPlay_Type().equals("Pass")){
                if(playerStat.getRecYds()!=null){
                    playerStat.setRecYds(playResult.getYards()+playerStat.getRecYds());
                    playerStat.setRecs(playerStat.getRecs() + 1);
                }else{
                    playerStat.setRecYds(playResult.getYards());
                    playerStat.setRecs(1);
                }
            }
            else if(playResult.getPlay_Type().equals("Run")){
                if(playerStat.getRushYds()!=null){
                    playerStat.setRushYds(playResult.getYards()+playerStat.getRushYds());
                    playerStat.setCarries(playerStat.getCarries() + 1);
                }else{
                    playerStat.setRushYds(playResult.getYards());
                    playerStat.setCarries(1);
                }
            }
            if(playResult.getResult().equals("TD")){
                if(playerStat.getTDs()!=null)
                    playerStat.setTDs(playerStat.getTDs()+1);
                else{
                    playerStat.setTDs(1);
                }
            }
            playerStat.setOpponent(playResult.getOpponent());
            playerStat.setDate(playResult.getDate());
            getCurrentSession().save(playerStat);
        }
//
//  playerStat.setPassYds();
        return playerStat;

    }

    @Override
    public void addPlayer(PlayerStat playerStat) {
        getCurrentSession().save(playerStat);
    }

}
