package com.member.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public static int memberIdCheck(String id) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdCheck", id);
		session.close();
		return count;
	}

	public static List<ZipcodeVO> memberPostFind(String dong) {
		SqlSession session = ssf.openSession();
		List<ZipcodeVO> list = session.selectList("memberPostFind", dong);
		session.close();
		return list;
	}

	public static int memberPostCount(String dong) {
		SqlSession session = ssf.openSession();
		int list = session.selectOne("memberPostCount", dong);
		session.close();
		return list;
	}
	public static MemberVO memberInfoData(String id)
	{
		SqlSession session = ssf.openSession();
		MemberVO vo = session.selectOne("memberInfoData", id);
		session.close();
		return vo;
	}
}
