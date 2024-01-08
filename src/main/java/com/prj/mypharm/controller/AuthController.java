package com.prj.mypharm.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.prj.mypharm.mapper.MemberMapper;
import com.prj.mypharm.security.domain.MemberVO;
import com.prj.mypharm.security.domain.Role;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/auth/*")
@Log4j
public class AuthController {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 회원가입 
	@GetMapping("/signup")
	public String signup() {
		log.info("> signup...");

		return "base/auth/signup.tiles";
	}

	@PostMapping("/signup")
	@Transactional
	public String signupPost(MemberVO vo, RedirectAttributes rttr) {
		log.info("> signupPost...");
		String pwd = vo.getPwd();
		System.out.println(vo);
		vo.setPwd( passwordEncoder.encode(pwd));
		Role role = Role.ROLE_USER;
		
		if( vo.getId().equals("admin") ) {
			role = Role.ROLE_ADMIN;
		}
		int signupCount = 0;
		try {
			signupCount = memberMapper.memberJoin(vo);
			memberMapper.memberAddAuthority(vo.getId(), role);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if( signupCount > 0 ) {
			rttr.addFlashAttribute("isSignup", "success");
		}else {
			rttr.addFlashAttribute("isSignup", "fail");
		}
		return "redirect:/auth/signup";
	}
	
	// 아이디 중복 체크 ajax
	@GetMapping(value = "/idcheck/{id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Boolean> idcheck(@PathVariable("id") String userid) {
		log.info("> idcheck...");
		Boolean isDuplicateId = false;
		try {
			if( memberMapper.memberIdCheck(userid) == 1 ) {
				isDuplicateId = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(isDuplicateId, HttpStatus.OK);
	}

	// 로그인 
	@GetMapping("/signin")
	public String signin(HttpServletRequest request) {
		log.info("> signin...");
		
		String uri = request.getHeader("Referer");
	    System.out.println(uri);
	    if( uri == null ) {
	    	uri = "/";
	    }
	    if(!uri.contains("/auth/signin")){
	    	request.getSession().setAttribute("prevPage", uri);
	    }
	    
		return "base/auth/signin.tiles";
	}
}
