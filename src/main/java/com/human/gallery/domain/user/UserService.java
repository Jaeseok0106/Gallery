package com.human.gallery.domain.user;

import com.human.gallery.domain.googleLogin.GoogleSignForm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Service
@Slf4j
public class UserService {
	
	private final UserRepository userRepository;
	@Autowired
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public Users login(String id, String password) throws NoSuchAlgorithmException {
		Users user = userRepository.findById(id);

		String salt = user.getSalt();
		log.info("salt 값 = {}", salt);
		String tempPassword = EncryptionUtils.getEncrypt(password, salt);
		log.info("암호화 된 salt = {}", salt);
		log.info("암호화 된 비밀번호 = {}", tempPassword);
		if (user == null)
		{
			return null;
		}
		else if (user.getPassword().equals(tempPassword)) {
			return user;
		}
		else {
			return null;
		}
	}
	public Users checkId(String id, String path) {
		
		Users user = userRepository.findByIdWithPath(id, path);
		
		if (user == null) {
			return null;
		}
		else {
			return user;
		}
	}
	public boolean checkEmail(String email) {
		Integer num = userRepository.findUsersByEmail(email);

		if (num == null || num == 0) {
			return false;
		}
		else {
			return true;
		}
	}

	public void addUsers(UsersSignForm user) throws NoSuchAlgorithmException {
		String salt = EncryptionUtils.getSalt();

		String tempPassword = EncryptionUtils.getEncrypt(user.getPassword(), salt);
		log.info("암호화 된 비밀번호 = {}", tempPassword);
		userRepository.addUser(user.getId(), tempPassword, salt);
		Integer number = userRepository.findNumById(user.getId());
		String address = user.getAddress() + " " + user.getRefAddress();
		userRepository.addDetail(number, user.getName(),user.getMobile(), address ,user.getDtaddress(), user.getEmail(), user.getPostcode());
	}

	public void addGoogleUsers(GoogleSignForm googleUser) {
		String tempPassword = UUID.randomUUID().toString();

		userRepository.addGoogleUser(googleUser.getId(), tempPassword,null);
		Integer number = userRepository.findNumByIdWithPath(googleUser.getId(), "GOOGLE");
		log.info("넘어온 번호 -> {}", number);
		String address = googleUser.getAddress() + " " + googleUser.getRefAddress();
		String tempEmail = UUID.randomUUID().toString();
		userRepository.addDetail(number, googleUser.getName(), googleUser.getMobile(), address, googleUser.getDtaddress(), tempEmail, googleUser.getPostcode());
	}

	public String returnUserId(String email) {
		Integer num = userRepository.findUsersByEmail(email);
		String userID = userRepository.findUserIdByNum(num);
		return userID;
	}
}
