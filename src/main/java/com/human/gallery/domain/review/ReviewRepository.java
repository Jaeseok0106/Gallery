package com.human.gallery.domain.review;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewRepository {
	ArrayList<Review> reviewList();
}