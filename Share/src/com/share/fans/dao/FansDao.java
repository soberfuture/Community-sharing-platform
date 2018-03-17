package com.share.fans.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.fans.entity.Fans;
import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class FansDao extends HibernateDaoSupport {

	public void save(Fans fans) {
		this.getHibernateTemplate().save(fans);
	}

	public void del(Fans fans) {
		this.getHibernateTemplate().delete(fans);
	}

	public int gettotalByUid(Integer uid) {//粉丝数
		return this.getHibernateTemplate().find("from Fans where concerned=?",uid).size();
	}

	
	public Fans findByfid(Integer fid) {
		List<Fans> list = this.getHibernateTemplate().find("from Fans where fid=?",fid);
		if(list.size()!=0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public Fans findBytwo(Integer uid, Integer uid2) {
		List<Fans> list = this.getHibernateTemplate().find("from Fans where concern=? and concerned=?",uid,uid2);
		if(list==null||list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}

	public int getconcern(Integer uid1) {//关注数
		return this.getHibernateTemplate().find("from Fans where concern=?",uid1).size();
	}

	public List<User> findByUid(Integer uid) {//通过关注人ID，获得他关注的所有人的集合
		List<Fans> fanslist = this.getHibernateTemplate().find("from Fans where concern=?",uid);
		List<User> list = new ArrayList<User>();
		for(Fans fans:fanslist){
			List<User> userlist = this.getHibernateTemplate().find("from User where uid=?",fans.getConcerned());
			if(userlist.size()!=0){
				list.add(userlist.get(0));
			}
		}
		return list;
	}

}
