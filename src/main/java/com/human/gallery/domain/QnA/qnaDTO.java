package com.human.gallery.domain.QnA;

import lombok.Data;

@Data
public class qnaDTO {
	private int id;
	private String title;
	private String content;
	private int writer;
	private String userid;
	private int categoryList;
	private int heart;
	private String postdate;
	private int views;
}