package com.share.comments.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.comments.entity.Comments;
import com.share.order.entity.Order;
import com.share.sorder.entity.Sorder;
import com.share.user.entity.User;
@SuppressWarnings("unchecked")
public class CommentsDao extends HibernateDaoSupport {

	
	public void addCom(Comments comments, Integer order) {
		this.getHibernateTemplate().save(comments);
		if(comments.getType().equals("share")){
			List<Sorder> list = this.getHibernateTemplate().find("from Sorder where soid=? order by soid desc",order);
			Sorder sorder = list.get(0);
			sorder.setState(6);
			this.getHibernateTemplate().update(sorder);
		}else{
			List<Order> list = this.getHibernateTemplate().find("from Order where oid=? order by oid desc",order);
			Order order1 = list.get(0);
			order1.setState(6);
			this.getHibernateTemplate().update(order1);
		}
	}

	public List<Comments> findBySid(Integer sid, String type) {
		List<Comments> list = this.getHibernateTemplate().find("from Comments where sid=? and type=? order by cid desc",sid,type);
		list = setUser(list);
		return list;
	}

	private List<Comments> setUser(List<Comments> list) {
		for(Comments comments:list){
			List<User> userlist = this.getHibernateTemplate().find("from User where uid=?",comments.getUid());
			comments.setUser(userlist.get(0));
		}
		return list;
	}

}
