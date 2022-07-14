package com.human.gallery.domain.review;

import lombok.Data;

@Data
public class Review {
	private int id;
	private String title;
	private String content;
	private int writer;
	private int categoryList;
	private int heart;
	private String postdate;
	private int views;
	private String userid;
	private int next;
	private int last;
}