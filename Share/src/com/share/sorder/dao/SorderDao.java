package com.share.sorder.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.share.entity.Share;
import com.share.sorder.entity.Sorder;
@SuppressWarnings("unchecked")
public class SorderDao extends HibernateDaoSupport {

	public void save(Sorder sorder) {
		this.getHibernateTemplate().saveOrUpdate(sorder);
	}

	
	public List<Sorder> findByUid(Integer uid, Integer page, Integer rows) {
		String hql = "from Sorder s where s.uid="+uid+" order by soid desc";
		List<Sorder> list = getlist(page,rows,hql);
		list  = setShare(list);
		return list;
	}


	@SuppressWarnings("rawtypes")
	private List<Sorder> getlist(final Integer page, final Integer rows, final String hql) {
		List<Sorder> sorderlist = this.getHibernateTemplate().execute(
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
		return sorderlist;
	}


	public Sorder findBySoid(Integer soid) {
		List<Sorder> list = this.getHibernateTemplate().find("from Sorder s where s.soid=?",soid);
		Sorder sorder = list.get(0);
		sorder = setShare1(sorder);
		return sorder;
	}


	private Sorder setShare1(Sorder sorder) {
		List<Share> sharelist = this.getHibernateTemplate().find("from Share s where s.sid=?",sorder.getSid());
		if(sharelist.size()!=0){
			sorder.setShare(sharelist.get(0));
		}
		return sorder;
	}


	public int gettotal() {
		return this.getHibernateTemplate().find("from Sorder").size();
	}


	public int gettotalByUid(Integer uid) {
		return this.getHibernateTemplate().find("from Sorder s where s.uid=?",uid).size();
	}


	public List<Sorder> findByUS(Integer uid, Integer page, Integer rows, Integer state) {
		String hql = "from Sorder s where s.uid="+uid+"and state="+state+" order by soid desc";
		List<Sorder> list = getlist(page,rows,hql);
		list = setShare(list);
		return list;
	}


	private List<Sorder> setShare(List<Sorder> list) {
		List<Share> sharelist = new ArrayList<Share>();
		for(Sorder sorder:list){
			sharelist = this.getHibernateTemplate().find("from Share s where s.sid=?",sorder.getSid());
			if(sharelist.size()!=0){
				sorder.setShare(sharelist.get(0));
			}
		}
		return list;
	}


	public int gettotalByUS(Integer uid, Integer state) {
		return this.getHibernateTemplate().find("from Sorder s where s.uid=? and s.state=?",uid,state).size();
	}


	public List<Sorder> findByUUid(Integer uuid, Integer page, Integer rows) {
		String hql = "from Sorder s where s.uuid="+uuid+" order by soid desc";
		List<Sorder> list = getlist(page,rows,hql);
		list  = setShare(list);
		return list;
	}


	public int gettotalByUUid(Integer uuid) {
		return this.getHibernateTemplate().find("from Sorder s where s.uuid=?",uuid).size();
	}


	public List<Sorder> findByUUS(Integer uuid, Integer page, Integer rows, Integer state) {
		String hql = "from Sorder s where s.uuid="+uuid+"and state="+state+" order by soid desc";
		List<Sorder> list = getlist(page,rows,hql);
		list = setShare(list);
		return list;
	}


	public int gettotalByUUS(Integer uuid, Integer state) {
		return this.getHibernateTemplate().find("from Sorder s where s.uuid=? and s.state=?",uuid,state).size();
	}

}
