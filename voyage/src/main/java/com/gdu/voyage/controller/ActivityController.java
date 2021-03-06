package com.gdu.voyage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.voyage.service.ActivityService;
import com.gdu.voyage.service.HostService;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityForm;
import com.gdu.voyage.vo.Host;
import com.gdu.voyage.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@Transactional
public class ActivityController {
	private final int ROW_PER_PAGE = 10;
	@Autowired
	ActivityService activityService;
	@Autowired
	HostService hostService;
	
	// 체험 삭제 요청
	@GetMapping("/host/deleteActivity")
	public String deleteActivity(HttpServletRequest request,HttpSession session) {
		log.debug("ActivityController 실행");
		
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		int hostNo = ((Host) session.getAttribute("hostSession")).getHostNo();
		
		Activity activity = new Activity();
		activity.setActivityNo(activityNo);
		activity.setHostNo(hostNo);
		
		activityService.deleteActivity(activity);
		
		return "redirect:/host/hostIndex";
	}
	
	// 사업자
	@GetMapping("/host/addActivity")
	public String addActivity() {
		log.debug("ActivityController 실행");
		return "/host/addActivity";
	}

	@PostMapping("/host/addActivity")
	public String addActivity(ActivityForm activityForm, HttpServletRequest request, HttpSession session) {
		log.debug("ActivityController 실행");
		
		// 로그인한 호스트의 memberId를 알기 위해 세션을 가져옴
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		log.debug("★[지혜]controller★ memberId : " + memberId);
		
		//가져온 memberId로 작성자의 host_no를 조회함
		int hostNo = hostService.selectHostNo(memberId);
		log.debug("★[지혜]controller★ hostNo : " + hostNo);
		
		// 참조타입 객체를 log.debug로 출력할 때는 toString()으로 출력함
		log.debug("★[지혜]controller★ activityForm : " + activityForm.toString());

		// 파일 저장 시, 절대경로를 알기 위해 HttpServletRequest를 사용해서 realPath를 잡아준 뒤 변수에 저장함
		String realPath = request.getServletContext().getRealPath("resources/image/activity//");

		// accomBuildingForm과 realPath를 매개변수로 하여 같이 service에 전달
		activityService.addActivity(activityForm, realPath, hostNo);

		return "redirect:/host/hostIndex";
	}

	// 관리자
	// activity 목록 조회
	@GetMapping("/admin/activityList")
	public String getActivityList(Model model,  @RequestParam(defaultValue = "1") int currentPage) {

		log.debug("activityList 실행!!");
		log.debug("**********[상훈]ActivityController"+currentPage);
		
		int beginRow = (currentPage * ROW_PER_PAGE) - (ROW_PER_PAGE - 1);
		
		Map<String, Object> map = activityService.getActivityList(currentPage, ROW_PER_PAGE);
		// 값
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("activityList", map.get("activityList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug("**********[상훈]ActivityController_pageNo" + pageNo);
		model.addAttribute("pageNo", pageNo);
		
		return "admin/activityList";
	}

	// activity 상세목록 조회
	@GetMapping("/admin/activityOne")
	public String getActivityOne(Model model, int activityNo) {
		System.out.println("accomBuildingOne 실행!!");
		Activity activity = activityService.getActivityOne(activityNo);
		model.addAttribute("activity", activity);
		return "/admin/activityOne";
	}

	// activity state 승인여부 수정
	// 수정페이지 이동
	@GetMapping("/admin/activityUpdate")
	public String activityUpdate(Model model, int activityNo) {
		System.out.println("activityUpdate 실행!!");
		Activity activity = activityService.getActivityOne(activityNo);
		model.addAttribute("activity", activity);
		return "/admin/activityUpdate";
	}

	// 페이지 수정
	@PostMapping("/admin/activityUpdate")
	public String activityUpdate(Activity activity) {
		activityService.activityUpdate(activity);
		return "redirect:/admin/activityOne?activityNo=" + activity.getActivityNo();
	}
	
	// 승인완료된 activity 목록
	@GetMapping("/admin/accessActivity")
	public String selectAccessActivity(Model model) {
		System.out.println("accessActivity 실행!!");
		List<Activity> list = activityService.selectAccessActivity();
		model.addAttribute("list", list);
		return "/admin/accessActivity";
	}
}
