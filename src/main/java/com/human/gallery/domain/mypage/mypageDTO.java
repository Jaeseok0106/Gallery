package com.human.gallery.domain.mypage;

import lombok.Data;
import lombok.Getter;
import org.springframework.stereotype.Service;

@Data
public class mypageDTO {

 private String id;
 private String password;
 private String role;
 private int userNum;
 private String address;
 private String dtaddress;
 private String email;
 private String username;
 private int postcode;
 private String mobile;
 private String salt;

}
