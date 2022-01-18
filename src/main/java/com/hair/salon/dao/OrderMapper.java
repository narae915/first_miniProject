package com.hair.salon.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.hair.salon.vo.OrderVO;
import com.hair.salon.vo.ReviewVO;

public interface OrderMapper {
	
	/* 예약 리스트 페이지 이동(조회) */
	ArrayList<OrderVO> getOrderList(String userId);
	
	/* 과거 이용 리스트 조회 */
	ArrayList<OrderVO> getPastOrder(String userId);

	/* 예약 */
	int insertReserve(OrderVO newOrder);
	
	/* 예약 취소 */
	int deleteOrder(int resNum);

	/* 작성한 후기 DB 저장 */
	int insertReview(ReviewVO review);

	/* 리뷰 조회 */
	ArrayList<ReviewVO> getReviewList();

	/* 과거 이용 조회(리뷰용) */
	OrderVO getPastOneOrder(int resNum);

}
