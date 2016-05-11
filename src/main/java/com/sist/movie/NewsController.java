package com.sist.movie;

import javax.servlet.http.HttpServletRequest;


import com.news.dao.NewsManager;
import com.news.dao.item;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.*;


@Controller("newsController")
public class NewsController {
	@RequestMapping("news_main.do")
	public String news_main(HttpServletRequest req) throws Exception
	{
		req.setCharacterEncoding("EUC-KR");
		String find = req.getParameter("ss");
		if(find==null)
			find="박스오피스";
		List<item> list = NewsManager.news_data(find);
		req.setAttribute("list", list);
		req.setAttribute("jsp","../news/news_main.jsp");
		return "main/main";
	}
}
