package com.human.gallery.web.QnA;

import java.util.ArrayList;

import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.gallery.domain.QnA.iQna;
import com.human.gallery.domain.QnA.qnaDTO;
import org.springframework.web.bind.annotation.SessionAttribute;

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
			jo.put("user_id", qdto.getUserid());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	
	@RequestMapping("/qna")
	public String doQna(@SessionAttribute(name = "user", required = false) Users user, Model model) {
		model.addAttribute("user",user);
		return "qnalist";
	}
	
	@RequestMapping(value="/detail", produces="application/json;charset=utf-8")
	public String doSelqna(
			@SessionAttribute(name = "user", required = false) Users user,
			@RequestParam int id, Model model) {
		qnaDTO qdto=qna.selqna(id);
		model.addAttribute("qdto",qdto);
		model.addAttribute("user",user);
		return "detail";
	}
}
