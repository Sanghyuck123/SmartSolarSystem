package com.joongang.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joongang.domain.Criteria;
import com.joongang.domain.PageDTO;
import com.joongang.domain.SmartSolarSystemVO;
import com.joongang.service.MqttPahoService;
import com.joongang.service.MqttService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mqtt/*")
@AllArgsConstructor
public class MqttController {
	
	private MqttService service;
	
	private MqttPahoService pahoService;
	
	private static final String inTopic = "SolarSystem/rx";
	
	@GetMapping("/main")
	public void main(Model model) {
	}
	
	@GetMapping(value = "/list/{page}", produces = {MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<PageDTO> getMainPageList(@PathVariable("page") int page) {
		log.info("getMainPageList.................");
		Criteria criteria = new Criteria(page, 10);
		PageDTO list = service.getList(criteria);
		return new ResponseEntity<>(service.getList(criteria), HttpStatus.OK);
	}
	
	@GetMapping(value = "/pubish", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> publish(@RequestParam("command")String command) {
		log.info("publish.................");
		pahoService.publishMsg(command, inTopic);
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@GetMapping(value = "/getSmartSolarSystemState", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<SmartSolarSystemVO> getSmartSolarSystemState() {
		log.info("/getSmartSolarSystemState");
		return new ResponseEntity<>(service.getSmartSolarSystemState(), HttpStatus.OK);
	}
	

}
