package com.human.gallery.domain.QnA;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface iQna {
	ArrayList<qnaDTO> qnalist(); //qna 테이블 리스트
	qnaDTO selqna(int id); //선택한 글
	qnaDTO nepr(int id); //이전글, 다음글 번호 불러오기
	public void viewcount(int id); //조회수
	//	int addqna(String title, String content, int writer); //qna게시판 add
	int addqna(String title, String content);
	int upqna(String title, String content, int writer, int id); //게시판테이블 update
	int delqna(int id); //delete
}