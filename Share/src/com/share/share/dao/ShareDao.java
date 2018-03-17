package com.share.share.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.share.entity.Share;
import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class ShareDao extends HibernateDaoSupport{


	public List<Share> sharelist(Integer page, Integer rows) {
		String hql="from Share order by sid desc";
		List<Share> sharelist = getlist(page,rows,hql);
		return sharelist;
	}

	@SuppressWarnings("rawtypes")
	private List<Share> getlist(final Integer page, final Integer rows, final String hql) {
		List<Share> sharelist = this.getHibernateTemplate().execute(
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
		return sharelist;
	}

	public int gettotal() {
		int total = this.getHibernateTemplate().find("from Share").size();
		return total;
	}

	public void delete(Share share) {
		this.getHibernateTemplate().delete(share);
	}

	public void save(Share share) {
		this.getHibernateTemplate().saveOrUpdate(share);
	}

	public List<Share> allShare() {
		List<Share> list = this.getHibernateTemplate().find("from Share order by sid desc");
		List<User> userlist = new ArrayList<User>();
		for(Share share:list){
			userlist = this.getHibernateTemplate().find("from User u where u.uid=?",share.getUid());
			if(userlist.size()!=0){
				share.setUser(userlist.get(0));
			}
		}
		return list;
	}

	public List<Share> findByType(int type, Integer page, Integer rows) {
		System.out.println("这里是按类型查询！");
		String hql = "from Share s where s.stype="+type+" order by sid desc";
		List<Share> list = getlist(page, rows, hql);
		return list;
	}

	public int gettotalType(int type) {
		System.out.println("查找该类型的物品个数");
		return this.getHibernateTemplate().find("from Share s where s.stype=?",type).size();
	}

	public List<Share> shareByUid(Integer uid, Integer page, Integer rows) {
		String hql = "from Share s where s.uid="+uid+"order by sid desc";
		List<Share> list = getlist(page, rows, hql);
		return list;
	}

	public int gettotalByUid(Integer uid) {
		return this.getHibernateTemplate().find("from Share s where s.uid=?",uid).size();
	}

	public Share findByID(Integer sid) {
		List<Share> list = this.getHibernateTemplate().find("from Share s where s.sid=? order by sid desc", sid);
		Share share = list.get(0);
		List<User> userlist = this.getHibernateTemplate().find("from User u where u.uid=?",share.getUid());
		share.setUser(userlist.get(0));
		return share;
	}

	public List<Share> findListByUid(Integer uid) {
		List<Share> list = this.getHibernateTemplate().find("from Share where uid=? order by sid desc",uid);
		List<Share> list2 = new ArrayList<Share>();
		for(Share share:list){
			list2.add(share);
			if(list2.size()>7){
				break;
			}
		}
		return list2;
	}

	public List<Share> findByUid(Integer uid) {
		List<Share> list = this.getHibernateTemplate().find("from Share where uid=? and state=0 order by sid desc",uid);
		if(list.size()!=0){
			return list;
		}else{
			return null;
		}
	}

}
