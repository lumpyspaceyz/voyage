package com.gdu.voyage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.HashtagMapper;
import com.gdu.voyage.vo.Hashtag;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class HashtagService {
	@Autowired HashtagMapper hashtagMapper;
	
	public Map<String, Object> getHashtagList() {
		
		List<Hashtag> hashtagList = hashtagMapper.selectHashtagList();
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("hashtagList", hashtagList);
		
		return returnMap;
	}

}