package com.demo.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.HTMLDocument.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.demo.model.Ticket;

@Repository
public class TicketDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Map<String, Object>> getTickets(String from,String to,String date){
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        String strDate = sdfDate.format(now);
		String sql="select * from ticket_t where 1=1 and from_city='"+from+"'  and leftseats>0  and to_city='"+to+"' and date(departing)='"+date+"' and departing>='"+strDate+"'";
		List<Map<String, Object>> tickets= jdbcTemplate.queryForList(sql);
		return tickets;
	}
	public  Map<String,Object> getTicket(int id){
		SimpleDateFormat sdfDate = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String select = "select *from ticket_t where id="+id;
		Map<String,Object> map =  jdbcTemplate.queryForMap(select);
		map.put("date",sdf.format(map.get("departing")));
		map.put("departing", sdfDate.format(map.get("departing")));
		map.put("landing", sdfDate.format(map.get("landing")));
	
		return map;
	}


}
