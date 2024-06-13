package com.joongang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joongang.domain.Criteria;
import com.joongang.domain.PageDTO;
import com.joongang.domain.SmartSolarSystemVO;
import com.joongang.mapper.SmartSolarSystemMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MqttServiceImpl implements MqttService {

	@Autowired
	private SmartSolarSystemMapper mapper;
	private SmartSolarSystemVO tch = new SmartSolarSystemVO();
	
	@Override
	public void register(SmartSolarSystemVO sc) {
		log.info("register...." + sc);
		if (!tch.equals(sc)) {
			mapper.insert(sc);
			tch.setAutomode(sc.getAutomode());
			tch.setHorizontal(sc.getHorizontal());
			tch.setVertical(sc.getVertical());
			tch.setVolt(sc.getVolt());

		}
	}
	
	@Override
	public PageDTO getList(Criteria criteria) {
		return new PageDTO(mapper.getTotalCount(),
				mapper.getListWithPaging(criteria));
	}
	
	@Override
	public SmartSolarSystemVO getSmartSolarSystemState() {
		log.info("getSmartSolarSystemState.....");
		if (tch.getAutomode().equals("")) {
			tch.setHorizontal("65");
			tch.setVertical("15");
			tch.setAutomode("x");
			tch.setVolt("x");
		}
		return tch;
	}

	@Override
	public int getCnt() {
		return mapper.getTotalCount();
	}
	

}
