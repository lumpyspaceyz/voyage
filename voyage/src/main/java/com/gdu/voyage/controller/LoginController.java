package com.gdu.voyage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.voyage.service.LoginService;
import com.gdu.voyage.vo.Admin;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("LoginController() 실행 - logout");
		request.getSession().invalidate();
		return "redirect:index";
	}
	
	// 로그인 페이지
	@GetMapping("/login")
    public String getLogin() {
       System.out.println("LoginController() 실행");
       return "login";
	}
	
	// 로그인
	@PostMapping("/login")
	public String postLogin(HttpServletRequest request, RedirectAttributes redirect,Model model) {
		System.out.println("LoginController() 실행");
		
		String memberId = request.getParameter("id");
		String memberPw = request.getParameter("password");
		
		// 맴버 객체
		Member m = new Member();
	    m.setMemberId(memberId);
	    m.setMemberPw(memberPw);
	    
	    // 디버그
	    log.trace("★controller★"+m.toString());
	    
	    
	    /* faild가 1이면 존재하지 않는 회원 또는 아이디 비밀번호 오타
	     * 2면 탈퇴한 회원, 3이면 정지당한 회원
	     */
	    if(loginService.selectBanMember(memberId) == 1) {
	    	redirect.addFlashAttribute("failed","3");
	    	return "redirect:login";
	    }
	    if(loginService.selectDeleteMember(memberId) == 1) {
	    	redirect.addFlashAttribute("failed","2");
	    	return "redirect:login";
	    }
	    Member loginMember = loginService.login(m);
	    redirect.addFlashAttribute("failed","1");
	    if(loginMember == null) {
	    	return "redirect:login";
	    }
	    
	    // 회원 로그인, 관리자,사업자 가입이 되어있다면 관리자(사업자) 세션까지 한번에 받아옴
	    HttpSession session = request.getSession();
	    session.setAttribute("loginMember", loginMember);
	    if(loginMember.getMemberLevel()==2) {
	    	Admin adminSession = loginService.adminLogin(memberId);
	    	if(adminSession != null) {
	    		session.setAttribute("adminSession", adminSession);
	    	}
	    }
	    if(loginMember.getMemberLevel()==1) {
	    	Host hostSession = loginService.hostLogin(memberId);
	    	if(hostSession != null) {
	    		session.setAttribute("hostSession", hostSession);
	    	}
	    }
	    
	    // 마지막 로그인 날짜를 현재 시각으로
	    loginService.updateLastLogin(memberId);
	    
	    // 로그인 시 휴면계정을 활동으로 변환시킴.
	    // Active update는 여기서만 사용하므로 따로 로그인 세션을 추가로 받아오거나 하지 않음
	    if(loginMember.getMemberActive().equals("휴면")) {
	    	loginService.updateEnableActive(memberId);
	    	
	    	model.addAttribute("msg", "휴면계정 비활성화 처리되었습니다.");
		    model.addAttribute("url", "redirect:index");
		    return "/alert";
	    }
	    
	    return "redirect:index";
	}
	/*
	// 어드민 로그아웃
	@GetMapping("/adminlogout")
	public String adminLogout(HttpServletRequest request) {
		System.out.println("LoginController()_adminLogOut 실행");
		request.getSession().invalidate();
		return "redirect:/index";
	}
	// 어드민 로그인 페이지 이동
	@GetMapping("/adminLogin")
	public String getAdminLogin() {
		System.out.println("LoginController()_adminLogin 실행");
		return "adminLogin";
	}
	// 어드민 로그인
	@PostMapping("/adminLogin")
	public String postAdminLogin(HttpServletRequest request, RedirectAttributes redirect) {
		System.out.println("★★★[boryeong]postAdminloginController★★★");
		
		String adminId = request.getParameter("id");
		String adminPw = request.getParameter("password");
		// 어드민 객체
		Admin a = new Admin();
		a.setAdminId(adminId);
		a.setAdminPw(adminPw);
		
		log.debug("★★★[boryeong]postAdminloginController★★★"+a.toString());
		
		Admin loginAdmin = loginService.adminLogin(a);
		if(loginAdmin == null) {
			return "redirect:adminLogin?failed=true";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginAdmin", loginAdmin);
		
		return "redirect:adminIndex";
	}
	*/

}	
