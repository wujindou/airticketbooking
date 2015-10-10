package com.demo.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Map<String, Object> insert(int flightid, int userid, int price) {
		Map<String, Object> map = new HashMap<String,Object>();

		boolean result = false;
		String checkRepeat = "select count(*) as icount from order_t where flight_id="
				+ flightid + " and user_id=" + userid + " ";
		int count = jdbcTemplate.queryForObject(checkRepeat, new Object[] {},
				Integer.class);
		if (count > 0) {
			map.put("code", 0);
		} else {

			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date now = new Date();
			String strDate = sdfDate.format(now);
			String insert = "insert into order_t (flight_id,user_id,price,buytime) values("
					+ flightid
					+ ","
					+ userid
					+ ","
					+ price
					+ ",'"
					+ strDate
					+ "')";
			String update = "update user set currentmoney = currentmoney - "
					+ price + ", credit = credit + 1 where id=" + userid;
			String update2 = "update ticket_t set leftseats= leftseats-1 where id="+flightid;
			if (jdbcTemplate.update(insert) > 0
					&& jdbcTemplate.update(update) > 0
					&& jdbcTemplate.update(update2) > 0
					) {
				map.put("code", 1);
			} else {
				map.put("code", 2);
			}
		}
		return map;

	}
	public List<Map<String, Object>> getUserOrders(int userid){
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        String strDate = sdfDate.format(now);
		String sql="select o.buytime,t.flight_no,t.flight_name,t.from_city,t.to_city,t.departing,t.landing,t.price from order_t as o join ticket_t as t where o.flight_id = t.id and o.user_id="+userid;
		List<Map<String, Object>> tickets= jdbcTemplate.queryForList(sql);
		for(Map m:tickets){
			m.put("departing",sdfDate.format(m.get("departing")));
		}
		return tickets;
	}
}
