package com.withstars.controller;

import com.withstars.domain.MyTopic;
import com.withstars.domain.Reply;
import com.withstars.domain.Tab;
import com.withstars.domain.Topic;
import com.withstars.domain.User;
import com.withstars.service.impl.ReplyServiceImpl;
import com.withstars.service.impl.TabServiceImpl;
import com.withstars.service.impl.TopicServiceImpl;
import com.withstars.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import java.util.List;

/**
 * 主控制类
 */
@Controller
public class MainController {

    @Autowired
    public TopicServiceImpl topicService;
    @Autowired
    public ReplyServiceImpl replyService;
    @Autowired
    public UserServiceImpl userService;
    @Autowired
    public TabServiceImpl tabService;

    /**
     * 进入登录页面.
     */
    @RequestMapping(value = {"/signin"})
    public ModelAndView signin(){
        ModelAndView signinPage=new ModelAndView("signin");

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        signinPage.addObject("topicsNum",topicsNum);
        signinPage.addObject("usersNum",usersNum);
        return  signinPage;
    }

    /**
     * 进入注册页面.
     */
    @RequestMapping("/signup")
    public ModelAndView signup(){
        ModelAndView signupPage=new ModelAndView("signup");

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        signupPage.addObject("topicsNum",topicsNum);
        signupPage.addObject("usersNum",usersNum);
        return  signupPage;
    }

    /**
     * 进入新建主题页面
     */
    @RequestMapping(value = {"/new"})
    public ModelAndView newTopic(){
        ModelAndView newTopicPage=new ModelAndView("new");
        List<Tab> tabs=tabService.getAllTabs();

        //获取统计信息
        int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();

        newTopicPage.addObject("tabs",tabs);
        newTopicPage.addObject("topicsNum",topicsNum);
        newTopicPage.addObject("usersNum",usersNum);
        return  newTopicPage;
    }

    /**
     * 配置404页面
     */
    @RequestMapping("*")
    public String notFind(){
        return "404";
    }
    
    /**
     * 查询自己的帖子
     */
    @RequestMapping(value = "/myTopic/{id}")
    public ModelAndView myTopic(@PathVariable("id")Integer id){
    	
    	int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        //获取主题信息
        List<MyTopic> myTopicList = topicService.getAllTopicsById(id+"");
        User user=userService.getUserById(id);
        //渲染视图
        ModelAndView topicPage=new ModelAndView("myTopic");
        topicPage.addObject("myTopicList",myTopicList);
        topicPage.addObject("user",user);
        topicPage.addObject("topicsNum",topicsNum);
        topicPage.addObject("usersNum",usersNum);
        
        //最热主题
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();
        topicPage.addObject("hotestTopics",hotestTopics);
        return  topicPage;
    }
    
    /**
     * 查询自己回复的帖子
     */
    @RequestMapping(value = "/myReplyTopic/{id}")
    public ModelAndView myReplyTopic(@PathVariable("id")Integer id){
    	
    	int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        //获取主题信息
        List<MyTopic> myTopicList = topicService.getAllTopicsByReplyId(id+"");
        User user=userService.getUserById(id);
        //渲染视图
        ModelAndView topicPage=new ModelAndView("myReplyTopic");
        topicPage.addObject("myTopicList",myTopicList);
        topicPage.addObject("user",user);
        topicPage.addObject("topicsNum",topicsNum);
        topicPage.addObject("usersNum",usersNum);
        
      //最热主题
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();
        topicPage.addObject("hotestTopics",hotestTopics);
        return  topicPage;
    }
    
    /**
     * 查询自己回复的帖子
     */
    @RequestMapping(value = "/myCollections/{id}")
    public ModelAndView myCollections(@PathVariable("id")Integer id){
    	
    	int topicsNum=topicService.getTopicsNum();
        int usersNum=userService.getUserCount();
        //获取主题信息
        List<MyTopic> myTopicList = topicService.getAllCollections(id+"");
        User user=userService.getUserById(id);
        //渲染视图
        ModelAndView topicPage=new ModelAndView("myCollections");
        topicPage.addObject("myTopicList",myTopicList);
        topicPage.addObject("user",user);
        topicPage.addObject("topicsNum",topicsNum);
        topicPage.addObject("usersNum",usersNum);
        
        List<Topic> hotestTopics=topicService.listMostCommentsTopics();
        topicPage.addObject("hotestTopics",hotestTopics);
        return  topicPage;
    }
}
