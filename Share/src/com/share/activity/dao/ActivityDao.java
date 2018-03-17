package com.share.activity.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.activity.entity.Activity;
import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class ActivityDao extends HibernateDaoSupport {

	public void addActivity(Activity activity) {
		this.getHibernateTemplate().saveOrUpdate(activity);
	}

	public void delActivity(Activity activity) {
		this.getHibernateTemplate().delete(activity);
	}

	
	public List<Activity> findAll() {
		List<Activity> list = this.getHibernateTemplate().find("from Activity order by aid desc");
		list = setUser(list);
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	private List<Activity> getlist(final Integer page, final Integer rows, final String hql) {
		List<Activity> activitie = this.getHibernateTemplate().execute(
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
		return activitie;
	}

	private List<Activity> setUser(List<Activity> list) {
		List<User> userlist = new ArrayList<User>();
		for(Activity activity:list){
			userlist = this.getHibernateTemplate().find("from User u where u.uid=?",activity.getUid());
			activity.setUser(userlist.get(0));
		}
		return list;
	}

	public Activity findByAid(Integer aid) {
		List<Activity> list = this.getHibernateTemplate().find("from Activity where aid=? order by aid desc",aid);
		Activity activity = setattend(list.get(0));
		return activity;
	}

	private Activity setattend(Activity activity) {
		int total = this.getHibernateTemplate().find("from Attend where aid=?",activity.getAid()).size();
		activity.setNumber(total);
		this.addActivity(activity);
		return activity;
	}

	public List<Activity> AllPaging(Integer page, Integer rows) {
		String hql = "from Activity order by aid desc";
		List<Activity> list = getlist(page, rows, hql);
		return list;
	}

	public int gettotal() {
		return this.getHibernateTemplate().find("from Activity").size();
	}

	public List<Activity> findByUid(Integer uid, Integer page, Integer rows) {
		String hql="from Activity where uid="+uid+" order by aid desc";
		List<Activity> list = getlist(page,rows,hql);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		return this.getHibernateTemplate().find("from Activity where uid=?",uid).size();
	}

	public List<Activity> findList(Integer uid) {
		List<Activity> list = this.getHibernateTemplate().find("from Activity where uid=? order by aid desc",uid);
		return list;
	}

	public List<Activity> deal() {
		List<Activity> list = this.getHibernateTemplate().find("from Activity where state=0 order by aid desc");
		return list;
	}

}
