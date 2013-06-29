package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.service.PlaybookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 6/8/13
 * Time: 5:22 PM
 * To change this template use File | Settings | File Templates.
 */
public class adminControls {

    @Autowired
    private PlaybookService playbookService;

    @RequestMapping(value="/add", method= RequestMethod.GET)
    public ModelAndView addplayPage(){
        ModelAndView modelAndView = new ModelAndView("adminControls");
        modelAndView.addObject("play", new Play());
        return modelAndView;
    }

    @RequestMapping(value="/add", method=RequestMethod.POST)
    public ModelAndView addingplay(@ModelAttribute("Playbook")Play play){
        ModelAndView modelAndView = new ModelAndView("adminControls");
        playbookService.addPlay(play);

        String message = "play was successfully added.";
        modelAndView.addObject("message", message);

        return modelAndView;
    }

    @RequestMapping(value="/list")
    public ModelAndView listOfplays() {
        ModelAndView modelAndView = new ModelAndView("roster");
        List<Play> plays = playbookService.getPlays();
        modelAndView.addObject("plays", plays);

        return modelAndView;
    }

    @RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editplayPage(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("edit-play-form");
        Play play = playbookService.getPlay(id);
        modelAndView.addObject("play",play);
        return modelAndView;
    }

    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
    public ModelAndView editingplay(@ModelAttribute Play play, @PathVariable Integer id) {

        ModelAndView modelAndView = new ModelAndView("login");

        playbookService.updatePlay(play);

        String message = "play was successfully edited.";
        modelAndView.addObject("message", message);

        return modelAndView;
    }

    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deleteplay(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("login");
        playbookService.deletePlay(id);
        String message = "play was successfully deleted.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }
}
