package com.human.gallery.domain.mypage;


import java.util.ArrayList;

public interface iMypage {
    mypageDTO findById(String id);
    mypageDTO list(String id);

}
