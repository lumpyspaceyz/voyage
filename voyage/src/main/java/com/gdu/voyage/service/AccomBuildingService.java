package com.gdu.voyage.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.voyage.mapper.AccomBuildingMapper;
import com.gdu.voyage.vo.AccomAddress;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomBuildingFacility;
import com.gdu.voyage.vo.AccomBuildingForm;
import com.gdu.voyage.vo.AccomBuildingImage;
import com.gdu.voyage.vo.AccomBuildingInterest;
import com.gdu.voyage.vo.AccomBuildingSpot;
import com.gdu.voyage.vo.AccomSpotForm;
import com.gdu.voyage.vo.ActivityInterest;
import com.gdu.voyage.vo.Hashtag;
import com.gdu.voyage.vo.SpotAddress;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AccomBuildingService {
	@Autowired
	private AccomBuildingMapper accomBuildingMapper;
	
	
	// 숙소 비공개요청
	public void deleteRequestAccomBuilding(AccomBuilding accomBuilding) {
		log.debug("☆service☆ AccomBuilding : "+accomBuilding);
		accomBuildingMapper.deleteRequestAccomBuilding(accomBuilding);
		return;
	}
	
	// 관심상품 추가
	public void insertAccomBuildingByInterest(AccomBuildingInterest accomBuildingInterest) {
		accomBuildingMapper.insertAccomBuildingByInterest(accomBuildingInterest);
	}
	// 관심상품 중복 추가 검사
	public String duplAccomBuildingInterest(AccomBuildingInterest accomBuildingInterest) {
		log.debug("☆☆☆[boryeong]CouponService회원 관심 상품 중복 방지☆☆☆"+accomBuildingInterest.toString());
		int interestCheck = accomBuildingMapper.selectAccomBuildingByInterests(accomBuildingInterest);
		log.debug("☆☆☆[boryeong]CouponService회원 관심 상품 중복 방지☆☆☆"+accomBuildingInterest.toString());
		if(interestCheck == 1) {
			log.debug("관심중복");
			return "관심중복";
		}
		return "중복없음";
	}
	// 관심상품 제거
	public int deleteAccomBuildingByInterest(int accomBuildingNo, String memberId) {
		return accomBuildingMapper.deleteAccomBuildingByInterest(accomBuildingNo,memberId);
	}
	// 관심상품 확인
	public int selectAccomBuildingByInterestOne(int accomBuildingNo, String memberId) {
		return accomBuildingMapper.selectAccomBuildingByInterestOne(accomBuildingNo,memberId);
	}
	
	// 이미지가 포함된 관심상품 목록
	public Map<String, Object> selectAccomBuildingByInterest(int currentPage, int rowPerPage,String memberId) {
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("memberId", memberId);
		
		List<AccomBuilding> interestedAccomBuildingList = accomBuildingMapper.selectAccomBuildingByInterest(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = accomBuildingMapper.selectInterestedAccomBuildingCount(memberId);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("interestedAccomBuildingList", interestedAccomBuildingList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	/* 삭제 요청 처리. 마지막 체크인 날짜로부터 일주일이 되면 삭제 처리 */
	public int updateDormantAccomBuilding() {
		return accomBuildingMapper.updateDormantAccomBuilding();
	}
	
	// 사업자별 신청중인 숙소 목록 조회
	public Map<String, Object> selectReqAccomBuildingListByHost(int currentPage, int rowPerPage,int hostNo){
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("hostNo", hostNo);
		
		List<AccomBuilding> accomBuildingReqList = accomBuildingMapper.selectReqAccomBuildingListByHost(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = accomBuildingMapper.selectReqAccomBuildingCountByHost(hostNo);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("accomBuildingReqList", accomBuildingReqList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	// 신청중인 숙소 갯수 확인용
	public int selectReqAccomBuildingCountByHost(int hostNo) {
		return accomBuildingMapper.selectReqAccomBuildingCountByHost(hostNo);
	}
	
	// 사업자별 숙소 등록 목록 조회
	public Map<String, Object> selectAccomBuildingListByHost(int currentPage, int rowPerPage,int hostNo){
		
		Map<String, Object> paraMap = new HashMap<>();
		int beginRow = (currentPage-1) * rowPerPage;
		
		paraMap.put("beginRow", beginRow);
		paraMap.put("rowPerPage", rowPerPage);
		paraMap.put("hostNo", hostNo);
		
		List<AccomBuilding> accomBuildingList = accomBuildingMapper.selectAccomBuildingList(paraMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		
		int lastPage = 0;
		int totalCount = accomBuildingMapper.selectCountPage(hostNo);
		
		lastPage = totalCount / rowPerPage;
		
		if(totalCount % rowPerPage !=0) {
			lastPage += 1;
		}
		
		returnMap.put("accomBuildingList", accomBuildingList);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}
	
	// 숙소 등록 목록 조회
		public Map<String, Object> getAccomBuildingList(int currentPage, int rowPerPage){
			
			Map<String, Object> paraMap = new HashMap<>();
			int beginRow = (currentPage-1) * rowPerPage;
			
			paraMap.put("beginRow", beginRow);
			paraMap.put("rowPerPage", rowPerPage);
			
			List<AccomBuilding> accomBuildingList = accomBuildingMapper.selectAccomBuildingList(paraMap);
			
			Map<String, Object> returnMap = new HashMap<>();
			
			int lastPage = 0;
			int totalCount = accomBuildingMapper.selectCountPage(null);
			
			lastPage = totalCount / rowPerPage;
			
			if(totalCount % rowPerPage !=0) {
				lastPage += 1;
			}
			
			returnMap.put("accomBuildingList", accomBuildingList);
			returnMap.put("lastPage", lastPage);
			
			return returnMap;
			
		}
	// 숙소 등록 목록 상세 조회 One
		public AccomBuilding getAccomBuildingOne(int accomBuildingNo) {
			log.debug(accomBuildingMapper.selectAccomBuildingOne(accomBuildingNo) + "***********[상훈] accomBuildingService One");
			return accomBuildingMapper.selectAccomBuildingOne(accomBuildingNo);
		}
	
	// 숙소 공개, 승인여부 수정
		public AccomBuilding accomBuildingUpdate(AccomBuilding accomBuilding) {
			log.debug(accomBuilding.toString() + "********[상훈] AccomBuildingUpdate debug");
			accomBuildingMapper.accomBuildingUpdate(accomBuilding);
			return accomBuilding;
		}
	// 승인완료된 숙소 목록 조회 list
		public List<AccomBuilding> selectAccessAccomBuilding() {
			log.debug(accomBuildingMapper.selectAccessAccomBuilding() + "***********[상훈] accomBuildingService Access");
			return accomBuildingMapper.selectAccessAccomBuilding();
		}
	
	// 숙소-건물 입력
	public void addAccomBuilding(AccomBuildingForm accomBuildingForm, String realPath, int hostNo) {
		// 매개변수 디버깅 //accomBuildingForm  --> 숙소-건물정보 + 이미지 + 시설 + 추천장소 + 해시태그
		log.debug("☆[지혜]service☆ accomBuildingForm : " + accomBuildingForm.toString());
		
		// 1) 숙소-건물 입력 : accomBuilding 입력
		AccomBuilding accomBuilding = accomBuildingForm.getAccomBuilding();
		// hostNo를 accomBuilding 객체에 추가
		accomBuilding.setHostNo(hostNo);
		accomBuildingMapper.insertAccomBuilding(accomBuilding);
		
		// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingNo 값 입력해줌
		// accomBuildingNo = auto increment로 입력된 값
		log.debug("☆[지혜]service☆ accomBuildingNo : " + accomBuilding.getAccomBuildingNo());
		
		// 2) 숙소-건물의 이미지 입력 : accomBuildingImage 입력
		List<MultipartFile> imageList = accomBuildingForm.getAccomBuildingImage();
		// 이미지 파일이 업로드 되었다면 (null이 아니라면)
		if(imageList != null) {
			for(MultipartFile i : imageList) {
				AccomBuildingImage accomBuildingImage = new AccomBuildingImage();
				// 입력시 만들어진 key 값을 리턴 받아 온 값 세팅
				accomBuildingImage.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				// 오리지널 이름 뒤에서 점까지
				String originalFilename = i.getOriginalFilename(); // 원본이름
				int p = originalFilename.lastIndexOf("."); // 마지막 점의 위치
				String ext = originalFilename.substring(p+1);
				// 중복되지 않는 문자이름 생성
				String prename = UUID.randomUUID().toString().replace("-", "");
				String filename = prename;
				
				accomBuildingImage.setAccomBuildingImageName(filename);
				accomBuildingImage.setAccomBuildingImageExt(ext);
				accomBuildingImage.setAccomBuildingImageSize(i.getSize());
				log.debug("☆[지혜]service☆ accomBuildingImage : " + accomBuildingImage);
				
				// 2-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingImage(accomBuildingImage);
				
				// 2-2) 이미지 파일을 저장
				File f = new File(realPath+filename+"."+ext);
				try {
					i.transferTo(f);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					// IllegalStateException | IOException e 예외처리를 무조건 해야하는 예외
					// RuntimeException은 예외처리를 하지 않아도 됨
					throw new RuntimeException();
				}
			}
		}
		
		// 3) 숙소-건물의 주소 입력 : accomAddress 입력
		AccomAddress accomAddress = accomBuildingForm.getAccomAddress();
		accomAddress.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
		log.debug("☆[지혜]service☆ accomAddress : " + accomAddress);
		// 3-1) 테이블에 저장
		accomBuildingMapper.insertAccomBuildingAddress(accomAddress);
		
		// 4) 숙소-건물의 시설 입력 : accomBuildingFacility 입력
		List<AccomBuildingFacility> facilityList = accomBuildingForm.getAccomBuildingFacility();
		if(facilityList != null) {
			for(AccomBuildingFacility f : facilityList) {
				AccomBuildingFacility accomBuildingFacility = new AccomBuildingFacility();
				accomBuildingFacility.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingFacility.setAccomBuildingFacilityName(f.getAccomBuildingFacilityName());
				log.debug("☆[지혜]service☆ accomBuildingFacility : " + accomBuildingFacility);
				
				// 4-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingFacility(accomBuildingFacility);
			}
		}
		
		// 5) 숙소-건물의 추천장소 입력
		// accomSpotForm으로 숙소-건물의 추천장소와 주소 리스트도 같이 불러와 저장한다
		List<AccomSpotForm> spotList = accomBuildingForm.getAccomSpotForm();
		if(spotList != null) {
			for(AccomSpotForm s : spotList) {
				AccomBuildingSpot accomBuildingSpot = new AccomBuildingSpot();
				accomBuildingSpot.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingSpot.setAccomBuildingSpotName(s.getAccomBuildingSpot().getAccomBuildingSpotName());
				accomBuildingSpot.setAccomBuildingSpotCategory(s.getAccomBuildingSpot().getAccomBuildingSpotCategory());
				accomBuildingSpot.setAccomBuildingSpotDescription(s.getAccomBuildingSpot().getAccomBuildingSpotDescription());
				log.debug("☆[지혜]service☆ accomBuildingSpot : " + accomBuildingSpot);
			
				// 5-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingSpot(accomBuildingSpot);
				
				// 5-2)
				// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingSpotNo 값 입력해줌
				// accomBuildingSpotNo = auto increment로 입력된 값
				log.debug("☆[지혜]service☆ accomBuildingSpotNo : " + accomBuildingSpot.getAccomBuildingSpotNo());
				SpotAddress spotAddress = new SpotAddress();
				spotAddress.setSpotNo(accomBuildingSpot.getAccomBuildingSpotNo());
				spotAddress.setSpotAddressPotalCode(s.getSpotAddress().getSpotAddressPotalCode());
				spotAddress.setSpotAddressZip(s.getSpotAddress().getSpotAddressZip());
				spotAddress.setSpotAddressDetail(s.getSpotAddress().getSpotAddressDetail());
				log.debug("☆[지혜]service☆ spotAddress : " + spotAddress);
				
				// 5-3) 테이블에 저장
				accomBuildingMapper.insertAccomSpotAddress(spotAddress);
			}
		}
		
		/*
		// 5) 숙소-건물의 추천장소 입력
		// 숙소-건물의 추천장소와 주소 리스트도 같이 불러와 저장한다
		List<AccomBuildingSpot> spotList = accomBuildingForm.getAccomBuildingSpot();
		List<SpotAddress> spotAddressList = accomBuildingForm.getSpotAddress();
		if(spotList != null) {
			for(AccomBuildingSpot s : spotList) {
				AccomBuildingSpot accomBuildingSpot = new AccomBuildingSpot();
				accomBuildingSpot.setAccomBuildingNo(accomBuilding.getAccomBuildingNo());
				accomBuildingSpot.setAccomBuildingSpotName(s.getAccomBuildingSpotName());
				accomBuildingSpot.setAccomBuildingSpotCategory(s.getAccomBuildingSpotCategory());
				accomBuildingSpot.setAccomBuildingSpotDescription(s.getAccomBuildingSpotDescription());
				log.debug("☆[지혜]service☆ accomBuildingSpot : " + accomBuildingSpot);
			
				// 5-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingSpot(accomBuildingSpot);
				
				// 5-2)
				// 입력시 만들어진 key 값을 리턴 받아야 함 -> 매개변수 accomBuildingSpotNo 값 입력해줌
				// accomBuildingSpotNo = auto increment로 입력된 값
				log.debug("☆[지혜]service☆ accomBuildingSpotNo : " + accomBuildingSpot.getAccomBuildingSpotNo());
				
				for(SpotAddress sa : spotAddressList) {
					SpotAddress spotAddress = new SpotAddress();
					spotAddress.setSpotNo(accomBuildingSpot.getAccomBuildingSpotNo());
					spotAddress.setSpotAddressPotalCode(sa.getSpotAddressPotalCode());
					spotAddress.setSpotAddressZip(sa.getSpotAddressZip());
					spotAddress.setSpotAddressDetail(sa.getSpotAddressDetail());
					log.debug("☆[지혜]service☆ spotAddress : " + spotAddress);
					
					// 5-3) 테이블에 저장
					// 저장이 완료되면 break
					accomBuildingMapper.insertAccomSpotAddress(spotAddress);
				}
			}
		}
		*/
		
		// 6) 숙소-건물의 해시태그 입력
		List<Hashtag> hashtagList = accomBuildingForm.getHashtag();
		if(hashtagList != null) {
			for(Hashtag h : hashtagList) {
				Hashtag hashtag = new Hashtag();
				hashtag.setIdenNo(accomBuilding.getAccomBuildingNo());
				hashtag.setTableName("건물");
				hashtag.setHashtag(h.getHashtag());
				log.debug("☆[지혜]service☆ hashtag : " + hashtag);
				
				// 6-1) 테이블에 저장
				accomBuildingMapper.insertAccomBuildingHashtag(hashtag);
			}
		}
	}
}