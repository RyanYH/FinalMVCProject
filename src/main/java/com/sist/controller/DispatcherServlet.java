package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WebApplicationContext wc;
    private List<String> list=new ArrayList<String>();
    private ViewResolver vr;
	public void init(ServletConfig config) throws ServletException {
		String path=config.getInitParameter("contextConfigLocation");
		System.out.println(path);
	    wc=new WebApplicationContext(path);
	    list=wc.list;
	    vr=new ViewResolver();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			// list.do
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1);
			for(String strClass:list)
			{
				Class clsName=Class.forName(strClass);
				if(clsName.isAnnotationPresent(Controller.class)==false)
					continue;
				Object obj=clsName.newInstance();
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					// @RequestMapping("a.do")
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd))
					{
						// 메소드 찾기 완료 => 수행
						String jspName=(String)m.invoke(obj, request);
						String jsp=vr.jspFind(jspName);
						
						RequestDispatcher rd=
								request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return;
					}
				}
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

}





