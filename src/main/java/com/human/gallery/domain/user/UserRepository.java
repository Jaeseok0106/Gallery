package com.human.gallery.domain.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
	
	Users findById(String id);
	void addUser(String id, String password, String salt);
	void addDetail(Integer number, String name, String mobile, String address, String dtaddress, String email, int postcode);
	Integer findNumById(String id);
	Users findDetailById(String id);
	String findSaltById(String id);
	Users findByIdWithPath(@Param("id") String id, @Param("path") String path);

	void addGoogleUser(@Param("id") String id, @Param("password") String password, @Param("salt") String salt);
	Integer findNumByIdWithPath(@Param("id") String id, @Param("signpath") String signPath);
	void addKakaoUser(@Param("id") String id, @Param("password") String password, @Param("salt") String salt);
}
