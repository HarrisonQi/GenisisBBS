package com.withstars.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.withstars.domain.Reply;
import com.withstars.domain.Sysuser;
import com.withstars.domain.Tab;
import com.withstars.domain.Topic;

public interface SysuserMapper {

    int editpwd(@Param("newpwd")String newpwd,@Param("oldpwd")String oldpwd
    		,@Param("username")String username);

//  验证后台登录
  public Sysuser adminLogin(Map<String, Object> po);
  
//获取条数
public int getCount(Map<String, Object> po); 
//分页
public List<Sysuser> getByPage(Map<String, Object> map);


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

int delTopic(@Param("id")String id);
int delReply(@Param("id")String id);
int editUserStatus(@Param("userid")String userid);
	
}