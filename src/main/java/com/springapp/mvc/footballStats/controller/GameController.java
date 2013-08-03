package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.Game;
import com.springapp.mvc.footballStats.model.Play;
import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.Player;
import com.springapp.mvc.footballStats.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller
public class GameController {

    @Autowired
    private GameService gameService;
    @Autowired
    private PlayResultService playResultService;
    @Autowired
    private PlayerService playerService;
    @Autowired
    private PlaybookService playbookService;
    @Autowired
    private PlayerStatsService playerStatsService;

    private Game game;
    @RequestMapping(value="/game/create", method=RequestMethod.GET)
    public ModelAndView addGamePage(){
        ModelAndView modelAndView = new ModelAndView("createGame");
        modelAndView.addObject("game", new Game());
        List<Game> games = gameService.getGames();
        modelAndView.addObject("games", games);

        return modelAndView;
    }

    @RequestMapping(value="/game/edit/{id}", method=RequestMethod.GET)
    public ModelAndView updateGame(@PathVariable Integer id, Principal principal){
        final String currentUser = principal.getName();
        ModelAndView modelAndView = new ModelAndView("redirect:/game/playresult/add");
        game = gameService.getGame(id);
        List<Game> games = gameService.getGames();
        modelAndView.addObject("game", game);
        modelAndView.addObject("games", games);

        return modelAndView;
    }

    @RequestMapping(value="/game/create", method=RequestMethod.POST)
    public ModelAndView addGame(@ModelAttribute("Game")Game game, Principal principal){
        final String currentUser = principal.getName();
        game.setUser_Id(currentUser);
        ModelAndView modelAndView = new ModelAndView("redirect:/game/playresult/add");
        gameService.addGame(game);
        this.game = game;
        List<Game> games = gameService.getGames();
        modelAndView.addObject("game", new Game());
        modelAndView.addObject("games", games);

        return modelAndView;
    }


    @RequestMapping(value="/game/playresult/add", method=RequestMethod.GET)
    public ModelAndView addPlayResultPage(){
        if(game.getId()==null){
            ModelAndView modelAndView = new ModelAndView("redirect:game/create");
            return modelAndView;
        }
        List<Player> players = playerService.getPlayers();
        List<Play> plays = playbookService.getPlays();
        ModelAndView modelAndView = new ModelAndView("recordPlay");
        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
        modelAndView.addObject("plays", plays);
        modelAndView.addObject("players", players);

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/add", method=RequestMethod.POST)
    @Transactional
    public ModelAndView addPlayResult(@ModelAttribute("playresult") PlayResult playResult, BindingResult result, Principal principal){
        final String currentUser = principal.getName();
        playResult.setUser_Id(currentUser);
        playResult.setGame_Id(game.getId());
        playResult.setOpponent(game.getOpponent());
        playResult.setDate(game.getDate());

        List<Player> players = playerService.getPlayers();
        List<Play> plays = playbookService.getPlays();
        System.out.println(playResult.getPlay_Id());

        playResult.setCarrier(playerService.getPlayer(playResult.getCarrier_Id()).getName());
        playResult.setPlay_Type(playbookService.getPlay(playResult.getPlay_Id()).getType());
        playResult.setPlay(playbookService.getPlay(playResult.getPlay_Id()).getName());
        playResultService.addPlayResult(playResult);
        playerStatsService.updatePlayer(playResult.getCarrier_Id(), playResult);

        ModelAndView modelAndView = new ModelAndView("recordPlay");
        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
        modelAndView.addObject("plays", plays);
        modelAndView.addObject("players", players);

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/list")
    public ModelAndView listOfplays() {
        ModelAndView modelAndView = new ModelAndView("list-of-playResults");

        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        List<Player> players = playerService.getPlayers();
        modelAndView.addObject("players",players);
        modelAndView.addObject("playResults", playResults);

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editplayPage(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("edit-play-form");
        PlayResult playResult = playResultService.getPlayResult(id);
        modelAndView.addObject("playResult",playResult);
        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/edit/{id}", method=RequestMethod.POST)
    public ModelAndView editingplay(@ModelAttribute PlayResult playResult, @PathVariable Integer id) {

        ModelAndView modelAndView = new ModelAndView("login");

        playResultService.updatePlayResult(playResult);

        String message = "play was successfully edited.";
        modelAndView.addObject("message", message);

        return modelAndView;
    }

    @RequestMapping(value="/playresult/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deleteplay(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("recordPlay");
        playResultService.deletePlayResult(id);
        List<Player> players = playerService.getPlayers();
        List<Play> plays = playbookService.getPlays();
        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        modelAndView.addObject("playresult", new PlayResult());
        modelAndView.addObject("playresults", playResults);
        modelAndView.addObject("plays", plays);
        modelAndView.addObject("players", players);
        String message = "play was successfully deleted.";
        modelAndView.addObject("message", message);
        return modelAndView;
    }
}
