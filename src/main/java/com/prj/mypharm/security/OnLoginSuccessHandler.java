package com.prj.mypharm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component("onLoginSuccessHandler")
@Log4j
public class OnLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// Authentication authentication 인증받은 사용자의 정보 
		log.warn("> Login success..");

		String uri = "/";

		// Security가 요청을 가로챈 경우 ㅅ용자가 원래 요청했던 URI 정보를 저장한 객체
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);


		// 로그인 버튼 눌러 접속했을 경우의 데이터 get
		String prevPage = (String) request.getSession().getAttribute("prevPage");

		if(prevPage != null){
			request.getSession().removeAttribute("prevPage");
		}

		// 있을 경우 URI 등 정보를 가져와서 사용
		if(savedRequest != null){
			uri = savedRequest.getRedirectUrl();

			// 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
			requestCache.removeRequest(request, response);
		}else if(prevPage != null && !prevPage.equals("")){
			 // ""가 아니라면 직접 로그인 페이지로 접속한 것
        	uri = prevPage;
        }
		
		System.out.println(prevPage);
		response.sendRedirect(uri);
	}

}
