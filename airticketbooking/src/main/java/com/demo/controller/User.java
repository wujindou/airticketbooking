package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.UserDao;
@Controller
public class User {
	  @Autowired
	  private UserDao userDao;
	 @RequestMapping(value="/user/login")
	 public ModelAndView confirm() {
	   		ModelAndView mv = new ModelAndView("buyconfirm");
	   		mv.addObject("user",userDao.login("zhang3", "123456"));
	   		return mv;
	  }
}
