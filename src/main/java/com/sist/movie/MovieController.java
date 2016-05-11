package com.sist.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;
import com.movie.dao.*;
@Controller("movieController")
// POJO 
public class MovieController {
   @RequestMapping("movie_main.do")
   public String movie_main(HttpServletRequest req)
   {
	   MovieDataManager m=new MovieDataManager();
	   List<MovieDTO> list=m.movieAllData();
	   req.setAttribute("list", list);
	   req.setAttribute("jsp", "../movie/movie_main.jsp");
	   return "main/main";
   }
   @RequestMapping("movie_detail.do")
   public String movie_detail(HttpServletRequest req)
   {
	   String no=req.getParameter("no");
	   MovieDataManager m=new MovieDataManager();
	   MovieDTO d=m.movieDetail(Integer.parseInt(no));
	    File file=new File("C:\\springDev\\springStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MVCFinalProject\\user\\movie\\desc.txt");
		if(file.exists())
			file.delete();
		
		for(int i=1;i<=3;i++)
		{
		  String json=m.movie_review(d.getTitle(), i);
		  m.json_parse(json);
		}
		m.wordcloud();
	   List<String> list=m.read_review();
	   req.setAttribute("list", list);
	   req.setAttribute("vo", d);
	   req.setAttribute("jsp", "../movie/movie_detail.jsp");
	   return "main/main";
   }
   @RequestMapping("movie_reserve.do")
   public String movie_reserve(HttpServletRequest req)
   {
	   req.setAttribute("jsp", "../movie/movie_reserve.jsp");
	   return "main/main";
   }
   @RequestMapping("movie_info.do")
   public static String movie_info(HttpServletRequest req)
   {
	   List<MovieInfoVO> list=MovieDAO.movieAllData();
	   req.setAttribute("list", list);
	   return "movie/movie_info";
   }
   @RequestMapping("theater_info.do")
   public static String theater_info(HttpServletRequest req)
   {
	   try
	   {
		   String mno=req.getParameter("mno");
		   System.out.println("mno:"+mno);
		   String theater_no=MovieDAO.theaterNumber(Integer.parseInt(mno));
		   // 1,2,3,4,5,6
		   System.out.println("theater_no:"+theater_no);
		   List<TheaterInfoVO> list=new ArrayList<TheaterInfoVO>();
		   StringTokenizer st=new StringTokenizer(theater_no, ",");
		   while(st.hasMoreTokens())
		   {
			   TheaterInfoVO vo=MovieDAO.theaterAllData(
					       Integer.parseInt(st.nextToken()));
			   list.add(vo);
		   }
		   req.setAttribute("list", list);
	   }catch(Exception ex)
	   {
		   System.out.println("theater_info:"+ex.getMessage());
	   }
	   return "movie/theater_info";
   }
   @RequestMapping("reserve_date.do")
   public String reserve_date(HttpServletRequest req)
   {
	   Date date=new Date();
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	   StringTokenizer st=new StringTokenizer(sdf.format(date), "-");
	   int year=Integer.parseInt(st.nextToken());
	   int month=Integer.parseInt(st.nextToken());
	   int day=Integer.parseInt(st.nextToken());
	   int[] lastDay={31,28,31,30,31,30,
			          31,31,30,31,30,31};
	   int total=((year-1)*365)+((year-1)/4)-((year-1)/100)
			     +((year-1)/400);
	   if(((year%4==0)&&(year%100!=0))||(year%400==0))
		    lastDay[1]=29;
	   else
		    lastDay[1]=28;
	   for(int i=0;i<month-1;i++)
	   {
		   total+=lastDay[i];
	   }
	   total++;
	   String[] strWeek={"일","월","화","수","목","금","토"};
	   int week=total%7;
	   
	   req.setAttribute("year", year);
	   req.setAttribute("month", month);
	   req.setAttribute("day", day);
	   req.setAttribute("week", week);
	   List<String> weekList=new ArrayList<String>();
	   for(String s:strWeek)
	   {
		   weekList.add(s);
	   }
	   req.setAttribute("weekList", weekList);
	   req.setAttribute("lastDay", lastDay[month-1]);
	   /*List<WeekVO> list=new ArrayList<WeekVO>();
	   int week=total%7;
	   String color="black";
	   for(int i=day;i<=lastDay[month-1];i++)
	   {
		   if(week==0)
			   color="red";
		   else if(week==6)
			   color="blue";
		   else
			   color="black";
		   WeekVO vo=new WeekVO();
		   vo.setDay(i);
		   vo.setWeek(strWeek[week]);
		   vo.setColor(color);
		   list.add(vo);
		   week++;
	   }
	   */
	   //req.setAttribute("list", list);
	   return "movie/reserve_date";
   }
   @RequestMapping("reserve_time.do")
   public String reserve_time(HttpServletRequest req)
   {
	   String day=req.getParameter("day");
	   String timeno=MovieDAO.reserveDateData(Integer.parseInt(day));
	   StringTokenizer st=new StringTokenizer(timeno, ",");
	   List<TimeInfoVO> list=new ArrayList<TimeInfoVO>();
	   while(st.hasMoreTokens())
	   {
		   TimeInfoVO vo=MovieDAO.timeAllData(Integer.parseInt(st.nextToken()));
		   list.add(vo);
	   }
	   req.setAttribute("list", list);
	   req.setAttribute("count", list.size());
	   return "movie/reserve_time";
   }
   @RequestMapping("reserve_inwon.do")
   public String reserve_inwon(HttpServletRequest req)
   {
	   return "movie/reserve_inwon";
   }
   @RequestMapping("reserve_ok.do")
   public String reserve_ok(HttpServletRequest req)
   throws Exception
   {
	   req.setCharacterEncoding("EUC-KR");
	   String title=req.getParameter("title");
	   String theater=req.getParameter("theater");
	   String day=req.getParameter("day");
	   String time=req.getParameter("time");
	   String inwon=req.getParameter("inwon");
	   String price=req.getParameter("price");
	   /*System.out.println(title+" "+theater+" "
			   +day+" "+time+" "+inwon+" "+price);*/
	   HttpSession session=req.getSession();
	   String id=(String)session.getAttribute("id");
	   ReserveVO vo=new ReserveVO();
	   vo.setId(id);
	   vo.setTitle(title);
	   vo.setTheater(theater);
	   vo.setDay(day);
	   vo.setInwon(Integer.parseInt(inwon));
	   vo.setPrice(Integer.parseInt(price));
	   vo.setTime(time);
	   MovieDAO.reserveInsert(vo);
	   return "movie/reserve_ok";
   }
   @RequestMapping("mypage.do")
   public String mypage(HttpServletRequest req)
   {
	   try
	   {
		   HttpSession session=req.getSession();
		   String id=(String)session.getAttribute("id");
		   List<ReserveVO> list=MovieDAO.reserveUserAllData(id);
		   req.setAttribute("list", list);
		   req.setAttribute("jsp", "../movie/mypage.jsp");
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   return "main/main";
   }
   @RequestMapping("admin.do")
   public String admin(HttpServletRequest req)
   {
	   List<ReserveVO> list=MovieDAO.reserveAdminAllData();
	   req.setAttribute("list", list);
	   req.setAttribute("jsp", "../movie/admin.jsp");
	   return "main/main";
   }
   @RequestMapping("admin_ok.do")
   public String admin_ok(HttpServletRequest req)
   {
	   String no=req.getParameter("no");
	   MovieDAO.reserveCheckUpdate(Integer.parseInt(no));
	   return "movie/admin_ok";
   }
   @RequestMapping("recommend.do")
   public String recommend(HttpServletRequest req)
   {
		String[] feel = {"사랑","로맨스","매력","즐거움","스릴",
				"소름","긴장","공포","유머","웃음","개그",
				"행복","전율","경이","우울","절망","신비",
				"여운","희망","긴박","감동","감성","휴머니즘",
				"자극","재미","액션","반전","비극","미스테리",
				"판타지","꿈","설레임","흥미","풍경","일상",
				"순수","힐링","눈물","그리움","호러","충격","잔혹"};
	   List<String> list = new ArrayList<String>();
	   for(String s:feel)
	   {
		   list.add(s);
	   }
	   req.setAttribute("list", list);
	   req.setAttribute("jsp", "../movie/recommend.jsp");
	   return "main/main";
   }
   @RequestMapping("feel.do")
   public String feel(HttpServletRequest req)
   {
	   MovieDataManager m=new MovieDataManager();
	   List<MovieDTO> list=m.movieAllData();
	   req.setAttribute("list", list);
	   req.setAttribute("jsp", "../movie/feel.jsp");
	   return "main/main";
   }
}






