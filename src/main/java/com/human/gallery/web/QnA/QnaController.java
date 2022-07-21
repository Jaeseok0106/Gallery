package com.human.gallery.web.QnA;

import java.util.ArrayList;


import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.human.gallery.domain.QnA.iQna;
import com.human.gallery.domain.QnA.qnaDTO;

@Controller
@RequiredArgsConstructor
@Slf4j
public class QnaController {
	private final iQna qna;

	@ResponseBody
	@RequestMapping(value="/qnalist", produces="application/json;charset=utf-8")
	public String doQnalist() {
		ArrayList<qnaDTO> arlist=qna.qnalist();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}

	@RequestMapping("/qna")
	public String doQna(@SessionAttribute(name = "user", required = false) Users user, Model model) {
		model.addAttribute("user",user);
		return "qna/qnalist";
	}

	@RequestMapping(value="/detail", produces="application/json;charset=utf-8")
	public String doDetail(
			@SessionAttribute(name = "user", required = false) Users user,
			@RequestParam int id, Model model) {
		model.addAttribute("user",user);
		qnaDTO qdto=qna.selqna(id);
		model.addAttribute("qdto",qdto);
		qnaDTO nepr=qna.nepr(id);
		model.addAttribute("nepr", nepr);
		qna.viewcount(id);
		return "qna/detail";
	}

	@RequestMapping("/new")
	public String doNew(@SessionAttribute(name = "user", required = false) Users user,Model model) {
		log.info("글쓰기에 넘어옴");
		model.addAttribute("user",user);
		return "qna/qnawrite";
	}

	@PostMapping("/addqna")
	public String doInsert(@RequestParam String title, @RequestParam String content, @RequestParam int writer) {
		qna.addqna(title, content, writer);
		return "redirect:/qna";
	}

	@RequestMapping("/up")
	public String doUp(@SessionAttribute(name = "user", required = false) Users user,Model model,
					   @RequestParam int id) {
		log.info("수정으로 넘어옴");
		model.addAttribute("user",user);
		qnaDTO qdto=qna.selqna(id);
		model.addAttribute("qdto",qdto);
		return "qna/qnaup";
	}

	@RequestMapping("/upqna")
	public String doUpdate(@RequestParam String title, @RequestParam String content, @RequestParam int id) {
		qna.upqna(title, content, id);
		return "redirect:/qna";
	}

	@RequestMapping("/delqna")
	public String doDelete(@RequestParam int id) {
		qna.delqna(id);
		return "redirect:/qna";
	}

	@ResponseBody
	@PostMapping("/qna/like")
	public int doLike(@RequestParam int postid, @RequestParam int userid) {
		int heartcheck=qna.heart(postid, userid);
		if(heartcheck==0) {
			qna.plusheart(postid);
			qna.addheart(postid, userid);
		}
		return heartcheck;
	}

	@ResponseBody
	@RequestMapping(value="/listdate", produces="application/json;charset=utf-8")
	public String doListdate() {
		ArrayList<qnaDTO> arlist=qna.listdate();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/descdate", produces="application/json;charset=utf-8")
	public String doDescdate() {
		ArrayList<qnaDTO> arlist=qna.descdate();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value="/listview", produces="application/json;charset=utf-8")
	public String doListview() {
		ArrayList<qnaDTO> arlist=qna.listview();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/descview", produces="application/json;charset=utf-8")
	public String doDescview() {
		ArrayList<qnaDTO> arlist=qna.descview();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value="/listheart", produces="application/json;charset=utf-8")
	public String doListheart() {
		ArrayList<qnaDTO> arlist=qna.listheart();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="/descheart", produces="application/json;charset=utf-8")
	public String doDescheart() {
		ArrayList<qnaDTO> arlist=qna.descheart();
		log.info("넘어온 값 = {}", arlist);
		JSONArray ja=new JSONArray();
		for(int i=0; i<arlist.size(); i++) {
			qnaDTO qdto=arlist.get(i);
			JSONObject jo=new JSONObject();
			jo.put("id", qdto.getId());
			jo.put("title", qdto.getTitle());
			jo.put("content", qdto.getContent());
			jo.put("writer", qdto.getWriter());
			jo.put("categoryList", qdto.getCategoryList());
			jo.put("heart", qdto.getHeart());
			jo.put("postdate", qdto.getPostdate());
			jo.put("views", qdto.getViews());
			jo.put("userid", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}

}
