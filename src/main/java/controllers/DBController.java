/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author Paolo
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DBController {

    private static final Logger logger = LoggerFactory.getLogger(DBController.class);

    @Autowired
    private DirectoryService directoryService;

    @RequestMapping(value = "/usersaved", method = RequestMethod.POST)
    public String register(@Validated UserClass passedUser, Model model) {
        logger.info("Registration called");
        if (passedUser != null) {
            logger.info("UserClass: " + passedUser);
        }
        if(directoryService.verifyLogin(passedUser)==null){
        directoryService.saveUser(passedUser);
        model.addAttribute("user", passedUser);
        return "home";
        }
        else {
            model.addAttribute("error","Please choose a different username.");
            return "register";
        }
    }

    @RequestMapping(value = "/checkusername", method = RequestMethod.GET)
    public @ResponseBody
    String processAJAXRequest(@RequestParam("username") String passedUsername, Model model) {
        String result = "Username available";
        if(directoryService.availableUsername(passedUsername)) {
            model.addAttribute("error","Username in use");
            model.addAttribute("passedUsername",passedUsername);
            result = "Username in use";
        }
           return result; 
        }
   
    @RequestMapping("/register")
  public ModelAndView AjaxView() {
    return new ModelAndView("register", "message", "AJAX test");
  }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Validated UserClass passedUser, Model model) {
        logger.info("Login called- POST");
        if (passedUser != null) {
            logger.info("UserClass: " + passedUser);
        }
        UserClass existingUser = directoryService.verifyLogin(passedUser);
        if (existingUser != null) {
            model.addAttribute("user", passedUser);
            return "home";
        } else {
            model.addAttribute("error", "Login unsuccessful");
            return "login";
        }
    }
}
