package com.joongang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joongang.domain.Criteria;
import com.joongang.domain.SmartSolarSystemVO;

public interface SmartSolarSystemMapper {
	public void insert(SmartSolarSystemVO sc);
	public List<SmartSolarSystemVO> getList(Criteria criteria);
	public int getTotalCount();
	public List<SmartSolarSystemVO> getListWithPaging(@Param("criteria")Criteria criteria);
}
