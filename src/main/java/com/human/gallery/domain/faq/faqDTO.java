package com.human.gallery.domain.faq;

import lombok.Data;

@Data
public class faqDTO {
    private int id;
    private String title;
    private String content;
    private int writer;
    private int categoryList;
    private int heart;
    private String postdate;
    private int views;
    private String userid;
    private int next;
    private int prev;

}
