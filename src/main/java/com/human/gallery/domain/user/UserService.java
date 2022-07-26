package com.human.gallery.domain.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	
	private final UserRepository userRepository;
	@Autowired
	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	public Users login(String id, String password) {
		Users user = userRepository.findById(id);
	
		if (user == null)
		{
			return null;
		}
		else if (user.getPassword().equals(password)) {
			return user;
		}
		else {
			return null;
		}
	}
	public Users checkId(String id) {
		
		Users user = userRepository.findById(id);
		
		if (user == null) {
			return null;
		}
		else {
			return user;
		}
	}

	public void addUsers(UsersSignForm user) {
		userRepository.addUser(user.getId(), user.getPassword());
		Integer number = userRepository.findNumById(user.getId());
		String address = user.getAddress() + " " + user.getRefAddress();
		userRepository.addDetail(number, user.getName(),user.getMobile(), address ,user.getDtaddress(), user.getEmail(), user.getPostcode());
	}

	public void login(User user) {
	}
}
