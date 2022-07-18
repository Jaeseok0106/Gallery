package com.human.gallery.web.comment;


import com.human.gallery.domain.comment.Comment;
import com.human.gallery.domain.comment.CommentRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
