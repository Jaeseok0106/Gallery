package com.human.gallery.web.QnA;

import java.util.List;
import java.util.ArrayList;

import com.human.gallery.domain.QnA.pageDTO;
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

	@RequestMapping("/qna")
	public String Qnalist(@SessionAttribute(name = "user", required = false) Users user, Model model,
						  @ModelAttribute("paging") pageDTO paging) {
		model.addAttribute("user",user);
		int cnt=qna.getCount(paging);
		paging.setTotalRowCount(cnt);
		paging.pageSetting();
		List<qnaDTO> qnalist=qna.qnalist(paging);
		model.addAttribute("qnalist",qnalist);
		List<qnaDTO> listdate=qna.listdate(paging);
		model.addAttribute("listdate",listdate);
		List<qnaDTO> descdate=qna.descdate(paging);
		model.addAttribute("descdate",descdate);
		List<qnaDTO> listview = qna.listview(paging);
		model.addAttribute("listview", listview);
		List<qnaDTO> descview=qna.descview(paging);
		model.addAttribute("descview",descview);
		List<qnaDTO> listheart = qna.listheart(paging);
		model.addAttribute("listheart", listheart);
		List<qnaDTO> descheart=qna.descheart(paging);
		model.addAttribute("descheart",descheart);
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
}
