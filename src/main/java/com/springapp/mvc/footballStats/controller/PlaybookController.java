package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.service.PlaybookService;
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
@RequestMapping(value="/playbook")
public class PlaybookController {

    @Autowired
	private PlaybookService playbookService;
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView addplayPage(Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
		ModelAndView modelAndView = new ModelAndView("add_play_form");
		modelAndView.addObject("play", new Play());
        List<Play> plays = playbookService.getPlays();
        modelAndView.addObject("plays", plays);

        return modelAndView;
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
    public ModelAndView addingplay(@ModelAttribute("Playbook")Play play, Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
        final String currentUser = principal.getName();
        play.setUser_Id(currentUser);
		ModelAndView modelAndView = new ModelAndView("add_play_form");
		playbookService.addPlay(play);
        List<Play> plays = playbookService.getPlays();
        modelAndView.addObject("play", new Play());
        modelAndView.addObject("plays", plays);
		String message = "play was successfully added.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/list")  
    public ModelAndView listOfplays(Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("list-of-plays");  
        List<Play> plays = playbookService.getPlays();
        modelAndView.addObject("plays", plays);
          
        return modelAndView;  
    }
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)  
    public ModelAndView editplayPage(@PathVariable Integer id, Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("edit-play-form");
        Play play = playbookService.getPlay(id);  
        modelAndView.addObject("play",play);  
        return modelAndView;  
    }  
      
    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)  
    public ModelAndView editingplay(@ModelAttribute Play play, @PathVariable Integer id, Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("login");
          
        playbookService.updatePlay(play);  
          
        String message = "play was successfully edited.";  
        modelAndView.addObject("message", message);  
          
        return modelAndView;  
    }  
      
    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)  
    public ModelAndView deleteplay(@PathVariable Integer id, Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("add_play_form");
        playbookService.deletePlay(id);
        modelAndView.addObject("play", new Play());
        List<Play> plays = playbookService.getPlays();
        modelAndView.addObject("plays", plays);
        String message = "play was successfully deleted.";  
        modelAndView.addObject("message", message);  
        return modelAndView;  
    } 
}
