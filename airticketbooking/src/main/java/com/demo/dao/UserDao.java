package com.demo.dao;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private HttpSession httpSession;


	public Map<String, Object> login(String username, String password) {
		String sql = "select *from user where username ='" + username
				+ "' and password = '" + password + "'";
		Map<String, Object> map;
		try {
			map = jdbcTemplate.queryForMap(sql);
			httpSession.setAttribute("username", map.get("username"));
			httpSession.setAttribute("userid", map.get("id"));
		} catch (EmptyResultDataAccessException e) {
			map = null;
		}
		return map;
	}

	public Map<String, Object> getUserInfoById(int id) {
		String sql = "select *from user where id=" + id;
		Map<String, Object> map;
		try {
			map = jdbcTemplate.queryForMap(sql);
		} catch (EmptyResultDataAccessException e) {
			map = null;
		}
		return map;
	}
}
