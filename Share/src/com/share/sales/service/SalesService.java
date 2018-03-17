package com.share.sales.service;

import java.util.List;

import com.share.sales.dao.SalesDao;
import com.share.sales.entity.Sales;

public class SalesService {
	private SalesDao salesDao;

	public void setSalesDao(SalesDao salesDao) {
		this.salesDao = salesDao;
	}

	public List<Sales> saleslist(Integer page, Integer rows) {
		List<Sales> saleslist = salesDao.saleslist(page,rows);
		return saleslist;
	}

	public int gettotal() {
		int total = salesDao.gettotal();
		return total;
	}

	public void deleteSales(Sales sales) {
		salesDao.deleteSales(sales);
	}

	public void save(Sales sales) {
		salesDao.save(sales);
	}

	public List<Sales> allSales(Integer page, Integer rows) {
		List<Sales> list = salesDao.allSales(page,rows);
		return list;
	}

	public List<Sales> findByType(Integer page, Integer rows, int type) {
		List<Sales> list = salesDao.findByType(page,rows,type);
		return list;
	}

	public int gettypetotal(int type) {
		int total = salesDao.gettypetotal(type);
		return total;
	}

	public List<Sales> findAll() {
		List<Sales> list = salesDao.findAll();
		return list;
	}

	public Sales findByID(Integer sid) {
		Sales sales = salesDao.findByID(sid);
		return sales;
	}

	public List<Sales> findByUid(Integer uid, Integer page, Integer rows) {
		List<Sales> list = salesDao.findByUid(uid,page,rows);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		int total = salesDao.gettotalByUid(uid);
		return total;
	}

	public List<Sales> findListByUid(Integer uid) {
		List<Sales> list = salesDao.findListByUid(uid);
		return list;
	}

	public List<Sales> findlistByUid(Integer uid) {
		List<Sales> list = salesDao.findlByUid(uid);
		return list;
	}
	
	
}
