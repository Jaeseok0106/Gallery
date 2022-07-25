package com.human.gallery.domain.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {
	ArrayList<Review> reviewList();
	Review selView(int id);
	Review movePage(int id);
	public void count(int id);
	void heartDelete(int id);
	public void deleteReview(int id);
	int insertReview(String title, String content, int writer);
	int updateReview(String title, String content, int id);
	public void likeReview(int id); // 추천 +1
	public int findLike(int postid, int heartid);
	int insertLike(int postid, int heartid);
	void commentDelete(int id);

}