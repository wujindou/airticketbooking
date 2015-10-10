package com.demo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.demo.dao.OrderDao;
import com.demo.dao.TicketDao;
import com.demo.dao.UserDao;

@RestController
public class Index {
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private UserDao userDao;
	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "/bar")
	@ResponseBody
	public Map<String, Object> bar(@RequestParam(value = "name") String name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("test", "jsonRestExample");
		map.put("name", name);
		return map;
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}

	@Autowired
	private TicketDao ticketDao;

	@RequestMapping(value = "/tickets")
	@ResponseBody
	public Map<String, Object> tickets(
			@RequestParam(value = "from") String from,
			@RequestParam(value = "to") String to,
			@RequestParam(value = "departing") String departing) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", ticketDao.getTickets(from, to, departing));
		return map;
	}

	@RequestMapping(value = "/buyConfirm/{id}", method = RequestMethod.GET)
	public ModelAndView confirm(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("buyconfirm");
		mv.addObject("ticket", ticketDao.getTicket(id));
		return mv;
	}

	@RequestMapping(value = "/buy")
	@ResponseBody
	public Map<String, Object> buy(@RequestParam(value = "id") int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> ticket = ticketDao.getTicket(id);
		if (httpSession.getAttribute("username") == null) {
			map.put("code", 0);
			map.put("errMessage", "您需要登录后，才能购买!");
		} else {
			int userid = (Integer) httpSession.getAttribute("userid");
			Map<String, Object> user = userDao.getUserInfoById(userid);
			int money = (Integer) user.get("currentmoney");
			int price = (Integer) ticket.get("price");
			if (money < price) {
				map.put("code", 0);
				map.put("errMessage", "帐户余额不足");
			} else {
				Map<String,Object> res = (Map<String, Object>) orderDao.insert(id, userid, price);
				int retCode = (Integer)res.get("code");
				if(retCode ==0 ){
					map.put("code",0);
					map.put("errMessage", "您已经购买过了，不可重复购买");
				}else if(retCode ==2){
					map.put("code",0);
					map.put("errMessage", "扣款失败");
				}else{
					map.put("code", 1);
					
				}
			}
		}
		return map;
	}
	@RequestMapping(value = "/myOrders", method = RequestMethod.GET)
	public ModelAndView getUserOrders() {
		if(httpSession.getAttribute("userid")!=null){
			int userid = (Integer) httpSession.getAttribute("userid");
			ModelAndView mv = new ModelAndView("user_tickets");
			mv.addObject("orders", orderDao.getUserOrders(userid));
			return mv;
		}else{
			ModelAndView mv = new ModelAndView("login");
			return mv;
		}
	}

}