package com.human.gallery.domain.faq;

import java.util.ArrayList;



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
public class faqController {

    private static final Logger logger = LoggerFactory.getLogger(faqController.class);
    private final ifaq board_post;
    @GetMapping("/FAQ")
    public String faq(@SessionAttribute(name = "user", required = false) Users user,Model model) {
        model.addAttribute("user", user);
        return "faq/faq";
    }
    @ResponseBody
    @GetMapping("/listfaq")
    public String dolistfaq() {
        ArrayList<faqDTO> listfaq=board_post.listfaq();
        JSONArray ja=new JSONArray();
        for(int i=0; i<listfaq.size(); i++) {
            faqDTO mdto = listfaq.get(i);
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

}
