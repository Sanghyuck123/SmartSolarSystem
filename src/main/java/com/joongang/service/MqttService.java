package com.joongang.service;

import java.util.List;

import com.joongang.domain.Criteria;
import com.joongang.domain.PageDTO;
import com.joongang.domain.SmartSolarSystemVO;

public interface MqttService {
	
	public void register(SmartSolarSystemVO sh);
	public PageDTO getList(Criteria criteria);
	public SmartSolarSystemVO getSmartSolarSystemState();
	public int getCnt ();
	
}
