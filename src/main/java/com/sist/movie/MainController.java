package com.sist.movie;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.movie.dao.*;
@Controller("mainController")
public class MainController {
   @RequestMapping("main.do")
   public String main_page(HttpServletRequest req)
   {
	   MovieDataManager m=new MovieDataManager();
	   List<MovieDTO> list=m.movieAllData();
	   List<String> rankList=m.movie_rank();
	   List<String> reserveList=m.movie_reserve();
	   List<String> boxList=m.movie_boxoffice();
	   req.setAttribute("rankList", rankList);
	   req.setAttribute("reserveList", reserveList);
	   req.setAttribute("boxList", boxList);
	   req.setAttribute("list", list);
	   req.setAttribute("jsp", "default.jsp");
	   return "main/main";
   }
}