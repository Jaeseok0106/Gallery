package com.human.gallery.domain.notice;

import java.util.ArrayList;
import java.util.List;

import com.human.gallery.domain.paging.pageDTO;
import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
@RequiredArgsConstructor
public class noticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(noticeController.class);
	private final inotice board_post;

	// 리스트 불러오기
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@SessionAttribute(name = "user", required = false) Users user, Model model,
						 @ModelAttribute("paging") pageDTO paging, @ModelAttribute("sort") String sort,
						 @RequestParam(required = false, defaultValue = "tc") String type,
						 @RequestParam(required = false) String keyword) {
		model.addAttribute("user", user);
		model.addAttribute("paging", paging);
		paging.setType(type);
		paging.setKeyword(keyword);
		int cnt=board_post.getCount(paging);
		paging.setTotalRowCount(cnt);
		paging.pageSetting();
		List<noticeDTO> listnotice=board_post.listnotice(paging);
		model.addAttribute("listnotice",listnotice);
		return "notice/notice";
	}

	// 상세보기
	@RequestMapping(value="/content", produces="application/json;charset=utf-8")
	public String docontent(@SessionAttribute(name = "user", required = false) Users user,
							@RequestParam int id, Model model) {
		noticeDTO ndto=board_post.noticecontent(id);
		model.addAttribute("ndto",ndto);
		int views = ndto.getViews() + 1;
		board_post.count(views,id);
		noticeDTO nepr=board_post.nepr(id);
		model.addAttribute("nepr",nepr);
		model.addAttribute("user",user);
		return "notice/noticecontent";
	}

	// 글 작성 탭으로 정보 받아오기
	@GetMapping("/write")
	public String dowrite(@SessionAttribute(name = "user", required = false) Users user,Model model) {
		model.addAttribute("user", user);
		return "notice/noticewrite";
	}

	// 새글 추가
	@PostMapping("/write")
	public String dowrite2(@ModelAttribute("notice") noticeDTO notice) {
		board_post.addnotice(notice.getTitle(),notice.getContent());
		return "notice/noticewrite";
	}
	@RequestMapping("/content/delete")
	public String dodelete(@RequestParam("id") String id) {
		log.info("넘어온 값 = {}" , id);
		board_post.heartDelete(id);
		board_post.delete(id);
		return "redirect:/notice";
}
	@GetMapping("/update/{id}")
	public String doupno(@SessionAttribute(name = "user", required = false) Users user,Model model, @PathVariable int id){
		model.addAttribute("user", user);
		noticeDTO ndto=board_post.noticecontent(id);
		model.addAttribute("ndto",ndto);
		return "notice/noticeupdate";
	}

	// 글 업데이트
	@PostMapping("/update/{id}")
	public String doupdate(@ModelAttribute("notice") noticeDTO notice,
						   @PathVariable("id") int id){
		log.info(notice.getContent());
		board_post.updatenotice(notice.getTitle(),notice.getContent(),id);
		return "redirect:/content?id="+id;
	}

	// 게시글 삭제
	@RequestMapping("/content/delete")
	public String dodelete(@RequestParam("id") String id) {
		board_post.delete(id);
		return "redirect:/notice";
	}
	@ResponseBody
	@RequestMapping(value="/notice/like", method=RequestMethod.POST)
	public int doLike(@RequestParam int postid, @RequestParam int userid) {
		int findLike=board_post.findLike(postid, userid);
		if(findLike == 0) {
			board_post.insertLike(postid, userid);
			board_post.likeNotice(postid);
		}
		return findLike;
	}

	// 추천수
	@ResponseBody
	@RequestMapping(value="/notice/like", method=RequestMethod.POST)
	public int doLike(@RequestParam int postid, @RequestParam int userid) {
		int findLike=board_post.findLike(postid, userid);
		if(findLike == 0) {
			board_post.insertLike(postid, userid);
			board_post.likeNotice(postid);
		}
		return findLike;
	}
}
