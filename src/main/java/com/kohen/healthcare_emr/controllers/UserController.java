package com.kohen.healthcare_emr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kohen.healthcare_emr.models.LoginUser;
import com.kohen.healthcare_emr.models.User;
import com.kohen.healthcare_emr.services.UserServ;

@Controller
public class UserController {

	private static UserServ userServ;

	public UserController(UserServ userServ) {
		UserController.userServ = userServ;
	}

	@GetMapping("/")
	public String loginReg(Model model) {
		model.addAttribute("registerringUser", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "loginReg";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("registerringUser") User registerringUser, BindingResult result,
			Model model, HttpSession session) {
		if (!registerringUser.getPassword().equals(registerringUser.getConfirm())) {
			result.rejectValue("confirm", "Match", "Confirm Password must match Password!");
		}
		if (userServ.getUser(registerringUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already in use!");
		}

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "loginReg";
		} else {
			session.setAttribute("user", userServ.create(registerringUser));
			return "redirect:/home";
		}
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, BindingResult result, Model model,
			HttpSession session) {
		User loggingInUser = userServ.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("registerringUser", new User());
			return "loginReg";
		} else {
			session.setAttribute("user", loggingInUser);
			return "redirect:/home";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

}
