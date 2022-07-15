package com.human.gallery.domain.notice;

import com.human.gallery.domain.QnA.qnaDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.ArrayList;

@Mapper
public interface inotice {
    ArrayList<noticeDTO> listnotice();
    noticeDTO noticecontent(int id);

    noticeDTO nepr(int id);
    public void count(int views,int id);
    void delete(String id);
    int addnotice(String title, String content);
    int updatenotice(String title, String content, int id); //게시판테이블 update
}
