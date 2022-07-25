package com.human.gallery.domain.notice;

import java.util.ArrayList;


import com.human.gallery.domain.paging.criteria;
import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@SessionAttribute(name = "user", required = false) Users user,Model model) {

		model.addAttribute("user", user);
		return "notice/notice";
	}
	@ResponseBody
	@RequestMapping(value="/listnotice", produces="application/text;charset=utf8")
	public String dolistnotice() {
		ArrayList<noticeDTO> listnotice=board_post.listnotice();
		JSONArray ja=new JSONArray();
		for(int i=0; i<listnotice.size(); i++) {
			noticeDTO mdto = listnotice.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", mdto.getId());
			jo.put("title", mdto.getTitle());
			jo.put("content", mdto.getContent());
			jo.put("writer", mdto.getWriter());
			jo.put("categoryList", mdto.getCategoryList());
			jo.put("heart", mdto.getHeart());
			jo.put("postdate", mdto.getPostdate());
			jo.put("views", mdto.getViews());
			jo.put("user_id", mdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
}
	@RequestMapping(value="/content", produces="application/json;charset=utf-8")
	public String docontent(@RequestParam int id,
							@SessionAttribute(name = "user", required = false) Users user,
							Model model) {
		noticeDTO ndto=board_post.noticecontent(id);
		model.addAttribute("ndto",ndto);
		int views = ndto.getViews() + 1;
		board_post.count(views,id);
		noticeDTO nepr=board_post.nepr(id);
		model.addAttribute("nepr",nepr);
		model.addAttribute("user",user);
		return "notice/noticecontent";
	}
	@GetMapping("/write")
	public String dowrite(@SessionAttribute(name = "user", required = false) Users user,Model model) {
		model.addAttribute("user", user);
		return "notice/noticewrite";
	}
	@PostMapping("/write")
	public String dowrite2(@ModelAttribute("notice") noticeDTO notice) {

		log.info("넘어온 값 = {}, {}", notice.getContent(), notice.getTitle());
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
	@PostMapping("/update/{id}")
	public String doupdate(@ModelAttribute("notice") noticeDTO notice,
						   @PathVariable("id") int id){
		log.info(notice.getContent());
		board_post.updatenotice(notice.getTitle(),notice.getContent(),id);
		return "redirect:/content?id="+id;
	}
	@GetMapping("/update/{id}")
	public String doupno(@SessionAttribute(name = "user", required = false) Users user,Model model, @PathVariable int id){
		model.addAttribute("user", user);
		noticeDTO ndto=board_post.noticecontent(id);
		model.addAttribute("ndto",ndto);
		return "notice/noticeupdate";
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

}
