package com.human.gallery.domain.review;

import java.util.ArrayList;
import java.util.List;

import com.human.gallery.domain.paging.pageDTO;
import com.human.gallery.domain.user.Users;
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
	
	// 리스트 불러오기
	@GetMapping("/review")
	public String viewReview(@SessionAttribute(name = "user", required = false) Users user, Model model,
							 @ModelAttribute("paging") pageDTO paging, @ModelAttribute("sort") String sort,
							 @RequestParam(required = false, defaultValue = "tc") String type,
							 @RequestParam(required = false) String keyword) {
		model.addAttribute("user",user);
		model.addAttribute("paging", paging);
		paging.setType(type);
		paging.setKeyword(keyword);
		int cnt=review.getCount(paging);
		paging.setTotalRowCount(cnt);
		paging.pageSetting();
		List<Review> reviewList=review.reviewList(paging);
		model.addAttribute("reviewlist",reviewList);
		return "review/review";
	}

	// 상세보기
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

	// 글 작성 탭으로 정보 받아오기
	@RequestMapping("/writeReview")
	public String doWriteReview(@SessionAttribute(name = "user", required = false) Users user, Model model) {
		model.addAttribute("user",user);
		return "review/writeReview";
	}

	// 새글 추가
	@PostMapping("/insertReview")
	public String doInsert(@RequestParam String title, @RequestParam(value = "content" , required = false) String content, @RequestParam int writer) {
		log.info("넘어온 값 = {}, {}, {}", title, content, writer);
		review.insertReview(title, content, writer);
		return "redirect:/review";
	}

	// 유저정보, 기존 글정보 받아오기
	@RequestMapping("/reviewUpdate")
	public String doUpdateReview(@SessionAttribute(name = "user", required = false) Users user,
								 Model model, @RequestParam int id) {
		Review rdto=review.selView(id);
		model.addAttribute("user", user);
		model.addAttribute("rdto", rdto);
		return "review/updateReview";
	}

	// 글 업데이트
	@RequestMapping("/updateReview")
	public String doUpdate(@RequestParam(value="title", required=false) String title,
						   @RequestParam(value="content", required=false) String content,
						   @RequestParam int id) {
		review.updateReview(title, content, id);
		return "redirect:/review";
	}

	// 게시글 삭제
	@RequestMapping("/deleteReview")
	public String doDelete(@RequestParam int id) {
		review.commentDelete(id);
		review.heartDelete(id);
		review.deleteReview(id);
		return "redirect:/review";
	}

	// 추천수
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