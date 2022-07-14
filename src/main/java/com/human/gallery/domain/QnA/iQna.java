package com.human.gallery.domain.QnA;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface iQna {
	ArrayList<qnaDTO> qnalist();
	int addqna(String title, String content, int writer);
	int upqna(String title, String content, int writer, int id);
	int delqna(int id);
	qnaDTO selqna(int id);
}