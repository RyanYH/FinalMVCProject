package com.movie.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;
public class MovieDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   try
		   {
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
			   // id , sql
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public static List<MovieInfoVO> movieAllData()
	   {
		   SqlSession session=ssf.openSession();
		   List<MovieInfoVO> list=session.selectList("movieAllData");
		   session.close();
		   return list;
	   }
	   public static String theaterNumber(int mno)
	   {
		   SqlSession session=ssf.openSession();
		   String list=session.selectOne("theaterNumber",mno);
		   System.out.println(list);
		   session.close();
		   return list;
	   }
	   public static TheaterInfoVO theaterAllData(int tno)
	   {
		   SqlSession session=ssf.openSession();
		   TheaterInfoVO list=session.selectOne("theaterAllData",tno);
		   session.close();
		   return list;
	   }
	   public static String reserveDateData(int no)
	   {
		   SqlSession session=ssf.openSession();
		   String list=session.selectOne("reserveDateData",no);
		   System.out.println(list);
		   session.close();
		   return list;
	   }
	   public static TimeInfoVO timeAllData(int tno)
	   {
		   SqlSession session=ssf.openSession();
		   TimeInfoVO list=session.selectOne("timeAllData",tno);
		   session.close();
		   return list;
	   }
	   public static void reserveInsert(ReserveVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("reserveInsert",vo);
		   session.close();
	   }
	   public static List<ReserveVO> reserveAdminAllData()
	   {
		   SqlSession session=ssf.openSession();
		   List<ReserveVO> list=session.selectList("reserveAdminAllData");
		   session.close();
		   return list;
	   }
	   public static List<ReserveVO> reserveUserAllData(String id)
	   {
		   SqlSession session=ssf.openSession();
		   List<ReserveVO> list=session.selectList("reserveUserAllData",id);
		   session.close();
		   return list;
	   }
	   public static void reserveCheckUpdate(int no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.insert("reserveCheckUpdate",no);
		   session.close();
	   }
}





