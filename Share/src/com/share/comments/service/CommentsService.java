package com.share.comments.service;

import java.util.List;

import com.share.comments.dao.CommentsDao;
import com.share.comments.entity.Comments;

public class CommentsService {

	private CommentsDao commentsDao;

	public void setCommentsDao(CommentsDao commentsDao) {
		this.commentsDao = commentsDao;
	}

	public void addCom(Comments comments, Integer order) {
		commentsDao.addCom(comments,order);
	}

	public List<Comments> findBySid(Integer sid, String type) {
		List<Comments> list = commentsDao.findBySid(sid,type);
		return list;
	}
	
}
