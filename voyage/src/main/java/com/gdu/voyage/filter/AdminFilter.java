package com.gdu.voyage.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gdu.voyage.vo.Member;


@WebFilter("/admin/*")
public class AdminFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 어드민 로그인 상태에서만 요청할수 있도록 필터링
	    System.out.println("LoginFilter.doFilter() 실행");
	    HttpSession session = ((HttpServletRequest)request).getSession();
	    if(session.getAttribute("loginMember") == null) {
	    	((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/login");
	    	return;
	    }
	    Member loginMember = (Member)session.getAttribute("loginMember");
	    if(loginMember.getMemberLevel() != 2) {
	    	((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/index");
	    	return;
	    }
	      
	    chain.doFilter(request, response);
	}
}
