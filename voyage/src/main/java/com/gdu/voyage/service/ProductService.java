package com.gdu.voyage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ProductMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ProductService {
	@Autowired ProductMapper productMapper;
	
	// [사용자] 숙소-건물 목록 조회
    public Map<String, Object> getAccomBuildingList(int page, int ROW_PER_PAGE, @Nullable Integer one) {
        log.debug("[debug] ProductService.getAccomBuildingList currentPage : " );
        log.debug("[debug] ProductService.getAccomBuildingList ROW_PER_PAGE : " );
        

        int beginRow = (page-1) * ROW_PER_PAGE;
        
        List<AccomBuilding> accomBuildingList = new ArrayList<>();
        
        if(one != null) {
            accomBuildingList = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, one);
        } else {
            accomBuildingList = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, null);
        }
        
        
        
        Map<String, Object> returnMap = new HashMap<>();
        
        int lastPage = 0;
        AccomBuilding accomBuilding = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, 1).get(0);
        int totalCount = accomBuilding.getCnt();
        
        
        
        // accomBuildingList 가공 - 해시태그 링크 연결을 위해 accomBuildingList 에서 Hahstag 분리
//        List<String> hashtagList = new ArrayList<>();
//        for(int i=0; i<accomBuildingList.size(); i++) {
//            hashtagList.add(accomBuildingList.get(i).getHashtagList().get(0).getHashtag());
//        }
        
//        Map<String, Object> returnMap = new HashMap<>();
//        returnMap.put("accomBuildingList", accomBuildingList);
//        returnMap.put("hashtagList", hashtagList);
        log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
