package com.withstars.service;

import java.util.List;
import java.util.Map;

import com.withstars.domain.MyTopic;
import com.withstars.domain.Topic;

public interface TopicService {


    /**
     * 获取全部主题
     */
    List<Topic> getAllTopics();

    /**
     * 获取全部主题及用户信息 用于渲染首页
     */
     List<Topic> listTopicsAndUsers(Map map);

    /**
     * 获取最多评论主题列表
     * @return
     */
    List<Topic> listMostCommentsTopics();

    /**
     * 获取全部主题及用户信息 用于渲染板块页面
     */
    List<Topic> listTopicsAndUsersOfTab(Map map);

    /**
     * 获取指定ID主题
     */
    Topic selectById(Integer id);

    /**
     * 新建主题
     */
    boolean addTopic(Topic topic);

    /**
     * 点击量加一
     */
    boolean clickAddOne(Integer id);

    /**
     * 获取主题总数
     */
    int getTopicsNum();

    List<MyTopic>  getAllTopicsById(String userid);
    
    List<MyTopic>  getAllTopicsByReplyId(String userid);
    
    //点亮加一
    boolean dianAddOne(Integer id);
    
    List<MyTopic>  getAllCollections(String userid);
    
    int insert(Topic record);
    
    List<Topic> getAllTopTopic();
    
    int deleteByPrimaryKey(int id);

}
