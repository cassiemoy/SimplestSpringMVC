package com.simplest.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
 * Many thanks to a.shah at Crunchify.
 * 
 */

@Controller
public class SimplestHelloWorld {	 
	
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
		
			String message = "Welcome, world.";
			return new ModelAndView("welcome", "message", message);
	
	}

}