//        log.debug("[debug] ProductService.getAccomBuildingList hashtagList : " + hashtagList);
        
        lastPage = totalCount / ROW_PER_PAGE;
        
        if(totalCount % ROW_PER_PAGE !=0) {
            lastPage += 1;
        }
        
        returnMap.put("accomBuildingList", accomBuildingList);
        returnMap.put("lastPage", lastPage);
        returnMap.put("totalCount", totalCount);
        
        return returnMap;
    }
	
	// [사용자] 숙소-건물 시설 인기 조회
	public List<Map<String, Object>> getAccomBuildingFacilityByBest() {
		List<Map<String, Object>> facilityByBest = productMapper.selectAccomBuildingFacilityByBest();
		log.debug("[debug] ProductService.getAccomBuildingFacilityByBest facilityByBest : " + facilityByBest);
		return facilityByBest;
	}
	
	// [사용자] 숙소-건물 지역 인기 조회
	public List<Map<String, Object>> getAccomAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectAccomAddressByBest();
		log.debug("[debug] ProductService.getAccomAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
		
	// [사용자] 숙소-건물 목록 검색 조회
	public List<AccomBuilding> getAccomBuildingListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getAccomBuildingListBySearch param : " + param);
		
		List<AccomBuilding> accomBuildingList = productMapper.selectAccomBuildingListBySearch(param);
		
		log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
		return accomBuildingList;
	}
		
	// [사용자] 숙소-건물 상세 조회
	public AccomBuilding getAccombuildingOne (int accomBuildingNo) {
		return productMapper.selectAccomBuildingOne(accomBuildingNo);
	}
	
	// [사용자] 숙소-건물-객실 목록 조회
	public List<AccomRoom> getAccomRoomList(int accomBuildingNo, int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getAccomRoomList currentPage : " );
		log.debug("[debug] ProductService.getAccomRoomList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<AccomRoom> accomRoomList = productMapper.selectAccomRoomList(accomBuildingNo);
		// accomBuildingList 가공 - 해시태그 링크 연결을 위해 accomBuildingList 에서 Hahstag 분리
//			List<String> hashtagList = new ArrayList<>();
//			for(int i=0; i<accomBuildingList.size(); i++) {
//				hashtagList.add(accomBuildingList.get(i).getHashtagList().get(0).getHashtag());
//			}
		
//			Map<String, Object> returnMap = new HashMap<>();
//			returnMap.put("accomBuildingList", accomBuildingList);
//			returnMap.put("hashtagList", hashtagList);
		log.debug("[debug] ProductService.getAccomRoomList accomRoomList : " + accomRoomList);
//			log.debug("[debug] ProductService.getAccomBuildingList hashtagList : " + hashtagList);
		
		return accomRoomList;
	}
	
	// [사용자] 숙소-건물-객실 상세 조회
	public AccomRoom getAccomRoomOne (int accomRoomNo) {
		return productMapper.selectAccomRoomOne(accomRoomNo);
	}	
	
	// [사용자] 체험 목록 조회
	public List<Activity> getActivityList(int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getActivityList currentPage : " );
		log.debug("[debug] ProductService.getActivityList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<Activity> activityList = productMapper.selectActivityList();
		
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return activityList;
	}
	// [사용자] 체험 지역 인기 조회
	public List<Map<String, Object>> getActivityAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectActivityAddressByBest();
		log.debug("[debug] ProductService.getActivityAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
	
	// [사용자] 체험 목록 검색 조회
	public List<Activity> getActivityListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getActivityListBySearch param : " + param);
		
		List<Activity> activityList = productMapper.selectActivityListBySearch(param);
		
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return activityList;
	}

	// [사용자] 체험 상세 조회
	public Activity getActivityOne (int activityNo) {
		return productMapper.selectActivityOne(activityNo);
	}
	
	
	// 예약
	// [사용자] 객실 예약 내역 전체 조회
	public List<String> getAccomRoomReserveDay(int accomRoomNo) {
		log.debug("[debug] ProductService.getAccomRoomReserveDay accomRoomNo : " + accomRoomNo);
		
		// 체크인, 체크아웃 날짜를 list 안의 map 형태로 저장
		List<Map<String, Object>> map = productMapper.selectAccomRoomReserveDay(accomRoomNo);
		log.debug("[debug] ProductService.getAccomRoomReserveDay map : " + map);
		//log.debug("[debug] ProductService.getAccomRoomReserveDay map.get(0) : " + map.get(0).get("accomCheckIn").toString());
		
		List<String> reverveDays = new ArrayList<>();
				  
		// 반복문을 통해 list 안의 i번째 map 데이터를 가져와
		// 체크인 날짜로부터 체크아웃 날짜 사이의 (예약 불가능한) 모든 예약 날짜를 하나의 list에 저장
		for(int i=0; i<map.size(); i++) {
		  String accomCheckIn = map.get(i).get("accomCheckIn").toString();
		  String accomCheckOut = map.get(i).get("accomCheckOut").toString();
		  
	      int checkInYear = Integer.parseInt(accomCheckIn.substring(0,4));
	      int checkInMonth= Integer.parseInt(accomCheckIn.substring(5,7));
	      int checkInDate = Integer.parseInt(accomCheckIn.substring(8,10));

	      // 체크아웃 날짜를 '-' 없는 int 타입으로 가공하기 위한 코드
	      String checkOutYear = accomCheckOut.substring(0,4);
	      String checkOutMonth= accomCheckOut.substring(5,7);
	      String checkOutDate = accomCheckOut.substring(8,10);
	      
	      String checkOut = checkOutYear + checkOutMonth + checkOutDate;

	      int endDt = Integer.parseInt(checkOut);
	 
	      Calendar cal = Calendar.getInstance();
	         
	      // Calendar의 Month는 0부터 시작하므로 -1
	      cal.set(checkInYear, checkInMonth-1, checkInDate);
	        
	      while(true) {
	          log.debug("현재 날짜 출력 "+getDateByString(cal.getTime()));
	             
	          // 체크인 날짜로부터 하루씩 증가
	          cal.add(Calendar.DATE, 1); 

	          // 반환하기 위한 list에 모든 예약 날짜 저장
	          reverveDays.add(getDateByString(cal.getTime()));
	          
	          // 현재 날짜가 체크아웃 날짜보다 크면 종료 
	           if(getDateByInteger(cal.getTime()) > endDt) break;
	      }
		}
		return reverveDays;
	}
	
	// 날짜 데이터를 yyyyMMdd 형식으로 가공하여 int 타입으로 반환하기 위한 메소드
	public int getDateByInteger(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return Integer.parseInt(sdf.format(date));
    }
	
	// 날짜 데이터를 yyyy-MM-dd 형식으로 가공하여 String 타입으로 반환하기 위한 메소드
    public String getDateByString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

}
