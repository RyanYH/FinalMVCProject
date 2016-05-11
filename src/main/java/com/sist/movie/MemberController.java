package com.sist.movie;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.member.dao.MemberDAO;
import com.member.dao.MemberVO;
import com.member.dao.ZipcodeVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

@Controller("memberController")
public class MemberController {
	@RequestMapping("join.do")
	public String memberJoin(HttpServletRequest req) {
		req.setAttribute("jsp", "../member/join.jsp");
		return "main/main";
	}

	@RequestMapping("idcheck_ok.do")
	public String memberIdCheck(HttpServletRequest req) {
		String id = req.getParameter("id");
		int count = MemberDAO.memberIdCheck(id);
		req.setAttribute("count", count);
		// req.setAttribute("jsp", "../member/idcheck_ok.jsp");
		return "memeber/idcheck_ok";
	}

	@RequestMapping("postfind.do")
	public String memberPostFind(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String dong = req.getParameter("dong");
		System.out.println(dong);
		// DB¿¬µ¿
		List<ZipcodeVO> list = MemberDAO.memberPostFind(dong);
		int count = MemberDAO.memberPostCount(dong);
		req.setAttribute("list", list);
		req.setAttribute("count", count);
		return "member/postfind_ok";
	}
	   @RequestMapping("login.do")
	   public String memberLogin(HttpServletRequest req)
	   {
		   String id = req.getParameter("id");
		   String pwd = req.getParameter("pwd");
		   System.out.println(id+"||"+pwd);
		   int count = MemberDAO.memberIdCheck(id);
		   String result="";
		   if(count==0)
		   {
			   result="NOID";
		   }
		   else{
			   MemberVO vo = MemberDAO.memberInfoData(id);
			   if(pwd.equals(vo.getPwd()))
			   {
				   HttpSession session = req.getSession();
				   session.setAttribute("id", id);
				   session.setAttribute("name", vo.getName());
				   session.setAttribute("admin", vo.getAdmin());
				   result="OK";
			   }
			   else
			   {
				   result="NOPWD";
			   }
		   }
		   req.setAttribute("result", result);
		   return "member/login_ok";
	   }
	   @RequestMapping("logout.do")
	   public String memberLogout(HttpServletRequest req)
	   {
		   HttpSession session=req.getSession();
		   session.invalidate();
		   return "../index";
	   }
}
