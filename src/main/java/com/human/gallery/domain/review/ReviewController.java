package com.human.gallery.domain.review;

import java.util.ArrayList;

import com.human.gallery.domain.user.Users;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@Slf4j
public class ReviewController {
	
	@Autowired
	private ReviewRepository review;
	
	@ResponseBody
	@RequestMapping(value="/reviewList", produces="application/text;charset=UTF8")
	public String doReviewList() {
		ArrayList<Review> arReview=review.reviewList();
		JSONArray ja=new JSONArray();
		for(int i=0; i<arReview.size(); i++) {
			Review rdto=arReview.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", rdto.getId());
			jo.put("title", rdto.getTitle());
			jo.put("content", rdto.getContent());
			jo.put("writer", rdto.getWriter());
			jo.put("categoryList", rdto.getCategoryList());
			jo.put("heart", rdto.getHeart());
			jo.put("postdate", rdto.getPostdate());
			jo.put("views", rdto.getViews());
			jo.put("user_id", rdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@GetMapping("/review")
	public String viewReview(@SessionAttribute(name = "user", required = false) Users user, Model model)
	{
		model.addAttribute("user", user);
		return "review";
	}
}