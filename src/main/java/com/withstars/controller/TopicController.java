package com.withstars.controller;

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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 主题相关控制类
 */
@Controller
public class TopicController {

    @Autowired
    public TopicServiceImpl topicService;
    @Autowired
    public ReplyServiceImpl replyService;
    @Autowired
    public UserServiceImpl userService;
    @Autowired
    public TabServiceImpl tabService;

    //log4j对象
    private final Log log = LogFactory.getLog(getClass());

    /**
     * 渲染首页
     *
     * @param session
     * @return
     */
    @RequestMapping("/")
    public ModelAndView toMain(HttpSession session,@RequestParam(required = false, value = "count") Integer count,
                               @RequestParam(required = false, value = "page") Integer page,
                               @RequestParam(required = false) String keyword) {
        ModelAndView indexPage = new ModelAndView("cate");
        System.out.println("count:"+count+",page:"+page);
        //全部主题
        Map map = new HashMap();
        if(count==null || page==null){
            count = 7;
            page = 1;
        }
        System.out.println("keyword:"+keyword);
        map.put("start",count*page-count);
        map.put("count",count);
        map.put("keyword", keyword);
        List<Topic> topics = topicService.listTopicsAndUsers(map);
        System.out.println("topics:"+topics);

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        indexPage.addObject("topics", topics);
        indexPage.addObject("lastPageNum", (int)Math.floor(topicsNum/count));
        indexPage.addObject("hotestTopics", hotestTopics);
        indexPage.addObject("topicsNum", topicsNum);
        indexPage.addObject("usersNum", usersNum);
        indexPage.addObject("user", user);
        return indexPage;
    }

    /**
     * 渲染主题详细页面
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/t/{id}")
    public ModelAndView toTopic(@PathVariable("id") Integer id, HttpSession session) {
        //点击量加一
        boolean ifSucc = topicService.clickAddOne(id);
        //获取主题信息
        Topic topic = topicService.selectById(id);
        //获取主题全部评论
        List<Reply> replies = replyService.getRepliesOfTopic(id);
        //获取评论数
        int repliesNum = replyService.repliesNum(id);
        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        //渲染视图
        ModelAndView topicPage = new ModelAndView("detail");
        topicPage.addObject("topic", topic);
        topicPage.addObject("replies", replies);
        topicPage.addObject("repliesNum", repliesNum);
        topicPage.addObject("topicsNum", topicsNum);
        topicPage.addObject("usersNum", usersNum);
        topicPage.addObject("user", user);
        topicPage.addObject("hotestTopics", hotestTopics);
        return topicPage;
    }

    /**
     * 渲染指定板块页面
     */
    @RequestMapping("/tab/{tabNameEn}")
    public ModelAndView toTabPage(@PathVariable("tabNameEn") String tabNameEn,
                                  @RequestParam(required = false) Integer count,
                                  @RequestParam(required = false) Integer page,
                                  @RequestParam(required = false) String keyword,HttpSession session) {
        System.out.println("count:"+count);
        System.out.println("page:"+page);
        Tab tab = tabService.getByTabNameEn(tabNameEn);
        Integer tabId = tab.getId();

        ModelAndView indexPage = new ModelAndView("cate");
        Map map = new HashMap();
        if(count==null || page==null){
            count = 7;
            page = 1;
        }
        map.put("tabId",tabId);
        map.put("start",count*page-count);
        map.put("count",count);
        map.put("keyword", keyword);
        //全部主题
        List<Topic> topics = topicService.listTopicsAndUsersOfTab(map);

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();

        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        indexPage.addObject("topics", topics);
        indexPage.addObject("lastPageNum", (int)Math.ceil(topicsNum/count));
        indexPage.addObject("topicsNum", topicsNum);
        indexPage.addObject("usersNum", usersNum);
        indexPage.addObject("tab", tab);
        indexPage.addObject("user", user);
        indexPage.addObject("hotestTopics", hotestTopics);
        return indexPage;
    }

    /**
     * 发表主题
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/topic/add", method = RequestMethod.POST)
    @ResponseBody
    public String addTopic(HttpServletRequest request, HttpSession session) {
//        ModelAndView indexPage;
        //未登陆
        if (session.getAttribute("userId") == null) {
//            indexPage=new ModelAndView("redirect:/signin");
            return "-1";
        }
        //处理参数
        Integer userId = (Integer) session.getAttribute("userId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Byte tabId = Byte.parseByte(request.getParameter("tab"));
        //新建Topic
        Topic topic = new Topic();
        topic.setUserId(userId);
        topic.setTitle(title);
        topic.setContent(content);
        topic.setTabId(tabId);
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        topic.setSort("0");
        //添加topic
        boolean ifSucc = topicService.addTopic(topic);
        boolean ifSuccAddCredit = userService.addCredit(1, userId);
        if (ifSucc) {
            log.info("添加主题成功!");
        }
//        indexPage=new ModelAndView("redirect:/");

        return "1";
    }

    /**
     * 渲染主题详细页面
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/dianliang/{id}")
    public ModelAndView dianliang(@PathVariable("id") Integer id, HttpSession session
            , HttpServletRequest request) {
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        if (uid == null) {
            ModelAndView nologin = new ModelAndView("nologin");
            return nologin;
        }
        User user = userService.getUserById(uid);


        List<Topic> topics = null;

        String tabNameEn = request.getParameter("tabNameEn");
        if (tabNameEn != null) {
            Tab tab = tabService.getByTabNameEn(tabNameEn);
            Integer tabId = tab.getId();
            Map map = new HashMap();
            map.put("tabId",tabId);
            //全部主题
            topics = topicService.listTopicsAndUsersOfTab(map);
        } else {
            topics = topicService.listTopicsAndUsers(new HashMap());
        }

        //点击量加一
        boolean ifSucc = topicService.dianAddOne(id);
        ModelAndView indexPage = new ModelAndView("cate");

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        indexPage.addObject("topics", topics);
        indexPage.addObject("hotestTopics", hotestTopics);
        indexPage.addObject("topicsNum", topicsNum);
        indexPage.addObject("usersNum", usersNum);
        indexPage.addObject("user", user);
        return indexPage;
    }

}
