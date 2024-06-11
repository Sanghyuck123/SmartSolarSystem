package com.joongang.domain;

import java.util.List;

import lombok.Data;

@Data
public class PageDTO {
	private int Cnt;
	private List<SmartSolarSystemVO> list;
	
	public PageDTO(int Cnt, List<SmartSolarSystemVO> list) {
		this.Cnt = Cnt;
		this.list = list;
	}
}
