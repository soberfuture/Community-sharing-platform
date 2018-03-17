package com.share.attend.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.activity.entity.Activity;
import com.share.attend.entity.Attend;
@SuppressWarnings("unchecked")
public class AttendDao extends HibernateDaoSupport {

	public int addAttend(Attend attend) {
		this.getHibernateTemplate().save(attend);
		int total = gettotal(attend);
		return total;
	}

	
	private int gettotal(Attend attend) {
		int total = this.getHibernateTemplate().find("from Attend where aid=?",attend.getAid()).size();
		List<Activity> list = this.getHibernateTemplate().find("from Activity where aid=?",attend.getAid());
		Activity activity = list.get(0);
		activity.setNumber(total);
		this.getHibernateTemplate().update(activity);
		return total;
	}


	public Attend findByUA(Integer aid, Integer uid) {
		List<Attend> list = this.getHibernateTemplate().find("from Attend a where a.aid=? and a.uid=? order by atid desc",aid,uid);
		Attend attend = list.get(0);
		attend= setActivity(attend);
		return attend;
	}

	private Attend setActivity(Attend attend) {
		List<Activity> list = this.getHibernateTemplate().find("from Activity where aid=?",attend.getAid());
		if(list==null||list.size()==0){
			attend.setActivity(null);
		}else{
			attend.setActivity(list.get(0));
		}
		return attend;
	}


	public int delAttend(Attend attend) {
		this.getHibernateTemplate().delete(attend);
		int total = gettotal(attend);
		return total;
	}


	public int isAttend(Integer uid, Integer aid) {
		return this.getHibernateTemplate().find("from Attend where aid=? and uid=?",aid,uid).size();
	}


	public List<Attend> findByUid(Integer uid) {
		List<Attend> list = this.getHibernateTemplate().find("from Attend where uid=? order by atid desc",uid);
		list = setActivity1(list);
		return list;
	}


	private List<Attend> setActivity1(List<Attend> list) {
		for(Attend attend:list){
			List<Activity> alist = this.getHibernateTemplate().find("from Activity where aid=?",attend.getAid());
			if(alist==null||alist.size()==0){
				attend.setActivity(null);
			}else{
				attend.setActivity(alist.get(0));
			}
		}
		return list;
	}

}
