package com.news.dao;

import java.util.*;

public class Channel {
	private List<item> item = new ArrayList<item>();

	public List<item> getItem() {
		return item;
	}
	@javax.xml.bind.annotation.XmlElement
	public void setItem(List<item> item) {
		this.item = item;
	}
	

}
