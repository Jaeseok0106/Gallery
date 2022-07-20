package com.human.gallery.domain.paging;

import lombok.Data;

@Data
public class pagingDTO {
    private int startrow;
    private int endrow;

    private int pageindex= 1;
    private int pagesize= 10;
    private int pagegroupsize= 5;
}
