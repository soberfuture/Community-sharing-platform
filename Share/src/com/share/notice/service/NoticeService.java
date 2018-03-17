package com.share.notice.service;

import java.util.List;

import com.share.notice.dao.NoticeDao;
import com.share.notice.entity.Notice;

public class NoticeService {
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	public void saveOrUpdate(Notice notice) {
		noticeDao.saveOrUpdate(notice);
	}

	public void delNotice(Notice notice) {
		noticeDao.delNotice(notice);
	}

	public List<Notice> findAll(Integer page, Integer rows) {
		List<Notice> list = noticeDao.findAll(page,rows);
		return list;
	}

	public int gettotal() {
		int total = noticeDao.gettotal();
		return total;
	}

	public Notice findByNid(Integer nid) {
		Notice notice = noticeDao.findByNid(nid);
		return notice;
	}

	public List<Notice> AllPaging(Integer page, Integer rows) {
		List<Notice> list = noticeDao.AllPaging(page,rows);
		return list;
	}
	
}
