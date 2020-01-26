package com.withstars.dao;

import com.withstars.domain.MyTopic;
import com.withstars.domain.Topic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectById(Integer id);

    List<Topic> listTopicsAndUsers(Map map);

    List<Topic> listTopicsAndUsersOfTab(Map map);

    List<Topic>  listMostCommentsTopics();

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKeyWithBLOBs(Topic record);

    int updateByPrimaryKey(Topic record);

    List<Topic> getAllTopics();
    
    List<Topic> getAllTopTopic();

    int clickAddOne(Integer id);

    //获取主题总数
    int getTopicsNum();
    
    List<MyTopic>  getAllTopicsById(@Param("userid")String userid);
    
    List<MyTopic>  getAllTopicsByReplyId(@Param("userid")String userid);
    
    int dianAddOne(Integer id);
    
    List<MyTopic>  getAllCollections(@Param("userid")String userid);
}