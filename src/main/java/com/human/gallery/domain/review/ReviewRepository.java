package com.human.gallery.domain.review;

import java.util.ArrayList;
import java.util.List;

import com.human.gallery.domain.QnA.qnaDTO;
import com.human.gallery.domain.paging.pageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {

	public void count(int id);
	void heartDelete(int id);

	void commentDelete(int id);

	public List<Review> reviewList(pageDTO paging); // 리뷰 테이블 리스트
	public int getCount(pageDTO paging); // 레코드 개수
	Review selView(int id); // 선택한 글
	Review movePage(int id); // 이전글, 다음글 번호 불러오기
	public void count(int id); // 조회수
	public void deleteReview(int id); //delete
	int insertReview(String title, String content, int writer); // 리뷰게시판 add
	int updateReview(String title, String content, int id); // 게시판테이블 update
	public void likeReview(int id); // 추천 +1
	public int findLike(int postid, int heartid); // 추천리스트 카운트 조회
	int insertLike(int postid, int heartid); // 추천테이블에 add
}