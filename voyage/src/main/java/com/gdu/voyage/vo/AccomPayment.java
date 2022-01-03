package com.gdu.voyage.vo;

import lombok.Data;

@Data
public class AccomPayment {
	private int accomPaymentNo;
	private int accomRoomNo;
	private String memberId;
	private String accomCheckIn;
	private String accomCheckOut;
	private int accomAmount;
	private int accomUsePerson;
	private String accomPaymentState;
	private String receipt;
	private String createDate;
	private String updateDate;
	
	// 결제내역 설명에 필요
	private AccomBuilding accomBuilding;
	private AccomRoom accomRoom;
	private AccomRoomImage accomRoomImage;
}
