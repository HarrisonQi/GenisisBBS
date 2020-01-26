package com.withstars.domain;

import java.io.Serializable;
import java.util.Date;

public class MyTopic implements Serializable{

	private Integer countReplies;

    private Integer id;

    private Integer userId;

    private String createTime;

    private String updateTime;

    private String title;

    private Integer click;

    private Byte tabId;

    private String content;
    private Integer liang;
    
    private String username;
    private String avatar;
    private String tabname;
    private String sort;
	public Integer getLiang() {
		return liang;
	}
	public void setLiang(Integer liang) {
		this.liang = liang;
	}
	public Integer getCountReplies() {
		return countReplies;
	}
	public void setCountReplies(Integer countReplies) {
		this.countReplies = countReplies;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getClick() {
		return click;
	}
	public void setClick(Integer click) {
		this.click = click;
	}
	public Byte getTabId() {
		return tabId;
	}
	public void setTabId(Byte tabId) {
		this.tabId = tabId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getTabname() {
		return tabname;
	}
	public void setTabname(String tabname) {
		this.tabname = tabname;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
    
}
