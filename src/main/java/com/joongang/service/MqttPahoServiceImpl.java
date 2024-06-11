package com.joongang.service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.paho.client.mqttv3.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.integration.mqtt.inbound.MqttPahoMessageDrivenChannelAdapter;
import org.springframework.integration.mqtt.outbound.MqttPahoMessageHandler;
import org.springframework.integration.mqtt.support.MqttHeaders;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.Message;

import com.joongang.domain.SmartSolarSystemVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class MqttPahoServiceImpl implements MqttPahoService {
	
	@Autowired
	private MqttPahoMessageHandler mqttOutboundHandler;
	
	@Autowired
	private MqttPahoMessageDrivenChannelAdapter mqttInboundAdapter;
	
	@Autowired
	private MqttService mqttService;
	
	private Long currentTime = 0L;
	private SmartSolarSystemVO sc = new SmartSolarSystemVO();
	
	@Override
	public void publishMsg(String msgContent, String targetTopic) {
		// TODO Auto-generated method stub
		log.info("Sending msg "+ msgContent +" to targetTopic "+targetTopic);
		Message<String> message = MessageBuilder.withPayload(msgContent).setHeader(MqttHeaders.TOPIC, targetTopic).build();  
		mqttOutboundHandler.handleMessage(message);  
		
	}

	// Subscribe Message handler
	public void handleSubscribeTopicMsg(Message message) {	
		log.info("Incoming Msg from topic --" + message.getHeaders().get("mqtt_receivedTopic"));
		String topic = message.getHeaders().get("mqtt_receivedTopic").toString();
		String msgContent = message.getPayload().toString();
		log.info("Incoming msg content --" + msgContent);
		
		if (Strings.isEmpty(msgContent)) {
		return;
		}
		
		String[] buf = msgContent.split("/");
		List<String> list = Arrays.stream(buf).map(array -> array.trim()).collect(Collectors.toList());
		log.info(list);
		sc.setAutomode(list.get(1));
		sc.setHorizontal(list.get(3));
		sc.setVertical(list.get(5));
		sc.setVolt(list.get(7));
		mqttService.register(sc);
		
		if (Strings.isEmpty(msgContent)) {
			return;
		}
		
		boolean msgReceived = false;
		currentTime = System.currentTimeMillis();
		if (sc.getCurrentTime() == 0L) {
			sc.setCurrentTime(currentTime);
		}
		if ((currentTime - sc.getCurrentTime()) > 1000) {
			// new msg's coming...
			msgReceived = true;
			sc.setCurrentTime(currentTime);
		}
		
	}

	
}
