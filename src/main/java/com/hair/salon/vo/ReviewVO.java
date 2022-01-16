package com.hair.salon.vo;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int resNum; //예약번호
	private String userId; // 사용자 ID
	private String userNm; // 사용자 이름
	private int score; // 평점
	private String revContent; // 후기
	private String revIndate; // 후기 작성 날짜

}
