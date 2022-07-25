package com.human.gallery.domain.notice;

import com.human.gallery.domain.paging.pageDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.ArrayList;
import java.util.List;

@Mapper
public interface inotice {


    public void pagingcount(int id);
    ArrayList<noticeDTO> paging();
    void heartDelete(String id);
    public List<noticeDTO> listnotice(pageDTO paging); // notice 테이블 리스트
    public int getCount(pageDTO paging); // 레코드 개수
    noticeDTO noticecontent(int id); // 선택한 글
    noticeDTO nepr(int id); // 이전글 다음글
    public void count(int views,int id); // 조회수
    int addnotice(String title, String content); // 공지 add
    int updatenotice(String title, String content, int id); // 공지테이블 update
    void delete(String id); // 삭제
    public int findLike(int postid, int heartid); // 중복 조회
    int insertLike(int postid, int heartid); // 추천테이블 add
    public void likeNotice(int id); // 추천 +1
}
