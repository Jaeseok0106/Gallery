package com.human.gallery.web.comment;


import com.human.gallery.domain.comment.Comment;
import com.human.gallery.domain.comment.CommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class CommentController {

    private final CommentRepository commentRepository;


    @PostMapping("/commentWrite")
    public void doInsertComment(@ModelAttribute("comment") Comment comment) {
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
            log.info("이제 너가 나와야 하는거 맞지?");
            commentRepository.updateById(comment.getContent(), comment.getId());
        }
    }
    @PostMapping("/getComment")
    public String returnComment(@RequestParam("postId") String postId) {

        List<Comment> commentList = commentRepository.findByPostId(postId);
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
            jO.put("isDelete", comment.getIsDelete());
            jA.add(jO);
        }
        return jA.toJSONString();
    }

    @GetMapping("/getCommentNum")
    public Integer returnCommentNum(@RequestParam("postId") String postId) {
        Integer num = commentRepository.findNumByPostId(postId);
        return num;
    }

    @PostMapping("/deleteComment")
    public void doDeleteComment(@RequestParam("id") String id) {
        
        // 댓글을 삭제할 때 삭제할 댓글에 답글이 있는지 없는지 체크
        Integer childrenCnt = commentRepository.findChildren(id);
        log.info("댓글에 달린 자식 개수 = {}", childrenCnt);
        // 답글이 안달린 댓글 삭제
        if (childrenCnt == 0 ) {
            log.info("여기서 답글이 안달린 댓글이 삭제된다.");
        } else {
            log.info("여기는 답글이 달려있는 댓글이기때문에, update로 content만 수정할 예정이다.");
            LocalDate now = LocalDate.now();
            LocalTime nowTime = LocalTime.now();
            int hour = nowTime.getHour();
            int minutes = nowTime.getMinute();
            String temp = "[삭제된 댓글입니다 " + String.valueOf(now) + " " + hour + ":" + minutes + "]";
            commentRepository.updateByIdWithDelete(temp, id);
        }
    }
}
