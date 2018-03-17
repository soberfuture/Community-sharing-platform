package com.share.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class UserDao extends HibernateDaoSupport{

	public void save(User user) {
		this.getHibernateTemplate().saveOrUpdate(user);
	}


	public User findUsername(String username) {
		List<User> userlist=this.getHibernateTemplate().find("from User u where u.username=?", username);
		if(userlist != null && !userlist.isEmpty()){
			User user = userlist.get(0);
			return user;
		}else{
			return null;
		}
	}

	public User findUser(User user) {
		List<User> list=this.getHibernateTemplate().find("from User u where u.tel=? and u.password=?", user.getTel(),user.getPassword());
		if( !list.isEmpty() && list != null){
			return list.get(0);
		}else{
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public List<User> userlist(final Integer page, final Integer rows) {
		//当为缺省值的时候进行赋值  
		List<User> userlist = this.getHibernateTemplate().execute(
				new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException, SQLException {
						String hql = "from User";
						Query query = session.createQuery(hql);
						int begin = (page-1)*rows;
						query.setFirstResult(begin);
						query.setMaxResults(rows);
						return query.list();
					}
		});
		return userlist;
	}

	public int gettotal() {
		int total = this.getHibernateTemplate().find("from User").size();
		return total;
	}


	public User checkpwd(String username, String oldpwd) {
		List<User> list = this.getHibernateTemplate().find("from User u where u.username=? and u.password=?",username,oldpwd);
		if(list.isEmpty()||list==null){
			return null;
		}else{
			return list.get(0);
		}
	}


	public User getUser(int uid) {
		List<User> list = this.getHibernateTemplate().find("from User u where u.uid=?",uid);
		if(list==null || list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}


	public int checkUsername(String username) {
		return this.getHibernateTemplate().find("from User u where u.username=?",username).size();
	}


	public User findByUid(Integer uid) {
		List<User> list = this.getHibernateTemplate().find("from User where uid=?",uid);
		if(list.size()!=0){
			return list.get(0);
		}else{
			return null;
		}
	}


	public User checkExist(String tel) {
		List<User> userlist = this.getHibernateTemplate().find("from User where tel=?",tel);
		if(userlist.size()!=0){
			return userlist.get(0);
		}else{
			return null;
		}
	}

}
