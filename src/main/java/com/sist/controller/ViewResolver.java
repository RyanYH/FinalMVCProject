package com.sist.controller;
// "set"+name == m.getName()
public class ViewResolver {
   private String prefix;
   private String suffix;
   public ViewResolver()
   {
	   prefix="user/";
	   suffix=".jsp";
   }
   public String jspFind(String jspName)
   {
	   return prefix+jspName+suffix;
   }
}
