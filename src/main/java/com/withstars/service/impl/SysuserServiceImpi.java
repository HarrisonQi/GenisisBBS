package com.withstars.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.withstars.dao.SysuserMapper;
import com.withstars.domain.Reply;
import com.withstars.domain.Sysuser;
import com.withstars.domain.Tab;
import com.withstars.domain.Topic;
import com.withstars.service.SysuserServier;
@Service
public class SysuserServiceImpi implements SysuserServier {
	@Resource
    private SysuserMapper userdao;

	@Override
	public Sysuser adminLogin(Map<String, Object> po) {
		return userdao.adminLogin(po);
	}

	@Override
	public int editpwd(String newpwd, String oldpwd, String username) {
		return userdao.editpwd(newpwd, oldpwd, username);
	}

	@Override
	public List<Sysuser> getByPage(Map<String, Object> map) {
		return userdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> po) {
		return userdao.getCount(po);
	}

	@Override
	public int getCountForTab(Map<String, Object> po) {
		return userdao.getCountForTab(po);
	}

	@Override
	public List<Tab> getAllTabs(Map<String, Object> map) {
		return userdao.getAllTabs(map);
	}

	@Override
	public int getCountForTopic(Map<String, Object> po) {
		return userdao.getCountForTopic(po);
	}

	@Override
	public List<Topic> getAllTopicList(Map<String, Object> map) {
		return userdao.getAllTopicList(map);
	}

	@Override
	public int getCountForReply(Map<String, Object> po) {
		return userdao.getCountForReply(po);
	}

	@Override
	public List<Reply> getAllReplyList(Map<String, Object> map) {
		return userdao.getAllReplyList(map);
	}

	@Override
	public int editUserStatus(String userid, String id, String type) {
		
		if(type.equals("1")){
			//回复
			userdao.delReply(id);
		}else{
			userdao.delTopic(id);
		}
		userdao.editUserStatus(userid);
		return 1;
	}

	
}
