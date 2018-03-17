package com.share.order.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.order.entity.Order;
import com.share.sales.entity.Sales;
@SuppressWarnings("unchecked")
public class OrderDao extends HibernateDaoSupport {

	public void save(Order order) {
		this.getHibernateTemplate().saveOrUpdate(order);
	}

	
	public List<Order> findByUid(Integer uid, Integer page, Integer rows) {
		String hql = "from Order o where o.uid="+uid+" order by oid desc";
		List<Order> list = getlist(page,rows,hql);
		list = setSales(list);
		return list;
	}


	@SuppressWarnings("rawtypes")
	private List<Order> getlist(final Integer page, final Integer rows, final String hql) {
		List<Order> orderlist = this.getHibernateTemplate().execute(
				new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						int begin = (page-1)*rows;
						query.setFirstResult(begin);
						query.setMaxResults(rows);
						return query.list();
					}
		});
		return orderlist;
	}


	public Order findByOid(Integer oid) {
		List<Order> list = this.getHibernateTemplate().find("from Order o where o.oid=?",oid);
		Order order = list.get(0);
		order = setSales1(order);
		return order;
	}


	private Order setSales1(Order order) {		//给Order设置Sales对象
		List<Sales> saleslist = this.getHibernateTemplate().find("from Sales s where s.sid=?",order.getSid());
		if(saleslist.size()==0){
			order.setSales(null);
		}else{
			order.setSales(saleslist.get(0));
		}
		return order;
	}


	public int gettotalByUid(Integer uid) {
		return this.getHibernateTemplate().find("from Order o where o.uid=?",uid).size();
	}


	public List<Order> findByUUid(Integer uuid, int state) {
		List<Order> list = this.getHibernateTemplate().find("from Order o where o.uuid=? and o.state=? order by oid desc",uuid,state);
		list = setSales(list);
		return list;
	}


	private List<Order> setSales(List<Order> list) {		//给OrderList设置Sales对象
		List<Sales> saleslist = new ArrayList<Sales>();
		for(Order order:list){
			saleslist = this.getHibernateTemplate().find("from Sales s where s.sid=? order by sid desc",order.getSid());
			if(saleslist.size()==0){
				order.setSales(null);
			}else{
				order.setSales(saleslist.get(0));
			}
		}
		return list;
	}


	public List<Order> findByUS(Integer uid, Integer page, Integer rows, Integer state) {
		String hql = "from Order o where o.uid="+uid+"and o.state="+state+" order by oid desc";
		List<Order> list = getlist(page,rows,hql);
		list = setSales(list);
		return list;
	}


	public int gettotalByUS(Integer uid, Integer state) {
		return this.getHibernateTemplate().find("from Order o where o.uid=? and o.state=?",uid,state).size();
	}


	public List<Order> findByUUid(Integer uuid, Integer page, Integer rows) {
		String hql = "from Order o where o.uuid="+uuid+" order by oid desc";
		List<Order> list = getlist(page,rows,hql);
		list = setSales(list);
		return list;
	}


	public int gettotalByUUid(Integer uuid) {
		return this.getHibernateTemplate().find("from Order o where o.uuid=?",uuid).size();
	}


	public List<Order> findByUUS(Integer uuid, Integer page, Integer rows, Integer state) {
		String hql = "from Order o where o.uuid="+uuid+"and o.state="+state+" order by oid desc";
		List<Order> list = getlist(page,rows,hql);
		list = setSales(list);
		return list;
	}


	public int gettotalByUUS(Integer uuid, Integer state) {
		return this.getHibernateTemplate().find("from Order o where o.uuid=? and o.state=?",uuid,state).size();
	}

}
