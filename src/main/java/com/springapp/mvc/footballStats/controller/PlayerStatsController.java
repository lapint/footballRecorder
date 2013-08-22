package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.model.PlayerStat;
import com.springapp.mvc.footballStats.service.GameService;
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
import java.util.List;

@Controller
@RequestMapping(value="/playerStats")
public class PlayerStatsController {

    @Autowired
	private PlayerStatsService playerStatsService;
	@Autowired
    private GameService gameService;
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView addplayPage(Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
		ModelAndView modelAndView = new ModelAndView("playerStats");
        List<PlayerStat> playerStats =  playerStatsService.getPlayerStats();
        modelAndView.addObject("playerStats", playerStats);

        return modelAndView;
	}
	


}
