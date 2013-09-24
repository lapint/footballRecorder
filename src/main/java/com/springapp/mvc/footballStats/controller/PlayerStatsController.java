package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Game;
import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.PlayerStat;
import com.springapp.mvc.footballStats.service.GameService;
import com.springapp.mvc.footballStats.service.PlayResultService;
import com.springapp.mvc.footballStats.service.PlaybookService;
import com.springapp.mvc.footballStats.service.PlayerStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.*;

@Controller
@RequestMapping(value="/playerStats")
public class PlayerStatsController {

    @Autowired
	private PlayerStatsService playerStatsService;
	@Autowired
    private GameService gameService;
    @Autowired
    private PlayResultService playResultService;

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView getPlayersStats(Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
		ModelAndView modelAndView = new ModelAndView("playerStats");
        List<PlayerStat> playerStats =  playerStatsService.getPlayerStats();
        modelAndView.addObject("playerStats", playerStats);

        return modelAndView;
	}

    @RequestMapping(value="list/{id}", method=RequestMethod.GET)
    public ModelAndView getPlayerStats(@PathVariable Integer id,Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }

        ModelAndView modelAndView = new ModelAndView("individualStats");
        HashMap<Integer, List<PlayResult>> playResultsByGame = new HashMap<Integer, List<PlayResult>>();
        List<PlayResult> playResults = playResultService.getAllPlayResults();
        for(int i = 0; i < playResults.size(); i++){
            if(playResults.get(i).getCarrier_Id() == id){
                PlayResult play = playResults.get(i);
                if(playResultsByGame.get(play.getGame_Id())==null){
                    playResultsByGame.put(play.getGame_Id(), new ArrayList<PlayResult>());
                }
                List<PlayResult> toAdd = playResultsByGame.get(play.getGame_Id());
                toAdd.add(playResults.get(i));
                playResultsByGame.put(play.getGame_Id(), toAdd);
            }
        }

        Set<Integer> keys = playResultsByGame.keySet();
        List<PlayerStat> statsByGame = new ArrayList<PlayerStat>();
        Iterator<Integer> iter = keys.iterator();
        while(iter.hasNext()){
            Integer key = iter.next();
            List<PlayResult> gameResults = playResultsByGame.get(key);
            PlayerStat playerStat = new PlayerStat();
            for(int j = 0; j<gameResults.size(); j++){
                PlayResult playResult = gameResults.get(j);
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
            }
            statsByGame.add(playerStat);
            //modelAndView.addObject("playerStats", playerStats);
        }
        Collections.sort(statsByGame);

        modelAndView.addObject("statsByGame", statsByGame);
        //List<PlayerStat> playerStats =  playerStatsService.getPlayerStats();

        return modelAndView;
    }
}
