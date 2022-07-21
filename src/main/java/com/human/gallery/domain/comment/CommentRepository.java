package com.human.gallery.domain.comment;


import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface CommentRepository {

    Integer getOrder(String boardId);
    void addComment(String postId, String writer, String content, String reparent, String redepth, String reorder);

    ArrayList<Comment> findByPostId(String postId);

    Comment findById(String parentid);
    void updateParentById(String postId, String reorder);

    Integer findNumByPostId(String postId);
    void updateById(String content, String id);

    Integer findChildren(String id);

    void updateByIdWithDelete(String content, String id);

    void deleteById(String id);
    void adjustReorder(String postId, String reorder);

    Integer getMaxReorder(String postId, String redepth, String reparent);
}
