package com.human.gallery.domain.faq;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ifaq {
    ArrayList<faqDTO> list(String id);


}
