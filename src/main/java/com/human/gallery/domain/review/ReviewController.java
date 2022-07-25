package com.human.gallery.domain.review;

import java.util.ArrayList;

import com.human.gallery.domain.user.Users;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.slf4j.Slf4j;

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
		return "review/review";
	}
	@GetMapping("/reviewDetail")
	public String doDetail(@SessionAttribute(name = "user", required = false) Users user,
						   @RequestParam int id, Model model) {
		Review rdto=review.selView(id);
		Review ndto=review.movePage(id);
		review.count(id);
		model.addAttribute("rdto", rdto);
		model.addAttribute("ndto", ndto);
		model.addAttribute("user",user);
		return "review/reviewDetail";
	}
	@RequestMapping("/writeReview")
	public String doWriteReview(@SessionAttribute(name = "user", required = false) Users user, Model model)
	{
		model.addAttribute("user",user);
		return "review/writeReview";
	}
	@PostMapping("/insertReview")
	public String doInsert(@RequestParam String title, @RequestParam(value = "content" , required = false) String content, @RequestParam int writer) {
		log.info("넘어온 값 = {}, {}, {}", title, content, writer);
		review.insertReview(title, content, writer);
		return "redirect:/review";
	}
	@RequestMapping("/reviewUpdate")
	public String doUpdateReview(@SessionAttribute(name = "user", required = false) Users user,
								 Model model, @RequestParam int id) {
		Review rdto=review.selView(id);
		model.addAttribute("user", user);
		model.addAttribute("rdto", rdto);
		return "review/updateReview";
	}
	@RequestMapping("/updateReview")
	public String doUpdate(@RequestParam(value="title", required=false) String title,
						   @RequestParam(value="content", required=false) String content,
						   @RequestParam int id) {
		review.updateReview(title, content, id);
		return "redirect:/review";
	}
	@RequestMapping("/deleteReview")
	public String doDelete(@RequestParam int id) {
		review.commentDelete(id);
		review.heartDelete(id);
		review.deleteReview(id);
		return "redirect:/review";
	}
	@ResponseBody
	@RequestMapping(value="/review/like", method=RequestMethod.POST)
	public int doLike(@RequestParam int postid, @RequestParam int userid) {
		int findLike=review.findLike(postid, userid);
		if(findLike == 0) {
			review.insertLike(postid, userid);
			review.likeReview(postid);
		}
		return findLike;
	}
}