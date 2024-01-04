package com.prj.mypharm.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomerUser extends User {

	private static final long serialVersionUID = -808752920402157316L;
	private MemberVO member;

	public CustomerUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public CustomerUser(MemberVO vo) {
		super(vo.getId(), vo.getPwd(), 
				vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority() ) )
				.collect(Collectors.toList())
				);
		this.member = vo;
	}
}
