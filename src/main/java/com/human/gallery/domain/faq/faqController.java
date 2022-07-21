package com.human.gallery.domain.faq;

import java.util.ArrayList;


import com.human.gallery.domain.notice.noticeDTO;
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
    private final ifaq faq_table;
    @GetMapping("/FAQ")
    public String faq(@SessionAttribute(name = "user", required = false) Users user,Model model ) {
        model.addAttribute("user", user);
        return "faq/faq";
    }
    @ResponseBody
    @PostMapping("/FAQ")
    public Object dolistpre(@RequestParam("category") String category){

        ArrayList<faqDTO> list = faq_table.list(category);
        JSONArray ja = new JSONArray();
        for(int i=0; i < list.size(); i++){
            faqDTO cat =list.get(i);
            JSONObject jo = new JSONObject();
            jo.put("question", cat.getQuestion());
            jo.put("answer", cat.getAnswer());
            jo.put("id", cat.getId());
            ja.add(jo);
        }
        return ja;
    }
}
