package com.hair.salon;

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
import com.hair.salon.vo.ReviewVO;

@Controller
public class HomeController {
	
	@Autowired
	private OrderService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("HOME 메소드 실행(GET)");
		
		ArrayList<ReviewVO> reviewList = new ArrayList<>();
		reviewList = service.getReviewList();
		
		if(reviewList != null) {
			logger.info("불러오기 성공");
			model.addAttribute("reviewList", reviewList);
		} else {
			logger.info("불러오기 실패");
		}
		return "home";
	}

	/* 후기 페이지 이동 */
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(int resNum, HttpSession session, Model model) {
		logger.info("review 메소드 실행(GET)");
		logger.info("resNum : {}", resNum);
		
		OrderVO pastOrder = new OrderVO();
		pastOrder = service.getPastOneOrder(resNum);
		logger.info("pastOrder : {} ", pastOrder);
		model.addAttribute("pastOrder", pastOrder);
		
		return "review";
	}
	
	/* 작성한 후기 DB 저장 */
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String review(ReviewVO review, HttpSession session) {
		logger.info("resNum : {}", review.getResNum());
		logger.info("score : {}", review.getScore());
		logger.info("revContent : {}", review.getRevContent());
		
		String userId = (String)session.getAttribute("loginId");
		review.setUserId(userId);
		
		boolean result = service.insertReview(review);
		String returnUrl = null;
		if(result) {
			logger.info("후기 작성 성공");
			returnUrl = "redirect:/";
		} else {
			returnUrl = "review";
		}
		return returnUrl;
	}
}
