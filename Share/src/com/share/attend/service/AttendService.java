package com.share.attend.service;

import java.util.List;

import com.share.attend.dao.AttendDao;
import com.share.attend.entity.Attend;

public class AttendService {
	private AttendDao attendDao;

	public void setAttendDao(AttendDao attendDao) {
		this.attendDao = attendDao;
	}

	public int addAttend(Attend attend) {
		int size = attendDao.addAttend(attend);
		return size;
	}

	public Attend findByUA(Integer aid, Integer uid) {
		Attend attend = attendDao.findByUA(aid,uid);
		return attend;
	}

	public int delAttend(Attend attend) {
		int size = attendDao.delAttend(attend);
		return size;
	}

	public int isAttend(Integer uid, Integer aid) {
		int size = attendDao.isAttend(uid,aid);
		return size;
	}

	public List<Attend> findByUid(Integer uid) {
		List<Attend> list = attendDao.findByUid(uid);
		return list;
	}
	
}
