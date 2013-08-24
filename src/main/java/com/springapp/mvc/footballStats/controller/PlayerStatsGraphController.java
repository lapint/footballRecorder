package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.PlayerStat;
import com.springapp.mvc.footballStats.service.GameService;
import com.springapp.mvc.footballStats.service.PlayerStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping(value="/graph")
public class PlayerStatsGraphController {

	@RequestMapping(value="/test", method=RequestMethod.GET)
	public ModelAndView addplayPage(){

		ModelAndView modelAndView = new ModelAndView("graphs");
//        List<PlayerStat> playerStats =  playerStatsService.getPlayerStats();
//        modelAndView.addObject("playerStats", playerStats);

        return modelAndView;
	}
	


}
