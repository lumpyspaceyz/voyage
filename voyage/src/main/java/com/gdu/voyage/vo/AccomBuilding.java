package com.gdu.voyage.vo;

import java.util.List;

//import java.util.List;

import lombok.Data;

@Data
public class AccomBuilding {
	private int accomBuildingNo;
	private int hostNo;
	private String accomBuildingName;
	private String accomBuildingDescription;
	private String accomBuildingPhone;
	private String accomBuildingState;
	private String accomBuildingStateAdmin;
	private String createDate;
	private String updateDate;
	private int roomCnt;
	private int cnt;
	
	// 평균값
	private double AVG;
	// 1:1 AccomBuildingImage (이미지 하나만 불러올때)
	private AccomBuildingImage accomBuildingImage;
	// 1:N - AccomBuildingImage
	private List<AccomBuildingImage> accomBuildingImageList;
	// 1:1 - AccomAddress
	private AccomAddress accomAddress;
	// 1:N - AccomBuildingFacility
	private List<AccomBuildingFacility> accomBuildingFacilityList;
	// 1:N - AccomBuildingSpot
	private List<AccomBuildingSpot> accomBuildingSpotList;
	// 1:N - Hashtag
	private List<Hashtag> hashtagList;
}
