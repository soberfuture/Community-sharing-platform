package com.share.page;

import java.util.List;
@SuppressWarnings("rawtypes")
public class Pagebean {
	
	private int totalPage;//总页数
	private int currentPage;//当前页数
	private int total;//总记录数
	private int pageSize;//每页记录数
	private List list;
	private Integer type;
	private String mygoods;
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
	public String getMygoods() {
		return mygoods;
	}
	public void setMygoods(String mygoods) {
		this.mygoods = mygoods;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
