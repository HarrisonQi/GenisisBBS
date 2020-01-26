package com.withstars.service;

import java.util.List;
import java.util.Map;

import com.withstars.domain.Reply;
import com.withstars.domain.Sysuser;
import com.withstars.domain.Tab;
import com.withstars.domain.Topic;

public interface SysuserServier {
//  验证后台登录
  public Sysuser adminLogin(Map<String, Object> po);
//  添加用户
  int editpwd(String newpwd,String oldpwd,String username);
//分页显示
public List<Sysuser> getByPage(Map<String, Object> map);
//获取信息的条数
public int getCount(Map<String, Object> po);

//获取条数
public int getCountForTab(Map<String, Object> po); 
//分页
public List<Tab> getAllTabs(Map<String, Object> map);

//获取条数
public int getCountForTopic(Map<String, Object> po); 
//分页
public List<Topic> getAllTopicList(Map<String, Object> map);

//获取条数
public int getCountForReply(Map<String, Object> po); 
//分页
public List<Reply> getAllReplyList(Map<String, Object> map);

int editUserStatus(String userid,String id,String type);
	
}
