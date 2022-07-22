package com.human.gallery.domain.user;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/oauth")
@Slf4j
public class OAuthController {
        /**
         * 카카오 callback
         * [GET] /oauth/kakao/callback
         */
        @ResponseBody
        @GetMapping("/kakao")
        public void kakaoCallback(@RequestParam String code) {
            log.info(code);
        }
    }