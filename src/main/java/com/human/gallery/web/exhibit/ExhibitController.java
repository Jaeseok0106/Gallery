package com.human.gallery.web.exhibit;

import com.human.gallery.domain.exhibit.Exhibit;
import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ExhibitController {

    @GetMapping("/exhibit")
    public String viewExhibit(@SessionAttribute(name = "user", required = false) Users user,
                              @ModelAttribute("exhibit") Exhibit exhibit,
                              Model model) {

        model.addAttribute("user", user);
        return "exhibit/exhibit";
    }

    @GetMapping("/exhibit" +
            "/upload")
    public String viewUpload(@SessionAttribute(name = "user", required = false) Users user,
                             Model model) {
        model.addAttribute("user", user);
        return "exhibit/exhibitUpload";
    }
}
