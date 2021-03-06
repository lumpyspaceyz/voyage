package com.gdu.voyage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.MemberMapper;
import com.gdu.voyage.vo.Member;
import com.gdu.voyage.vo.MemberAddress;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	
	public void updateAuthKey(Map<String, String> map) {
		memberMapper.updateAuthKey(map);
	}
	
	public void updateAuthStatus(Map<String, String> map) {
		memberMapper.updateAuthStatus(map);
	}
	
 /* 휴면 계정 처리. 마지막 로그인 날짜가 지금으로부터 반년 이상이거나
	생성날짜가 반년 이상이고 로그인 기록이 없는 대상을 휴면 처리 */
	public int updateDormantMember() {
		return memberMapper.updateDormantMember();
	}
	
	// 회원 PW 변경
	public void deleteMember(Member member) {
		log.trace("☆service☆"+member);
		memberMapper.deleteMember(member);
		return;
	}
	
	// 회원 PW 변경
	public void updateMemberPw(Member member) {
		log.trace("☆service☆"+member);
		memberMapper.updateMemberPw(member);
		return;
	}
	
	// 회원 닉네임 변경
	public void updateMemberNickname(Member member) {
		log.trace("☆service☆"+member);
		memberMapper.updateMemberNickname(member);
		return;
	}
	
	// 회원 주소 수정
	public void updateMemberAddress(MemberAddress mAddress) {
		log.trace("☆service☆"+mAddress);
		memberMapper.updateMemberAddress(mAddress);
		return;
	}
	
	// 회원 정보 수정
	public void updateMember(Member member) {
		log.trace("☆service☆"+member);
		memberMapper.updateMember(member);
		return;
	}
	
	// 회원가입 시 아이디 따로 저장해둠(재가입 방지)
	public void addMemberCreateId(String memberId) {
		log.trace("☆service☆"+memberId);
		memberMapper.insertCreateId(memberId);
		return;
	}
	
	// 회원가입 중복검사
	public String duplMemberCheck(Member member) {
		log.trace("☆service☆"+member.toString());
		int idCheck = memberMapper.selectMemberId(member);
		if(idCheck == 1) {
			log.trace("☆service☆ : 아이디중복");
			return "아이디중복";
		};
		int nicknameCheck = memberMapper.selectMemberNickName(member);
		if(nicknameCheck == 1) {
			log.trace("☆service☆ : 닉네임중복");
			return "닉네임중복";
		}
		
		return "중복없음";
	}
	 
	// 회원 주소 추가
	public void addMemberAddress(MemberAddress mAddress) {
		log.trace("☆service☆"+mAddress.toString());
		memberMapper.insertMemberAddress(mAddress);
		return;
	}
	
	// 회원 추가
	public void addMember(Member member) {
		log.trace("☆service☆"+member.toString());
		memberMapper.insertMember(member);
		return;
	}

}
