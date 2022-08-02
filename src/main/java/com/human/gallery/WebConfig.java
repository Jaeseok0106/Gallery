package com.human.gallery;

import com.human.gallery.domain.interceptor.AdminCheckInterceptor;
import com.human.gallery.domain.interceptor.LoginCheckInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 비로그인 요청막기

        registry.addInterceptor(new LoginCheckInterceptor())
                .order(1)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/", "/letter", "/visit", "/exhibit", "/exhibit/detail/**",
                        "/artist", "/artist/detail/**", "/review", "/reviewDetail",
                        "/qna", "/detail", "/FAQ", "/login", "/logout", "/signin",
                        "/notice", "/content", "/css/**", "/*.ico", "/error", "/js/**",
                        "/logo.png", "/getComment", "/getCommentNum", "/loginButton.png",
                        "/director2.png", "/exhibit/*.jpg", "/artist/*.jpg", "/artist/*.png", "/artist/*.jpeg",
                        "/artist/*.JPG",
                        "/ckeditor/**", "/1.jpg" ,"/2.jpg", "/3.jpeg", "/exhibit/*.JPG", "/*.png", "/*.PNG",
                        "/google/**","/auth/kakao/callback", "/kakao/signin", "/findMyId/**", "/findMyPwd/**"
                );
        registry.addInterceptor(new AdminCheckInterceptor())
                .order(1)
                .addPathPatterns("/artist/upload", "/artist/delete/**", "/artist/modify/**"
                ,"/exhibit/modify/**","/exhibit/upload/**", "/exhibit/delete/**", "/listuser",
                        "/write", "/update/**", "/faqwrite", "/faqupdate/**", "/faq/delete",
                        "/content/delete"
                );

    }
}
