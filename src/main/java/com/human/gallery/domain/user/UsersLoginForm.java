package com.human.gallery.domain.user;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsersLoginForm {
	@NotBlank()
	String id;
	@NotBlank()
	String password;
}
