package com.share.user.service;

import java.util.List;

import com.share.user.dao.UserDao;
import com.share.user.entity.User;

public class UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void save(User user) {
		userDao.save(user);
	}


	public User findUsername(String username) {
		User user = userDao.findUsername(username);
		return user;
	}

	public User checkUser(User user) {
		User user1 = userDao.findUser(user);
		return user1;
	}

	public List<User> userlist(Integer page, Integer rows) {
		List<User> userlist = userDao.userlist(page,rows);
		return userlist;
	}

	public int gettotal() {
		int total = userDao.gettotal();
		return total;
	}

	public User checkpwd(String username, String oldpwd) {
		User user = userDao.checkpwd(username,oldpwd);
		return user;
	}

	public User getUser(int uid) {
		User user = userDao.getUser(uid);
		return user;
	}

	public int checkUsername(String username) {
		int size = userDao.checkUsername(username);
		return size;
	}

	public User findByUid(Integer uid) {
		User user = userDao.findByUid(uid);
		return user;
	}

	public User checkExist(String tel) {
		User user = userDao.checkExist(tel);
		return user;
	}


}
