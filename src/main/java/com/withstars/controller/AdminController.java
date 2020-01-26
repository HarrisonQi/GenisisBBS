package com.withstars.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.withstars.domain.Reply;
import com.withstars.domain.Sysuser;
import com.withstars.domain.Tab;
import com.withstars.domain.Topic;
import com.withstars.service.SysuserServier;
import com.withstars.service.TabService;
import com.withstars.service.TopicService;
import com.withstars.util.PageBean;
import com.withstars.util.ProduceMD5;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	SysuserServier userService;
	
	@Autowired
	TabService tabService;
	
	@Autowired
	TopicService topicService;

	@RequestMapping("/login")
    public String signout(){
        return "admin/login";
    }
	
	@RequestMapping("gologin")
	@ResponseBody
	public String checkLogin(HttpSession session,HttpServletRequest request) {
		Map<String, Object> u = new HashMap<String, Object>();
		Sysuser user = new Sysuser();
		u.put("uname", request.getParameter("uname"));
		String password= ProduceMD5.getMD5(request.getParameter("pwd"));
		u.put("pwd", password);
		
		user = userService.adminLogin(u);
		if (user != null) {
			session.setAttribute("auser", user);
			System.out.println("auser=" + user);
			return "1";
		} else {
			return "-1";
		}
	}
	
	@RequestMapping("index")
	public String tobbs( ) {
		return "admin/index";
	}
	
	@RequestMapping("editpwd")
	@ResponseBody
	public String editpwd(HttpSession session,HttpServletRequest request) {
		Map<String, Object> u = new HashMap<String, Object>();
		Sysuser user = new Sysuser();
		u.put("uname", "admin");
		String password= ProduceMD5.getMD5(request.getParameter("oldpwd"));
		u.put("pwd", password);
		
		user = userService.adminLogin(u);
		if (user != null) {
			userService.editpwd(ProduceMD5.getMD5(request.getParameter("newpwd")), 
					password, "admin");
			return "1";
		} else {
			return "-1";
		}
	}
	
	
	@RequestMapping("userinfoManage")
	public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/userinfoManage";
	}
	
	@RequestMapping("noticeManage")
	public String noticeManage(ModelMap map) {
		List<Topic> getAllTopics = topicService.getAllTopTopic();
		map.put("topics", getAllTopics);
		return "admin/noticeManage";
	}
	
	@RequestMapping("plateManage")
	public String plateManage(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int total = userService.getCountForTab(cmap);
		pageBean.setTotal(total);
		List<Tab> list = userService.getAllTabs(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		return "admin/plateManage";
	}
	
	@RequestMapping("commentManage")
	public String commentManage(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int total = userService.getCountForReply(cmap);
		pageBean.setTotal(total);
		List<Reply> list = userService.getAllReplyList(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		return "admin/commentManage";
	}
	
	@RequestMapping("noteManage")
	public String noteManage(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		
		int total = userService.getCountForTopic(cmap);
		pageBean.setTotal(total);
		List<Topic> list = userService.getAllTopicList(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		return "admin/noteManage";
	}
	
	@RequestMapping("getAllTabs")
	@ResponseBody
	public List<Tab> allTabs( ) {
		List<Tab> allTabs = tabService.getAllTabs();
		return allTabs;
	}
	
	@RequestMapping("addNotice")
	@ResponseBody
	public int addNotice(HttpServletRequest request) {
		Topic record = new Topic();
		record.setUserId(7);
		record.setTitle(request.getParameter("title"));
		record.setContent(request.getParameter("content"));
		record.setCreateTime(new Date());
		record.setUpdateTime(new Date());
		record.setTabId(Byte.parseByte(request.getParameter("utype")));
		record.setSort("1");
		int insert = topicService.insert(record);
		return insert;
	}
	
	@RequestMapping("fengjin")
	@ResponseBody
	public String fengjin(HttpServletRequest request) {
		userService.editUserStatus(request.getParameter("userid"), 
				request.getParameter("replyid"), request.getParameter("type"));
		return "1";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(HttpServletRequest request) {
		topicService.deleteByPrimaryKey(Integer.valueOf(request.getParameter("id")));
		return "1";
	}
}
