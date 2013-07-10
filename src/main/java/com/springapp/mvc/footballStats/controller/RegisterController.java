package com.springapp.mvc.footballStats.controller;

import com.springapp.mvc.footballStats.model.*;
import com.springapp.mvc.footballStats.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/3/13
 * Time: 10:49 PM
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value="/user")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping(value="/register", method= RequestMethod.GET)
    public ModelAndView addUserPage(){
        ModelAndView modelAndView = new ModelAndView("register");
        modelAndView.addObject("user", new User());

        return modelAndView;
    }

    @RequestMapping(value="/register", method=RequestMethod.POST)
    @Transactional
    public ModelAndView addingUser(@ModelAttribute("user") User user){
        user.setType(1);
        registerService.addUser(user);
        UserRole userRole = new UserRole();
        userRole.setUser_Id(user.getId());
        userRole.setAuthority("ROLE_USER");
        userRole.setUser_Role_Id(userRole.getUser_Id());
        registerService.addUserRole(userRole);
        ModelAndView modelAndView = new ModelAndView("../players/add");
        modelAndView.addObject("User", new User());

        return modelAndView;
    }

}
