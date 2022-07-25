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

    public void pagingcount(int id);

    ArrayList<noticeDTO> paging();
    public void likeNotice(int id); // 추천 +1
    public int findLike(int postid, int heartid);
    int insertLike(int postid, int heartid);
    void heartDelete(String id);
}
