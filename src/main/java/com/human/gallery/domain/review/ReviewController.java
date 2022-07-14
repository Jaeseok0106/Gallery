package com.human.gallery.domain.review;

import java.util.ArrayList;

import lombok.RequiredArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
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
			jo.put("userid", rdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@RequestMapping("/review")
	public String viewReview()
	{
		return "review";
	}
	@RequestMapping(value="/reviewDetail", produces="application/json;charset=UTF8")
	public String doDetail(@RequestParam int id, Model model) {
		Review rdto=review.selView(id);
		Review ndto=review.movePage(id);
		model.addAttribute("rdto", rdto);
		model.addAttribute("ndto", ndto);
		return "reviewDetail";
	}
	@RequestMapping("/writeReview")
	public String doWriteReview()
	{
		return "writeReview";
	}

}