package com.share.sales.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.sales.entity.Sales;
import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class SalesDao extends HibernateDaoSupport {

	public int gettotal() {
		int total = this.getHibernateTemplate().find("from Sales").size();
		return total;
	}

	public List<Sales> saleslist(Integer page, Integer rows) {
		//当为缺省值的时候进行赋值    
        final int currentpage = (page == null || page == 0) ? 1: page;//第几页    
        final int pagesize = (rows == null || rows == 0) ? 10: rows;//每页多少行 
        String hql = "from Sales order by sid desc";
        List<Sales> saleslist = getList(currentpage, pagesize, hql);
		return saleslist;
	}

	public void deleteSales(Sales sales) {
		this.getHibernateTemplate().delete(sales);
	}

	public void save(Sales sales) {
		this.getHibernateTemplate().saveOrUpdate(sales);
	}

	public List<Sales> allSales(Integer page, Integer rows) {
		String hql = "from Sales order by sid desc";
		List<Sales> saleslist = getList(page,rows,hql);
		return saleslist;
	}

	
	@SuppressWarnings("rawtypes")
	private List<Sales> getList(final Integer page, final Integer rows, final String hql) {
		List<Sales> list = this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				int begin = (page-1)*rows;
				query.setFirstResult(begin);
				query.setMaxResults(rows);
				return query.list();
			}
		});
		return list;
	}

	public List<Sales> findByType(Integer page, Integer rows, int type) {
		String hql="from Sales s where s.stype="+type+" order by sid desc";
		List<Sales> saleslist = getList(page, rows, hql);
		return saleslist;
	}

	public int gettypetotal(int type) {
		return this.getHibernateTemplate().find("from Sales s where s.stype=?", type).size();
	}

	public List<Sales> findAll() {
		List<Sales> list = this.getHibernateTemplate().find("from Sales order by sid desc");
		List<User> userlist = new ArrayList<User>();
		for(Sales sales:list){
			userlist = this.getHibernateTemplate().find("from User u where u.uid=?",sales.getUid());
			if(userlist.size()!=0){
				sales.setUser(userlist.get(0));
			}
		}
		return list;
	}

	public Sales findByID(Integer sid) {
		List<Sales> list = this.getHibernateTemplate().find("from Sales s where s.sid=? order by sid desc",sid);
		Sales sales = list.get(0);
		List<User> userlist = this.getHibernateTemplate().find("from User u where u.uid=?",sales.getUid());
		sales.setUser(userlist.get(0));
		return sales;
	}

	public List<Sales> findByUid(Integer uid, Integer page, Integer rows) {
		String hql = "from Sales s where s.uid="+uid+"order by sid desc";
		List<Sales> list = this.getList(page, rows, hql);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		return this.getHibernateTemplate().find("from Sales s where s.uid=?",uid).size();
	}

	public List<Sales> findListByUid(Integer uid) {
		List<Sales> list = this.getHibernateTemplate().find("from Sales where uid=? order by sid desc",uid);
		List<Sales> list2 = new ArrayList<Sales>();
		for(Sales sales:list){
			list2.add(sales);
			if(list2.size()>7){
				break;
			}
		}
		return list2;
	}

	public List<Sales> findlByUid(Integer uid) {
		List<Sales> list = this.getHibernateTemplate().find("from Sales where uid=? order by sid desc",uid);
		if(list.size()!=0){
			return list;
		}else{
			return null;
		}
	}

}
