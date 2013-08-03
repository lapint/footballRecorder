package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.model.PlayerStat;
import com.springapp.mvc.footballStats.service.PlayerService;
import com.springapp.mvc.footballStats.service.PlayerStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value="/players")
public class PlayerController {

    @Autowired
	private PlayerService playerService;

    @Autowired
    private PlayerStatsService playerStatsService;

	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addPlayerPage(){

		ModelAndView modelAndView = new ModelAndView("add_player_form");
        List<Player> players = playerService.getPlayers();

		modelAndView.addObject("player", new Player());
        modelAndView.addObject("players", players);
		return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addingPlayer(@ModelAttribute Player player, Principal principal){
        final String currentUser = principal.getName();
        player.setUser_Id(currentUser);
		ModelAndView modelAndView = new ModelAndView("add_player_form");
		playerService.addPlayer(player);
        PlayerStat playerStat = new PlayerStat();
        playerStat.setName(player.getName());
        playerStat.setUser_Id(currentUser);
        playerStat.setPlayer_Id(player.getId());
        playerStat.setCarries(0);
        playerStat.setTDs(0);
        playerStat.setComps(0);
        playerStat.setFGs(0);
        playerStat.setForcedFumbles(0);
        playerStat.setFumbles(0);
        playerStat.setInts(0);
        playerStat.setPassYds(0);
        playerStat.setRushYds(0);
        playerStat.setRecYds(0);
        playerStat.setRecs(0);
        playerStat.setSacks(0);
        playerStat.setXPs(0);
        playerStat.setTackles(0);
        Date date = new Date();

        playerStat.setDate(date.toString());
        playerStatsService.addPlayer(playerStat);
        List<Player> players = playerService.getPlayers();
        modelAndView.addObject("player", new Player());
        modelAndView.addObject("players", players);
		String message = "Player was successfully added.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/list")  
    public ModelAndView listOfPlayers() {  
        ModelAndView modelAndView = new ModelAndView("list-of-players");  
          
        List<Player> players = playerService.getPlayers();  
        modelAndView.addObject("players", players);  
          
        return modelAndView;  
    }
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)  
    public ModelAndView editPlayerPage(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("edit-player-form");  
        Player player = playerService.getPlayer(id);  
        modelAndView.addObject("player",player);  
        return modelAndView;  
    }  
      
    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)  
    public ModelAndView editingPlayer(@ModelAttribute Player player, @PathVariable Integer id) {  
          
        ModelAndView modelAndView = new ModelAndView("login");
          
        playerService.updatePlayer(player);  
          
        String message = "player was successfully edited.";  
        modelAndView.addObject("message", message);  
          
        return modelAndView;  
    }  
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)  
    public ModelAndView deleteplayer(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("add_player_form");
        playerService.deletePlayer(id);
        List<Player> players = playerService.getPlayers();
        modelAndView.addObject("player", new Player());
        modelAndView.addObject("players", players);
        String message = "player was successfully deleted.";  
        modelAndView.addObject("message", message);  
        return modelAndView;  
    } 
}
