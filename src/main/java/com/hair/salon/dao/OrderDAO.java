package com.hair.salon.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hair.salon.vo.OrderVO;
import com.hair.salon.vo.ReviewVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession session;

	/* 예약 리스트 페이지 이동(조회) */
	public ArrayList<OrderVO> getOrderList(String userId) {
		ArrayList<OrderVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getOrderList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 과거 이용 리스트 조회 */
	public ArrayList<OrderVO> getPastOrder(String userId) {
		ArrayList<OrderVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getPastOrder(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 예약 */
	public int insertReserve(OrderVO newOrder) 
	{
		int result = 0;
		OrderMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.insertReserve(newOrder);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	/*예약 취소 (예약번호)*/
	public int deleteOrder(int resNum) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.deleteOrder(resNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 작성한 후기 DB 저장 */
	public int insertReview(ReviewVO review) {
		int result = 0;
		OrderMapper mapper = null;
		try	{
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.insertReview(review);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 리뷰 조회 */
	public ArrayList<ReviewVO> getReviewList() {
		ArrayList<ReviewVO> result = null;
		OrderMapper mapper = null;
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getReviewList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 과거 이용 조회(리뷰용) */
	public OrderVO getPastOneOrder(int resNum) {
		OrderVO result = null;
		OrderMapper mapper = null;
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getPastOneOrder(resNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

} // class OrderDAO