package com.prj.mypharm.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.prj.mypharm.security.domain.MemberVO;

public interface MemberMapper {
	// 회원정보 반환 
	MemberVO getMember(String id) throws ClassNotFoundException, SQLException;
	
	// 회원가입 
	int memberJoin(MemberVO member) throws ClassNotFoundException, SQLException;
	
	// 회원정보 + 권한 정보 
	MemberVO memberInfo(@Param("userid") String userid);
}
