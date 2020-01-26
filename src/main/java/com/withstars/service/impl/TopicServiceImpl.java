package com.withstars.service.impl;

import com.withstars.dao.TopicMapper;
import com.withstars.domain.MyTopic;
import com.withstars.domain.Topic;
import com.withstars.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    public TopicMapper topicDao;

    //获取全部主题
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    //获取指定id主题
    public Topic selectById(Integer id) {
        Topic topic=topicDao.selectById(id);
        return topic;
    }

    public List<Topic> listMostCommentsTopics() {
        return topicDao.listMostCommentsTopics();
    }

    public boolean addTopic(Topic topic) {
        return topicDao.insert(topic)>0;
    }

    public boolean clickAddOne(Integer id) {
        return topicDao.clickAddOne(id)>0;
    }

    public int getTopicsNum() {
        return topicDao.getTopicsNum();
    }

    public List<Topic> listTopicsAndUsers(Map map) {
        return topicDao.listTopicsAndUsers(map);
    }

    public List<Topic> listTopicsAndUsersOfTab(Map map) {
        return topicDao.listTopicsAndUsersOfTab(map);
    }

	@Override
	public List<MyTopic> getAllTopicsById(String userid) {
		return topicDao.getAllTopicsById(userid);
	}

	@Override
	public List<MyTopic> getAllTopicsByReplyId(String userid) {
		return topicDao.getAllTopicsByReplyId(userid);
	}
	
	public boolean dianAddOne(Integer id) {
        return topicDao.dianAddOne(id)>0;
    }

	@Override
	public List<MyTopic> getAllCollections(String userid) {
		return topicDao.getAllCollections(userid);
	}

	@Override
	public int insert(Topic record) {
		return topicDao.insertSelective(record);
	}

	@Override
	public List<Topic> getAllTopTopic() {
		return topicDao.getAllTopTopic();
	}

	@Override
	public int deleteByPrimaryKey(int id) {
		return topicDao.deleteByPrimaryKey(id);
	}
}
