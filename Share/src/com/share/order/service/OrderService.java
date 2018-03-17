package com.share.order.service;

import java.util.List;

import com.share.order.dao.OrderDao;
import com.share.order.entity.Order;

public class OrderService {
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void save(Order order) {
		orderDao.save(order);
	}

	public List<Order> findByUid(Integer uid, Integer page, Integer rows) {
		List<Order> list = orderDao.findByUid(uid,page,rows);
		return list;
	}

	public Order findByOid(Integer oid) {
		Order order = orderDao.findByOid(oid);
		return order;
	}

	public int gettotalByUid(Integer uid) {
		int total = orderDao.gettotalByUid(uid);
		return total;
	}

	public List<Order> findByUUid(Integer uuid, int state) {
		List<Order> list = orderDao.findByUUid(uuid,state);
		return list;
	}

	public List<Order> findByUS(Integer uid, Integer page, Integer rows, Integer state) {
		List<Order> list = orderDao.findByUS(uid,page,rows,state);
		return list;
	}

	public int gettotalByUS(Integer uid, Integer state) {
		int total = orderDao.gettotalByUS(uid,state);
		return total;
	}

	public List<Order> findByUUid(Integer uuid, Integer page, Integer rows) {
		List<Order> list = orderDao.findByUUid(uuid,page,rows);
		return list;
	}

	public int gettotalByUUid(Integer uuid) {
		int total = orderDao.gettotalByUUid(uuid);
		return total;
	}

	public List<Order> findByUUS(Integer uuid, Integer page, Integer rows, Integer state) {
		List<Order> list = orderDao.findByUUS(uuid,page,rows,state);
		return list;
	}

	public int gettotalByUUS(Integer uuid, Integer state) {
		int total = orderDao.gettotalByUUS(uuid,state);
		return total;
	}
	
}
