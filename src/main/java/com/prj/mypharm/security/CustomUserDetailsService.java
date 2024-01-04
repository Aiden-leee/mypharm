package com.prj.mypharm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.prj.mypharm.mapper.MemberMapper;
import com.prj.mypharm.security.domain.CustomerUser;
import com.prj.mypharm.security.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Component("customUserDetailsService")
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("> Load User By Username: " + username);
		MemberVO vo = this.memberMapper.memberInfo(username);
		log.warn("> queried by member mapper : " + vo);
		
		// MemberVO => UserDetails 타입 형변환 
		// CustomerUser extends User implement UserDetails 사용 
		return vo == null ? null : new CustomerUser(vo);
	}

}
