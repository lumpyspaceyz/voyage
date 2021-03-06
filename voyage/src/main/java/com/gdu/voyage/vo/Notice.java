package com.gdu.voyage.vo;

import java.util.List;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeTop;
	private int noticeViewCnt;
	private String createDate;
	private String updateDate;
	
	// 공지사항 - 파일
	// 1 : 1
	private NoticeFile noticeFile;
	
	//검색용
	private String searchNotice;
}
