package com.human.gallery.domain.comment;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentRepository {

    Integer getOrder(String boardId);
    void addComment(String postId, String writer, String content, String reparent, String redepth, String reorder);
}
