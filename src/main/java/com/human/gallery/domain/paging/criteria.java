package com.human.gallery.domain.paging;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class criteria {
    private int pageNum; 	// 페이지
    private int amount; 	// 한번에 보여줄 게시물 수

    private String type; 	// 검색종류
    private String keyword; // 검색어

    public criteria() {
        this(1, 10);
    }

    public criteria(int pageNum, int amount) {
        this.pageNum = 1;
        this.amount = 1;
    }

    public String[] getTypeArr() {
        return type == null ? new String[] {} : type.split("");
    }

    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.amount).queryParam("type", this.type).queryParam("keyword", this.keyword);

        return builder.toUriString();
    }
}
