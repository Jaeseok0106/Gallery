package com.human.gallery.web.comment;


import com.human.gallery.domain.comment.Comment;
import com.human.gallery.domain.comment.CommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class CommentController {

    private final CommentRepository commentRepository;


    @PostMapping("/commentWrite")
    public String doInsertComment(@ModelAttribute("comment") Comment comment) {
        log.info("넘어온 값만 확인해봅시다 = {}", comment);
        if (comment.getId() == null || comment.getId().equals("")) {
            if (comment.getReparent() != null) {
                Comment parentComment = commentRepository.findByParentId(comment.getReparent());
                log.info("부모 댓글 = {}", parentComment);
                int tempDepth = Integer.parseInt(parentComment.getRedepth()) + 1;
                comment.setRedepth(String.valueOf(tempDepth));
                int tempReOrder = Integer.parseInt(parentComment.getReorder()) + 1;
                comment.setReorder(String.valueOf(tempReOrder));
                log.info("부모 댓글과 비교해서 수정 후 = {}", comment);
                commentRepository.updateParentById(parentComment.getPostId(), parentComment.getReorder());
            } else {
                Integer reorder = commentRepository.getOrder(comment.getPostId());
                comment.setReorder(String.valueOf(reorder));
                comment.setRedepth(String.valueOf(0));
                comment.setReparent(String.valueOf(0));
                log.info("설정 후 댓글 값 = {}", comment);
            }
            commentRepository.addComment(comment.getPostId(), comment.getWriter(), comment.getContent(), comment.getReparent(), comment.getRedepth(), comment.getReorder());
        } else {
            //여기는 이제 수정하는곳
        }
        return null;
    }
    @PostMapping("/getComment")
    public String returnComment(@RequestParam("postId") String postId) {

        List<Comment> commentList = commentRepository.findByPostId(postId);
        log.info("넘어온 값 = {}", commentList);
        JSONArray jA = new JSONArray();
        for (int i = 0; i < commentList.size(); i++) {
            Comment comment = commentList.get(i);
            JSONObject jO = new JSONObject();
            jO.put("id", comment.getId());
            jO.put("redepth", comment.getRedepth());
            jO.put("writeName", comment.getWriteName());
            jO.put("writer",comment.getWriter());
            jO.put("content", comment.getContent());
            jO.put("postDate", comment.getPostDate());
            log.info("JSON Object에 담긴 값 = {}", jO);
            jA.add(jO);
        }
        log.info("JSON Array에 담겨 넘어갈 값 = {}", jA);
        return jA.toJSONString();
    }
}
