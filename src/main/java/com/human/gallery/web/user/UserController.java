package com.human.gallery.web.user;

import com.human.gallery.domain.user.UserService;
import com.human.gallery.domain.user.Users;
import com.human.gallery.domain.user.UsersLoginForm;
import com.human.gallery.domain.user.UsersSignForm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j

public class UserController {

	private final UserService userService;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@SessionAttribute(name = "user", required = false) Users user, Model model) {
		log.info("호출 여부");
		model.addAttribute("user", user);
		log.info("여기도 넘어옴");
		return "home";
	}

	@GetMapping("/login")
	public String viewLogin(@ModelAttribute("user") Users user) {
		return "users/login";
	}
	@RequestMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/login")

	public String doLogin(@Validated @ModelAttribute("user") UsersLoginForm Form, BindingResult bindingResult,
							HttpSession session, Model model) {

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
		return "redirect:/";
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
						   @SessionAttribute(name = "user", required = false) Users usera) {

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
}
