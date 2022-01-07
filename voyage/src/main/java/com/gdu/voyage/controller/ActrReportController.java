package com.gdu.voyage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ActrReportService;
import com.gdu.voyage.vo.ActivityReviewReport;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActrReportController {
	@Autowired ActrReportService actrReportService;
	private final int ROW_PER_PAGE = 10;
	
	// [Admin] 신고 목록 
	@GetMapping("/admin/activityReviewReportList")
	public String reportList(Model model,
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam @Nullable String searchWord) {
		log.debug("reportListController() 실행");
		
		Map<String, Object> map = actrReportService.getReportList(searchWord, currentPage, ROW_PER_PAGE);
		log.debug("★★★★★★★★★★★ [다원] reportList_map_Controller() debug" + map.toString());
		
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		int pageNo = ((controllPage / 100) * 10 + 1);
		
		model.addAttribute("controllPage", controllPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("reportList", map.get("reportList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNo", pageNo);
		return "/admin/activityReviewReportList";
	}

	// [Member] 신고 작성 
	@GetMapping("/addActivityReviewReport")
	public String addActrReport(HttpSession session, HttpServletResponse response) throws IOException {
		log.debug("addReport_Controller() 실행");
		// 세션에서 로그인 정보를 가져와 member 객체에 저장
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 비회원인 경우
		if(loginMember == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비회원 계정입니다. 로그인해주세요.');location.href='/voyage/login';</script>");
			out.flush();
			return "redirect:/login"; 
		}
		return "/addActivityReviewReport";
	}
	
	@PostMapping("/addActivityReviewReport")
	public String addActrReport(ActivityReviewReport report, int activityReviewNo, Model model,
			HttpSession session,
			HttpServletRequest request) throws Exception {
		// 세션에서 로그인 정보를 가져와 member 객체에 저장
		Member loginMember = (Member)session.getAttribute("loginMember");
		// 변수에 값 셋팅 
		String memberId = loginMember.getMemberId();
		activityReviewNo = Integer.parseInt(request.getParameter("activityReviewNo"));
		
		log.debug("★★★★★★★★★★★ [다원] addReport_idenNo_Controller() debug" + activityReviewNo);

		// 서비스로 값 전달
		actrReportService.addActrReport(report, activityReviewNo, memberId);
		return "redirect:/index";
	} 
}
