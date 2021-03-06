package com.human.gallery.domain.review;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {
	ArrayList<Review> reviewList();
	Review selView(int id);
	Review movePage(int id);
	public void count(int id);
	public void deleteReview(int id);
	int insertReview(String title, String content, int writer);
	int updateReview(String title, String content, int id);
	public void likeReview(int id);
}