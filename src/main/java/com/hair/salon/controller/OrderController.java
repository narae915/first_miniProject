package com.hair.salon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hair.salon.service.OrderService;
import com.hair.salon.vo.OrderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService service;
	
	/* 예약 리스트 페이지 이동(조회) */
	@RequestMapping(value = "/resList", method = RequestMethod.GET)
	public String resList (HttpSession session, Model model) {

		logger.info("resList 메서드 실행(GET)");
		
		//로그인한 Id를 가져와서 예약리스트 조회
		String userId = (String)session.getAttribute("loginId");
		logger.info("loginId : {}", userId);
		
		//예약중인 리스트 조회
		ArrayList<OrderVO> orderList = new ArrayList<>();
		orderList = service.getOrderList(userId);
		logger.info("orderList: {}" , orderList);
		
		if(orderList != null) {
			logger.info("예약 리스트 조회 성공");
			model.addAttribute("orderList", orderList);
		} 
		
		//과거 이용 리스트 조회
		ArrayList<OrderVO> pastList = new ArrayList<>();
		pastList = service.getPastOrder(userId);
		logger.info("pastList : {}", pastList);
		
		if(pastList != null) {
			logger.info("과거 이용 내역 조회 성공");
			model.addAttribute("pastList", pastList);
		}
		
		return "order/resList";

	}

	/* 예약 페이지 이동 */
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reserve()
	{
		logger.info("reserve 메서드 실행(GET)");
		
		return "order/reserve";
	}
	
	/* 예약 */
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(String resIndate, String desNumS, String resIntime, 
							String hairType, String priceS, HttpSession session, Model model)
	{
		logger.info("reserve 메서드 실행(POST)");
		
		// 예약번호, 사용자 ID, 디자이너 사원번호, 시술 종류, 가격
		String loginId = (String) session.getAttribute("loginId"); // 사용자 이름
		logger.info(loginId);

		// 가져온 값 확인하기
		logger.info("resIndate: {}", resIndate); // 예약 날짜
		logger.info("resIntime: {}", resIntime); // 예약 시간
		// 디자이너 사원번호 인트형으로 변환
		int desNum = Integer.parseInt(desNumS);
		logger.info("desNum: {}", desNum); // 디자이너 사원번호
		logger.info("hairType: {}", hairType); // 시술 종류
		// 가격 인트형으로 변환
		int price = Integer.parseInt(priceS);
		logger.info("price: {}", price); // 가격
		// 날짜와 시간 병합
		resIndate += resIntime ;
		logger.info("resIndate: {}", resIndate); // 예약 날짜 최종
		
		boolean result = service.insertReserve(loginId, desNum, resIndate, hairType, price);
		
		String returnUrl = null;
		
		// 예약 성공 여부
		if ( result )
		{
			logger.info("예약 성공 !");
			
			returnUrl = "redirect:order/resList?userId=" + loginId;
		}
		else
		{
			logger.info("예약 실패");
			
			returnUrl = "order/reserve?userId=" + loginId;
		}
		
		return returnUrl;
	}
	
	/* 예약 수정 페이지 이동 */
	@RequestMapping (value = "/updateRes", method = RequestMethod.GET)
	public String updateRes(String userId) 
	{
		logger.info("updateRes 메서드 실행(GET)");
		
		return "order/updateRes";
	}
	
	/*예약 취소*/	
	@RequestMapping(value ="/deleteOrder", method = RequestMethod.GET)
	public String deleteOrder(int resNum) {
		logger.info("deleteOrder 메서드 실행(GET)");
		
		logger.info("resNum{}:", resNum);
		
		boolean result = service.deleteOrder(resNum);
		
		if(result) {
			logger.info("예약 취소");
			
			return "redirect:/";
		}else {
			logger.info("예약 취소 실패");
			return "order/resList";
		}
	}
	
} // class OrderController