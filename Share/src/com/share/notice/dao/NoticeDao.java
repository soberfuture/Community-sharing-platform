package com.share.notice.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.share.notice.entity.Notice;
@SuppressWarnings("unchecked")
public class NoticeDao extends HibernateDaoSupport {

	public void saveOrUpdate(Notice notice) {
		this.getHibernateTemplate().saveOrUpdate(notice);
	}

	public void delNotice(Notice notice) {
		this.getHibernateTemplate().delete(notice);
	}

	
	public List<Notice> findAll(Integer page, Integer rows) {
		String hql = "from Notice order by nid desc";
		List<Notice> list = getlist(page,rows,hql);
		return list;
	}

	@SuppressWarnings("rawtypes")
	private List<Notice> getlist(final Integer page, final Integer rows, final String hql) {
		List<Notice> list = this.getHibernateTemplate().execute(new HibernateCallback() {
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

	public int gettotal() {
		return this.getHibernateTemplate().find("from Notice").size();
	}

	public Notice findByNid(Integer nid) {
		List<Notice> list = this.getHibernateTemplate().find("from Notice where nid=? order by nid desc",nid);
		Notice notice = list.get(0);
		notice.setReading(notice.getReading()+1);
		this.getHibernateTemplate().update(notice);
		return notice;
	}

	public List<Notice> AllPaging(Integer page, Integer rows) {
		String hql = "from Notice order by nid desc";
		List<Notice> list = getlist(page,rows,hql);
		return list;
	}

}
