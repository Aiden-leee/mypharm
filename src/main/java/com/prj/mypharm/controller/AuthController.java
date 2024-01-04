package com.prj.mypharm.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.mypharm.mapper.MemberMapper;
import com.prj.mypharm.security.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/auth/*")
@Log4j
public class AuthController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/signup")
	public String signup() {
		log.info("> signup...");

		return "base/auth/signup.tiles";
	}

	@PostMapping("/signup")
	public String signupPost(MemberVO vo, RedirectAttributes rttr) {
		log.info("> signupPost...");
		String pwd = vo.getPwd();
		System.out.println(vo);
		vo.setPwd( passwordEncoder.encode(pwd));

		int signupCount = 0;
		try {
			signupCount = memberMapper.memberJoin(vo);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		rttr.addFlashAttribute("isSignup", "success");

		return "redirect:/auth/signin";
	}

	@GetMapping("/signin")
	public String signin(HttpServletRequest request) {
		log.info("> signin...");
		
		String uri = request.getHeader("referer");
		System.out.println(uri);
		return "base/auth/signin.tiles";
	}
}
