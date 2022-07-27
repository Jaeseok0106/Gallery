package com.human.gallery.domain.user;

import lombok.Data;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.security.core.userdetails.User;

import javax.sql.DataSource;

@Data
public class Users {
	
	private int userNum;
	private String id;
	private String password;
	private String role;
	private String address;
	private String dtaddress;
	private String email;
	private String username;
	private int postcode;
	private String mobile;
}
