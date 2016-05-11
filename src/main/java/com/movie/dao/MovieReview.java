package com.movie.dao;
/*
 *   String[] feel = {"사랑","로맨스","매력","즐거움","스릴",
				"소름","긴장","공포","유머","웃음","개그",
				"행복","전율","경이","우울","절망","신비",
				"여운","희망","긴박","감동","감성","휴머니즘",
				"자극","재미","액션","반전","비극","미스테리",
				"판타지","꿈","설레임","흥미","풍경","일상",
				"순수","힐링","눈물","그리움","호러","충격","잔혹"};
 */
import java.io.*;
import java.net.*;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

import kr.co.shineware.util.common.model.Pair;
public class MovieReview {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scan=new Scanner(System.in);
        System.out.print("영화명:");
        String title=scan.next();
        for(int i=1;i<=20;i++)
        {
          String review=movie_review(title, i);
          //System.out.println(review);
          jsonParse(review);
        }
        movieFeel();
	}
    public static String movie_review(String movie_name,int page)
    {
    	StringBuffer sb=new StringBuffer();
    	try
    	{
    		String key="7e0f8b764675ac488e999d33f73f4aa9";
    		URL url=new URL("https://apis.daum.net/search/blog?apikey="+key
    				+"&q="+URLEncoder.encode(movie_name, "UTF-8")
    				+"&output=json&result=20&pageno="+page);
    		HttpURLConnection conn=
    				  (HttpURLConnection)url.openConnection();
    		if(conn!=null)
    		{
    			BufferedReader in=
    				new BufferedReader(
    						new InputStreamReader(conn.getInputStream(), "UTF-8"));
    			String data="";
    			while(true)
    			{
    				data=in.readLine();
    				if(data==null) break;
    				sb.append(data+"\n");
    			}
    		}
    	}catch(Exception ex){}
    	return sb.toString();
    }
    /*
     *    {channel:{item:[{},{}]}}
     *    {} => JSONObject
     *    [] => JSONArray
     *    
     *    "pubDate":"20160311122000",
     *    "author":"백작부인과 호위무사",
     *    "title":"[영화] &lt;b&gt;귀향&lt;/b&gt;(鬼鄕)",
     *    "description":"[이번 주말 300만 돌파 앞둔 &#39;&lt;b&gt;귀향&lt;/b&gt;&#39;] 분노보다 위로를\u2026 그 진심에 관객이 응답했다 변희원 기자 &lt;조선일보&gt; 2016년 3월 11일 &#39;치유&#39; 
     */
    public static void jsonParse(String json)
    {
    	try
    	{
    		JSONParser jp=new JSONParser();
    		JSONObject jo=(JSONObject)jp.parse(json);
    		JSONObject channel=(JSONObject)jo.get("channel");
    		JSONArray item=(JSONArray)channel.get("item");
    		String desc="";
    		for(int i=0;i<item.size();i++)
    		{
    			JSONObject obj=(JSONObject)item.get(i);
    			String data=(String)obj.get("description");
    			desc+=data+"\n";
    		}
    		desc=desc.replaceAll("[A-Za-z0-9]", "");
    		desc=desc.replace("&", "");
    		desc=desc.replace("?", "");
    		desc=desc.replace(";", "");
    		desc=desc.replace("/", "");
    		desc=desc.replace(".", "");
    		desc=desc.replace("#", "");
    		//System.out.println(desc);
    		FileWriter fw=new FileWriter("c://data//desc.txt");
    		fw.write(desc);
    		fw.close();
    	}catch(Exception ex){}
    }
    public static void movieFeel()
    {
    	String[] feel = {"사랑","로맨스","매력","즐거움","스릴",
				"소름","긴장","공포","유머","웃음","개그",
				"행복","전율","경이","우울","절망","신비",
				"여운","희망","긴박","감동","감성","휴머니즘",
				"자극","재미","액션","반전","비극","미스테리",
				"판타지","꿈","설레임","흥미","풍경","일상",
				"순수","힐링","눈물","그리움","호러","충격","잔혹"};
    	/*int[] count=new int[feel.length];
    	try
    	{
    		RConnection rc=new RConnection();
    		
    		rc.voidEval("library(KoNLP)");
    		rc.voidEval("f<-file(\"c:/image/desc.txt\")");
    		rc.voidEval("review<-readLines(f)");
    		rc.voidEval("nouns<-sapply(review,extractNoun,USE.NAMES=F)");
    		rc.setStringEncoding("utf8");
    		for(int i=1;i<=20;i++)
    		{
	    		REXP p=rc.eval("nouns[["+i+"]]");
	    		String[] data=p.asStrings();
	    		for(int j=0;j<feel.length;j++)
	    		{
		    		for(String s:data)
		    		{
		    			if(feel[j].equals(s))
		    			{
		    				count[j]++;
		    			}
		    		}
	    		}
    		}
    		
    		for(int i=0;i<feel.length;i++)
    		{
    			if(count[i]==0)continue;
    			System.out.println(feel[i]+" "+count[i]);
    		}
    		
    	}catch(Exception ex){}
    	*/
    }
    /*public static void komo(String s){
		List<List<Pair<String,String>>> result=komoran.analyze(s);
		
		for (List<Pair<String, String>> eojeolResult : result) {
			for (Pair<String, String> wordMorph : eojeolResult) {
				if(wordMorph.getSecond().equals("NNG")||wordMorph.getSecond().equals("NNP")){
					boolean ch=true;
					for(Word tmp:list){
						if(tmp.getWord().equals(wordMorph.getFirst())){
							int count=tmp.getCount()+1;
							tmp.setCount(count);
							ch=false;
							break;
						}
					}
					if(ch){
						Word a=new Word();
						a.setWord(wordMorph.getFirst());
						a.Incerement();
						list.add(a);
					}
				}
			}
		}*/
	
}





