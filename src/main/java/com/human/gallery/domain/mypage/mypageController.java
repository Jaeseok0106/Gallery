package com.human.gallery.domain.mypage;

import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@Slf4j
@RequiredArgsConstructor
public class mypageController {

    @GetMapping("/mypage")
    public String mypage(@SessionAttribute(name = "user", required = false) Users user, Model model ) {
        model.addAttribute("user", user);
        return "mypage/mypage";
    }
}
