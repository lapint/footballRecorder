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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.List;

@SessionAttributes({"players", "plays", "playresults"})
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
    public ModelAndView addGamePage(Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("createGame");
        modelAndView.addObject("game", new Game());
        List<Game> games = gameService.getGames();
        modelAndView.addObject("games", games);

        return modelAndView;
    }

    @RequestMapping(value="/game/delete/{id}", method=RequestMethod.GET)
    public String deleteGame(@PathVariable Integer id, ModelMap model, Principal principal) {
        if(principal==null){
            return "login";
        }
        gameService.deleteGame(id);

        return "redirect:../create";
    }

    @RequestMapping(value="/game/edit/{id}", method=RequestMethod.GET)
    public ModelAndView updateGame(@PathVariable Integer id,  Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }

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
        if(principal==null){
            return new ModelAndView("login");
        }
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
    public String addPlayResultPage(ModelMap model, Principal principal){
        if(principal==null){
            return "login";
        }
        if(game.getId()==null){
            return "createGame";
        }
        if(model.get("players")==null){
            List<Player> players = playerService.getPlayers();
            List<Play> plays = playbookService.getPlays();
            model.addAttribute("plays", plays);
            model.addAttribute("players", players);
        }
        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        model.addAttribute("playresult", new PlayResult());
        model.addAttribute("playresults", playResults);

        return "recordPlay";
    }

    @RequestMapping(value="/game/playresult/add", method=RequestMethod.POST)
    @Transactional
    public ModelAndView addPlayResult(@ModelAttribute("playresult") PlayResult playResult, BindingResult result, Principal principal){
        if(principal==null){
            return new ModelAndView("login");
        }
        final String currentUser = principal.getName();
        playResult.setUser_Id(currentUser);
        playResult.setGame_Id(game.getId());
        playResult.setOpponent(game.getOpponent());
        playResult.setDate(game.getDate());
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

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/list")
    public ModelAndView listOfplays(Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("list-of-playResults");

        List<PlayResult> playResults = playResultService.getPlayResults(game.getId());
        modelAndView.addObject("playResults", playResults);

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editplayPage(@PathVariable Integer id, Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }
        ModelAndView modelAndView = new ModelAndView("edit-play-form");
        PlayResult playResult = playResultService.getPlayResult(id);
        modelAndView.addObject("playResult",playResult);
        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/edit/{id}", method=RequestMethod.POST)
    public ModelAndView editingplay(@ModelAttribute PlayResult playResult, @PathVariable Integer id, Principal principal) {
        if(principal==null){
            return new ModelAndView("login");
        }

        ModelAndView modelAndView = new ModelAndView("login");

        playResultService.updatePlayResult(playResult);

        String message = "play was successfully edited.";
        modelAndView.addObject("message", message);

        return modelAndView;
    }

    @RequestMapping(value="/game/playresult/delete/{id}", method=RequestMethod.GET)
    public String deleteplay(@PathVariable Integer id, ModelMap model, Principal principal) {
        if(principal==null){
            return "login";
        }
        playResultService.deletePlayResult(id);

        List<PlayResult> playResults = (List<PlayResult>) model.get("playresults");
        for(int i = 0; i < playResults.size(); i++){
            if(playResults.get(i).getId()==id){
                playResults.remove(i);
            }
        }

        model.addAttribute("playresult", new PlayResult());
        model.addAttribute("playresults", playResults);
        return "redirect:../add";
    }
}
