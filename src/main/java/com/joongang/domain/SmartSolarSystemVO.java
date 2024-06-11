package com.joongang.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SmartSolarSystemVO {
	private Long rn;
	private Long id = 0L;
	private String volt= "";
	private String horizontal= "";
	private String vertical= "";
	private String automode= "";
	private Timestamp time;
	private Long currentTime = 0L;
	
	
	public String getAutomodeState( ) {
		if(automode.equals("0")) {
			return "on";
		} else {
			return "off";
		}
	}
	
	public boolean equals(SmartSolarSystemVO sc) {
		return ( this.getVolt().equals(sc.getVolt())
				&& this.getHorizontal().equals(sc.getHorizontal())
				&& this.getVertical().equals(sc.getVertical())
				&& this.getAutomode().equals(sc.getAutomode()) ) ? true : false;
		
		
		
	}
}

