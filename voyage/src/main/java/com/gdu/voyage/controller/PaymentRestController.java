package com.gdu.voyage.controller;

import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.PaymentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PaymentRestController {
	@Autowired PaymentService paymentService;
	// 관리자 --
	
	
	// 사업자 -- 
	
	// 최근 한달간 특정 객실 일별 수익
	@GetMapping("/selectAccomRoomProfitByMonthToDateOne")
	public TreeMap<String, Object> selectAccomRoomProfitByMonthToDateOne(int hostNo,int accomRoomNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> activityMonthDateProfit = paymentService.selectAccomRoomProfitByMonthToDateOne(hostNo,accomRoomNo);
		 log.trace("★controller★ activityMonthDateProfit : "+activityMonthDateProfit);
		 
		 return activityMonthDateProfit;
	}
	
	// 최근 한달간 특정 체험 일별 수익
	@GetMapping("/selectActivityProfitByMonthToDateOne")
	public TreeMap<String, Object> selectActivityProfitByMonthToDateOne(int hostNo,int activityNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> activityMonthDateProfit = paymentService.selectActivityProfitByMonthToDateOne(hostNo,activityNo);
		 log.trace("★controller★ activityMonthDateProfit : "+activityMonthDateProfit);
		 
		 return activityMonthDateProfit;
	}
	
	
	// 이번달 사업자 수수료
	@GetMapping("/selectHostMonthFees")
	public long selectHostMonthFees(int hostNo) {
		 return paymentService.selectHostMonthFees(hostNo);
	}
	
	// 이번달 체험 예약인원
	@GetMapping("/selectActivityUsePerson")
	public int selectActivityUsePerson(int hostNo) {
		 return paymentService.selectActivityUsePerson(hostNo);
	}
		
	// 이번달 숙소 예약인원
	@GetMapping("/selectAccomUsePerson")
	public int selectAccomUsePerson(int hostNo) {
		 return paymentService.selectAccomUsePerson(hostNo);
	}
	
	// 해당 사업자의 저번달과 비교한 체험 월 수익
	@GetMapping("/selectActivityProfitCompareByMonth")
	public String selectActivityProfitCompareByMonth(int hostNo) {
		 return paymentService.selectActivityProfitCompareByMonth(hostNo);
	}
		
	// 해당 사업자의 저번주와 비교한 체험 수익
	@GetMapping("/selectActivityProfitCompare")
	public String selectActivityProfitCompare(int hostNo) {
		 return paymentService.selectActivityProfitCompare(hostNo);
	}
	
	// 해당 사업자의 저번달과 비교한 숙소 수익
	@GetMapping("/selectAccomProfitCompareByMonth")
	public String selectAccomProfitCompareByMonth(int hostNo) {
		 return paymentService.selectAccomProfitCompareByMonth(hostNo);
	}
		
	// 해당 사업자의 저번주와 비교한 숙소 수익
	@GetMapping("/selectAccomProfitCompare")
	public String selectAccomProfitCompare(int hostNo) {
		 return paymentService.selectAccomProfitCompare(hostNo);
	}
	
	// 해당 사업자의 저번달과 비교한 건물별 숙소 수익
	@GetMapping("/selectAccomProfitOneCompareByMonth")
	public String selectAccomProfitOneCompareByMonth(int hostNo,int accomBuildingNo) {
		 return paymentService.selectAccomProfitOneCompareByMonth(hostNo,accomBuildingNo);
	}
		
	// 해당 사업자의 저번주와 비교한 건물별 숙소 수익
	@GetMapping("/selectAccomProfitOneCompare")
	public String selectAccomProfitOneCompare(int hostNo,int accomBuildingNo) {
		 return paymentService.selectAccomProfitOneCompare(hostNo,accomBuildingNo);
	}
	
	// 해당 사업자의 저번달과 비교한 월 수익
	@GetMapping("/selectAllProfitCompareByMonth")
	public String selectAllProfitCompareByMonth(int hostNo) {
		 return paymentService.selectAllProfitCompareByMonth(hostNo);
	}
		
	// 해당 사업자의 저번주와 비교한 총 수익
	@GetMapping("/selectAllProfitCompare")
	public String selectAllProfitCompare(int hostNo) {
		 return paymentService.selectAllProfitCompare(hostNo);
	}
	
	// 최근 한달간 체험 일별 수익
	@GetMapping("/selectActivityProfitByMonthToDate")
	public TreeMap<String, Object> selectActivityProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> activityMonthDateProfit = paymentService.selectActivityProfitByMonthToDate(hostNo);
		 log.trace("★controller★ activityMonthDateProfit : "+activityMonthDateProfit);
		 
		 return activityMonthDateProfit;
	}
	
	// 최근 한달간 숙소 일별 수익
	@GetMapping("/selectAccomProfitByMonthToDate")
	public TreeMap<String, Object> selectAccomProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> accomMonthDateProfit = paymentService.selectAccomProfitByMonthToDate(hostNo);
		 log.trace("★controller★ accomMonthDateProfit : "+accomMonthDateProfit);
		 return accomMonthDateProfit;
	}
	
	// 최근 한달간 체험별, 일별 수익
	@GetMapping("/selectActivityOneProfitByMonthToDate")
	public TreeMap<String, Object> selectActivityOneProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> activityOneMonthDateProfit = paymentService.selectActivityOneProfitByMonthToDate(hostNo);
		 log.trace("★controller★ activityOneMonthDateProfit : "+activityOneMonthDateProfit);
		 
		 return activityOneMonthDateProfit;
	}
	
	// 최근 한달간 객실별, 일별 수익
	@GetMapping("/selectAccomRoomOneProfitByMonthToDate")
	public TreeMap<String, Object> selectAccomRoomOneProfitByMonthToDate(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 TreeMap<String, Object> accomRoomOneMonthDateProfit = paymentService.selectAccomProfitByMonthToDate(hostNo);
		 log.trace("★controller★ accomRoomOneMonthDateProfit : "+accomRoomOneMonthDateProfit);
		 return accomRoomOneMonthDateProfit;
	}
	
	// 해당 사업자의 월별 가장 많은 수익을 벌어들인 체험
	@GetMapping("/selectActivityProfitByQuarterly")
	public String selectActivityProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 String activityQuarterlyProfit = "해당없음";
		 
		 if(paymentService.selectActivityProfitByQuarterly(hostNo)  != null) {
			 activityQuarterlyProfit = paymentService.selectActivityProfitByQuarterly(hostNo).getActivity().getActivityName();
		 }
		 log.trace("★controller★ activityQuarterlyProfit : "+activityQuarterlyProfit);
		 
		 return activityQuarterlyProfit;
	}
	
	// 해당 사업자의 월별 가장 많은 수익을 벌어들인 숙소
	@GetMapping("/selectAccomProfitByQuarterly")
	public String selectAccomProfitByQuarterly(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 String accomQuarterlyProfit = "해당없음";
		 
		 if(paymentService.selectAccomProfitByQuarterly(hostNo) != null) {
			 accomQuarterlyProfit = paymentService.selectAccomProfitByQuarterly(hostNo).getAccomBuilding().getAccomBuildingName();
		 }
		 log.trace("★controller★ accomQuarterlyProfit : "+accomQuarterlyProfit);
		 
		 return accomQuarterlyProfit;
	}
	
	// 사업자 체험 월 수익
	@GetMapping("/selectActivityProfitByHostToMonth")
	public long selectActivityProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long activityMonthTotalProfit = (long)paymentService.selectActivityProfitByHostToMonth(hostNo);
		 log.trace("★controller★ activityMonthTotalProfit : "+activityMonthTotalProfit);
		 
		 return activityMonthTotalProfit;
	}
		
	// 사업자 체험 총 수익
	@GetMapping("/selectActivityProfitByHost")
	public long selectActivityProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long activityTotalProfit = (long)paymentService.selectActivityProfitByHost(hostNo);
		 log.trace("★controller★ activityTotalProfit : "+activityTotalProfit);
		 
		 return activityTotalProfit;
	}
	// 사업자 특정 숙소 월별 총 수익
	@GetMapping("/selectAccomProfitOneByHostToMonth")
	public long selectAccomProfitOneByHostToMonth(int hostNo,int accomBuildingNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomMonthTotalProfit = (long)paymentService.selectAccomProfitOneByHostToMonth(hostNo,accomBuildingNo);
		 log.trace("★controller★ accomMonthTotalProfit : "+accomMonthTotalProfit);
		 
		 return accomMonthTotalProfit;
	}
	
	// 사업자 특정 숙소 총 수익
	@GetMapping("/selectAccomProfitOneByHost")
	public long selectAccomProfitOneByHost(int hostNo,int accomBuildingNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomTotalProfit = (long)paymentService.selectAccomProfitOneByHost(hostNo,accomBuildingNo);
		 log.trace("★controller★ accomTotalProfit : "+accomTotalProfit);
		 
		 return accomTotalProfit;
	}
	
	
	// 사업자 숙소 월별 총 수익
	@GetMapping("/selectAccomProfitByHostToMonth")
	public long selectAccomProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomMonthTotalProfit = (long)paymentService.selectAccomProfitByHostToMonth(hostNo);
		 log.trace("★controller★ accomMonthTotalProfit : "+accomMonthTotalProfit);
		 
		 return accomMonthTotalProfit;
	}
	
	// 사업자 숙소 총 수익
	@GetMapping("/selectAccomProfitByHost")
	public long selectAccomProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long accomTotalProfit = (long)paymentService.selectAccomProfitByHost(hostNo);
		 log.trace("★controller★ accomTotalProfit : "+accomTotalProfit);
		 
		 return accomTotalProfit;
	}
	
	// 사업자 월별 총 수익
	@GetMapping("/selectAllProfitByHostToMonth")
	public long selectAllProfitByHostToMonth(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long totalMonthProfit = (long)paymentService.selectAllProfitByHostToMonth(hostNo);
		 log.trace("★controller★ totalMonthProfit : "+totalMonthProfit);
		 
		 return totalMonthProfit;
	}
	
	// 사업자 총 수익
	@GetMapping("/selectAllProfitByHost")
	public long selectAllProfitByHost(int hostNo) {
		 log.trace("PaymentRestController 실행");
		 
		 long totalProfit = (long)paymentService.selectAllProfitByHost(hostNo);
		 log.trace("★controller★ totalProfit : "+totalProfit);
		 
		 return totalProfit;
	}
}
