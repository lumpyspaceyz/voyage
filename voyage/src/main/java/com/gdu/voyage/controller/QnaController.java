package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.QnaService;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.Qna;
import com.gdu.voyage.vo.QnaForm;
import com.gdu.voyage.vo.QnaImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaController {
	@Autowired QnaService qnaService;
	private Integer currentPage = 1;
	private final int ROW_PER_PAGE = 10;
	
	// Qna 게시판 목록 조회
	@GetMapping("/qnaList")
	public String qnaList(Model model, 
			@RequestParam(defaultValue="1") int currentPage,
			@RequestParam(required = false) String qnaCategory) {
		System.out.println("qnaListController() 실행");
		Map<String, Object> map = qnaService.getQnaListByCategory(qnaCategory, currentPage, ROW_PER_PAGE);
		int[] navArray = qnaService.countPage(currentPage);
		model.addAttribute("qnaList", map.get("qnaList"));
		model.addAttribute("navArray", navArray);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", map.get("currentPage"));
		return "/templates_citylisting/qnaList";
	}
	// Qna 상세 내용
	@GetMapping("/getQnaOne") 
	public String getQnaOne(HttpSession session, Model model, int qnaNo) {
		System.out.println("getQnaOneController() 실행");
		Member loginMember = (Member)session.getAttribute("loginMember");
		log.debug(qnaNo + "★★★★★★★★★★★ [다원] qnaNo_Controller() debug");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
	    log.debug(qna + "★★★★★★★★★★★ [다원] qna_Controller() debug");
	    model.addAttribute("qna", qna);
	    model.addAttribute("loginMember", loginMember);
		return "/templates_citylisting/getQnaOne";
	}
	// 질문 작성 get
	@GetMapping("/addQ")
	public String addQ() {
		System.out.println("addQuestionController() 실행");
		return "/templates_citylisting/addQ";
	}
	// 질문 작성 post
	@PostMapping("/addQ")
	public String addQ(HttpServletRequest request, HttpSession session, QnaForm qnaForm, Qna qna, QnaImg qnaImg) throws Exception {
		// 세션 가져옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		String memberNickname = request.getParameter("memberNickname");
		String qnaCategory = request.getParameter("qnaCategory");
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		String qnaSecret = request.getParameter("qnaSecret");
		
		Qna q = new Qna();
		q.setMemberId(memberId);
		q.setMemberNickname(memberNickname);
		q.setQnaCategory(qnaCategory);
		q.setQnaTitle(qnaTitle);
		q.setQnaContent(qnaContent);
		q.setQnaSecret(qnaSecret);
		log.debug(q.toString());
		log.debug(qnaImg.toString());
		qnaService.addQ(qnaForm, q, qnaImg);
		return "redirect:/qnaList?pageNo=1";
	}
	// 질문 수정
	@GetMapping("/modifyQ")
	public String modifyQ(Model model, int qnaNo) {
		System.out.println("modifyQuestionController() 실행");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		return "/templates_citylisting/modifyQ";
	}
	@PostMapping("/modifyQ")
	public String modifyQ(Qna qna, QnaImg qnaImg) {
		log.debug("★★★★★★★★★★★ [다원] qna_modifyQ_Controller() debug" + qnaService.modifyQ(qna, qnaImg));
		qnaService.modifyQ(qna, qnaImg);
		return "redirect:/getQnaOne?qnaNo=" + qna.getQnaNo();
	}
	// 질문 삭제
	@GetMapping("/removeQ")
	public String removeQ(Model model, int qnaNo) {
		System.out.println("removeQuestionController() 실행");
		Qna qna = qnaService.getQnaOneAndAnswer(qnaNo);
		model.addAttribute("qna", qna);
		return ("/templates_citylisting/removeQ");
	}
	@PostMapping("removeQ")
	public String removeQ(Qna qna) {
		qnaService.removeQ(qna);
		return "redirect:/qnaList?pageNo=1";
	}
}