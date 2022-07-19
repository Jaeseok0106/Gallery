package com.human.gallery.domain.faq;

import com.human.gallery.domain.QnA.qnaDTO;
import com.human.gallery.domain.notice.noticeDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.ArrayList;

@Mapper
public interface ifaq {
    ArrayList<faqDTO> listfaq();
}
