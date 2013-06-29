package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.service.PlayResultService;
import com.springapp.mvc.footballStats.service.PlaybookService;
import com.springapp.mvc.footballStats.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value="/playresult")
public class PlayResultController {

    @Autowired
	private PlayResultService playResultService;
    @Autowired
	private PlayerService playerService;
    @Autowired
	private PlaybookService playbookService;

	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addplayPage(){
		List<Player> players = playerService.getPlayers();
		List<Play> plays = playbookService.getPlays();
		ModelAndView modelAndView = new ModelAndView("recordPlay");
        List<PlayResult> playResults = playResultService.getPlayResults();
		modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
		modelAndView.addObject("plays", plays);
		modelAndView.addObject("players", players);

		return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
    @Transactional
	public ModelAndView addingplayResult(@ModelAttribute("playresult") PlayResult playResult){
		playResultService.addPlayResult(playResult);
        List<Player> players = playerService.getPlayers();
        List<Play> plays = playbookService.getPlays();
        ModelAndView modelAndView = new ModelAndView("recordPlay");
        List<PlayResult> playResults = playResultService.getPlayResults();
        modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
        modelAndView.addObject("plays", plays);
        modelAndView.addObject("players", players);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/list")  
    public ModelAndView listOfplays() {  
        ModelAndView modelAndView = new ModelAndView("list-of-playResults");  
          
        List<PlayResult> playResults = playResultService.getPlayResults();  
        List<Player> players = playerService.getPlayers();
        modelAndView.addObject("players",players);
        modelAndView.addObject("playResults", playResults);  
          
        return modelAndView;  
    }
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)  
    public ModelAndView editplayPage(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("edit-play-form");  
        PlayResult playResult = playResultService.getPlayResult(id);  
        modelAndView.addObject("playResult",playResult);  
        return modelAndView;  
    }  
      
    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)  
    public ModelAndView editingplay(@ModelAttribute PlayResult playResult, @PathVariable Integer id) {  
          
        ModelAndView modelAndView = new ModelAndView("login");
          
        playResultService.updatePlayResult(playResult);  
          
        String message = "play was successfully edited.";  
        modelAndView.addObject("message", message);  
          
        return modelAndView;  
    }  
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)  
    public ModelAndView deleteplay(@PathVariable Integer id) {  
        ModelAndView modelAndView = new ModelAndView("login");
        playResultService.deletePlayResult(id);
        List<Player> players = playerService.getPlayers();
        List<Play> plays = playbookService.getPlays();
        List<PlayResult> playResults = playResultService.getPlayResults();
        modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
        modelAndView.addObject("plays", plays);
        modelAndView.addObject("players", players);
        String message = "play was successfully deleted.";  
        modelAndView.addObject("message", message);  
        return modelAndView;  
    } 
}
