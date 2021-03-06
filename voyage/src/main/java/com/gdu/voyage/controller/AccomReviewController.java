package com.gdu.voyage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.AccomReviewService;
import com.gdu.voyage.vo.AccomReview;
import com.gdu.voyage.vo.AccomReviewForm;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Controller
public class AccomReviewController {
	@Autowired AccomReviewService accomReviewService;
	private final int ROW_PER_PAGE = 6;
	
	@GetMapping("/setReviewCategory")
	public String setProductCategory() {
		System.out.println("ActivityReviewController() 실행");	      
		return "/product/setReviewCategory";
	}
	
	// [Member] 숙소 후기 목록 조회
	@GetMapping("/getAccomReviewList")
	public String getAccomReviewList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam @Nullable String searchReview, Integer accomPaymentNo, HttpServletRequest request) {
		log.debug("*********[상훈]ReviewController() 실행");
		Map<String, Object> map = accomReviewService.getAccomReviewList(accomPaymentNo, currentPage, ROW_PER_PAGE, searchReview);
		int controllPage = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		int pageNo = ((controllPage / 100) * 10 + 1);

		model.addAttribute("controllPage", controllPage);
		model.addAttribute("accomReviewList", map.get("accomReviewList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("totalCount", map.get("totalCount"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("searchReview", searchReview);
		
		log.debug(model+"*********[상훈]ReviewController() 실행 model");
		
		return "/getAccomReviewList";
	}
	
	// 숙소 후기 상세 보기
	@GetMapping("/accomReviewOne")
	public String getAccomReviewOne(Model model, int accomReviewNo) {
		log.debug(accomReviewNo+"***** [상훈] accomReviewOne 실행 accomReviewNo");
		AccomReview accomReview = accomReviewService.getAccomReviewOne(accomReviewNo);
		
		int accomReviewViewCnt = accomReview.getAccomReviewViewCnt()+1;
		accomReviewService.accomReviewViewCnt(accomReviewNo);
		
		model.addAttribute("accomReview", accomReview);
		model.addAttribute("accomReviewViewCnt", accomReviewViewCnt);
		log.debug(model+"***** [상훈] accomReviewOne 실행 model");
		
		return "/accomReviewOne";
	}
	
	
	
	// [Member] 후기 작성 get
	@GetMapping("/addAccomReview")
	public String addAccomReview(HttpSession session, Model model) {
		log.debug("addAccomReviewController() 실행");
		// session에서 로그인한 회원 정보 가져옴
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		model.addAttribute("loginMember", loginMember);
		// 비회원일 경우, 로그인 후 이용 가능
		if(loginMember == null) {
			return "redirect:/login";
		}
		return "/addAccomReview";
	}
	
	// [Member] 후기 작성 post
	@PostMapping("/addAccomReview")
	public String addAccomReview(HttpServletRequest request, AccomReviewForm accomReviewForm, AccomReview accomReview,
		HttpSession session) throws Exception {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int accomPaymentNo = Integer.parseInt(request.getParameter("accomPaymentNo"));
		String memberId = loginMember.getMemberId();
		String memberNickname = loginMember.getMemberNickname();
		int accomReviewStar = accomReview.getAccomReviewStar();
		// 디버그 코드
		log.debug("***** [상훈] addAccomReview_qnaForm_Controller() debug" + accomReviewForm.toString());
		// 이미지 파일 절대 경로 설정
		String realPath = request.getServletContext().getRealPath("resources/image/accomReview/");
		
		accomReviewService.addAccomReview(accomReviewForm, realPath, accomPaymentNo, memberId, memberNickname, accomReviewStar);
	
		return "redirect:/getAccomReviewList?pageNo=1";
	}

}
