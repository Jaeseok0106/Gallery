package com.human.gallery.web.user;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.human.gallery.domain.user.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Controller
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	String redirect = "/";
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@SessionAttribute(name = "user", required = false) Users user, Model model) {
		log.info("호출 여부");
		model.addAttribute("user", user);
		log.info("여기도 넘어옴");
		return "home";
	}

	@GetMapping("/login")
	public String viewLogin(@ModelAttribute("user") Users user,
							@RequestParam(defaultValue = "/") String redirectURL) {
		redirect = redirectURL;
		return "users/login";
	}
	@RequestMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/login")
	public String doLogin(@Validated @ModelAttribute("user") UsersLoginForm Form, BindingResult bindingResult,
							HttpSession session, Model model) throws NoSuchAlgorithmException {

		if (bindingResult.hasErrors())
		{
			log.info("발생된 에러 = {}", bindingResult.getFieldError());
			return "users/login";
		}
		Users user = userService.login(Form.getId(), Form.getPassword());
		if (user == null)
		{
			model.addAttribute("loginFail", "아이디 또는 비밀번호가 맞지 않습니다.");
			return "users/login";
		}


		session.setAttribute("user",user);
		return "redirect:" + redirect;
	}

	@RequestMapping("/signin")
	public String viewSignin(@ModelAttribute("userSign") UsersSignForm user,
							 @SessionAttribute(name = "user", required = false) Users usera,
							 Model model) {
		model.addAttribute("user", usera);
		return "users/signin";
	}

	@PostMapping("/signin")
	public String doSignin(@Validated @ModelAttribute("userSign") UsersSignForm form, BindingResult bindingResult,
							Model model,
						   @SessionAttribute(name = "user", required = false) Users usera) throws NoSuchAlgorithmException {

		if (bindingResult.hasErrors())
		{
			log.info("발생된 에러 {} = ", bindingResult.getFieldErrors());
			model.addAttribute("user", usera);
			return "users/signin";
		}
		Users checkId = userService.checkId(form.getId());
		if (checkId != null)
		{
			model.addAttribute("user", usera);
			model.addAttribute("overlap", "중복된 아이디입니다.");
			return "users/signin";
		}
		if (!form.getPassword().equals(form.getPasswordCheck()))
		{
			model.addAttribute("user", usera);
			model.addAttribute("passwordError", "비밀번호가 일치하지 않습니다.");
			return "users/signin";
		}
		userService.addUsers(form);
		model.addAttribute("user", usera);
		return "redirect:/login";
	}

	@GetMapping("/history")
	public String viewAccount(@SessionAttribute ("user") Users user, Model model) {

		model.addAttribute("user", user);
		log.info("여기도 넘어옴");
		return "account";
	}
	@GetMapping("/auth/kakao/callback")
	public @ResponseBody String kakaoCallback(String code) {	// Data를 리턴해주는 컨트롤러 함수
		// POST방식으로 key=value 데이터를 요청 (카카오측으로)
		// Retrofit2(안드로이드에서 주로사용)
		RestTemplate rt = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type","authorization_code");
		params.add("client_id","11afdf6f295b3f272c88971d1ea73cdd");
		params.add("redirect_uri","http://localhost:8080/auth/kakao/callback");
		params.add("code",code);
		params.add("client_secret", "cYyzjY4ee1qMSBmJOJyYQf1RbwPJ9W5L");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);

		// Http 요청하기 - Post방식으로 - 그리고 Response변수의 응답을 받음
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
		);

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}

		System.out.println("카카오 엑세스 토큰 : "+oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();

		// HttpHeaders 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);

		// Http 요청하기 - Post방식으로 - 그리고 Response변수의 응답을 받음
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
		);

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}

		System.out.println("카카오 아이디(번호) :"+kakaoProfile.getId());
		System.out.println("카카오 이메일 :"+kakaoProfile.getKakao_account().getEmail());

		System.out.println("갤러리 유저네임 : "+kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
		System.out.println("갤러리 이메일 : "+kakaoProfile.getKakao_account().getEmail());
		UUID tempPassword=UUID.randomUUID();
		System.out.println("갤러리 패스워드 : "+tempPassword);

/*		Users user = Users.builder()



		userService.addUsers(user);*/
		return response2.getBody();
	}
}