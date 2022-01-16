package com.hair.salon.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hair.salon.dao.OrderDAO;
import com.hair.salon.vo.OrderVO;
import com.hair.salon.vo.ReviewVO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;

	/* 예약 리스트 페이지 이동(조회) */
	public ArrayList<OrderVO> getOrderList(String userId) {
		return dao.getOrderList(userId);
	}
	
	/* 과거 이용 리스트 조회 */
	public ArrayList<OrderVO> getPastOrder(String userId) {
		return dao.getPastOrder(userId);
	}

	/* 예약 */
	public boolean insertReserve(String loginId, int desNum, String resIndate, String hairType, int price) 
	{
		OrderVO newOrder = new OrderVO();
		newOrder.setUserId(loginId);
		newOrder.setDesNum(desNum);
		newOrder.setResIndate(resIndate);
		newOrder.setHairType(hairType);
		newOrder.setPrice(price);
		
		return dao.insertReserve(newOrder) > 0;
	}

	public boolean deleteOrder(int resNum) {
		return dao.deleteOrder(resNum) > 0;
	}

	/* 작성한 후기 DB 저장 */
	public boolean insertReview(ReviewVO review) {
		return dao.insertReview(review) > 0;
	}
	
	/* 리뷰 내역 조회 */
	public ArrayList<ReviewVO> getReviewList() {
		return dao.getReviewList();
	}

} // class OrderService
