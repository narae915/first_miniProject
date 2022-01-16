<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
	<script type = "text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function reserve(userId) 
		{
			var resIndate = document.querySelector("input[type='date']").value; // 날짜
			var resIntime = document.getElementById("resIntime").value; // 시간
			var desNumS = $("input[name='desNum']:checked").val(); // 디자이너 사원번호
			
			// 시술 종류 3가지
			var hairType1 = $("#hairType1").val();
			var hairType2 = $("#hairType2").val();
			var hairType3 = $("#hairType3").val();
			
			// 시술 종류 3가지 가격
			var priceS1 = $("#hairType1").find("option:selected").data("price");
			var priceS2 = $("#hairType2").find("option:selected").data("price");
			var priceS3 = $("#hairType3").find("option:selected").data("price");
			
			// CheckBox 체크 여부 확인
			var checked1 = $('#check1').is(':checked');
			var checked2 = $('#check2').is(':checked');
			var checked3 = $('#check3').is(':checked');
			
			/* 시술 체크 여부에 따른 경우의 수 */
			if ( checked1 && !checked2 && !checked3 )
			{
				var hairType = hairType1; // 시술 종류 선택 문자열 합치기
				var priceS = priceS1; // 선택 시술 가격
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			if ( !checked1 && checked2 && !checked3 )
			{
				var hairType = hairType2; // 시술 종류 선택 문자열 합치기
				var priceS = priceS2; // 선택 시술 가격
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			if ( !checked1 && !checked2 && checked3 )
			{
				var hairType = hairType3; // 시술 종류 선택 문자열 합치기
				var priceS = priceS3; // 선택 시술 가격
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			if ( checked1 && checked2 && !checked3 )
			{
				var hairType = hairType1 + " / " + hairType2; // 시술 종류 선택 문자열 합치기
				var priceS = priceS1 + priceS2; // 선택 시술 가격 합계
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			if ( checked1 && !checked2 && checked3 )
			{
				var hairType = hairType1 + " / " + hairType3; // 시술 종류 선택 문자열 합치기
				var priceS = priceS1 + priceS3; // 선택 시술 가격 합계
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			if ( !checked1 && checked2 && checked3 )
			{
				var hairType = hairType2 + " / " + hairType3; // 시술 종류 선택 문자열 합치기
				var priceS = priceS2 + priceS3; // 선택 시술 가격 합계
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "/order/resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			// 3가지 모두 선택시
			if ( checked1 && checked2 && checked3 )
			{
				var hairType = hairType1 + " / " + hairType2 + " / " + hairType3; // 시술 종류 선택 문자열 합치기
				var priceS = priceS1 + priceS2 + priceS3; // 시술 종류 3가지 가격 합계
				
				if(confirm("예약을 확정하시겠습니까?") == true)
				{
					$.ajax
					({
						url: "/order/reserve",
						type: "post",
						data:
						{
							resIndate: resIndate,
							resIntime: resIntime,
							desNumS: desNumS,
							hairType: hairType,
							priceS: priceS
						}
					})
					
					location.href = "resList?userId="+userId;
				}
				else
				{
					return;
				}
			}
			
			/* 유효성 검사 */
			// 예약 날짜 확인
		 	if ( resIndate == "" )
			{
				alert("예약 날짜를 확인해주세요.");
			}
			
			// 예약 시간 확인
			if ( resIntime == "예약 시간" )
			{
				alert("예약 시간을 확인해주세요.");
			}
			
			// 시술을 선택하지 않았을 때
			if ( !checked1 && !checked2 && !checked3 )
			{
				alert("시술 종류를 하나 이상 선택해주세요.");
			}
		}
	</script>
</head>
<body>
	<h1>[ 예약 ]</h1>

	<form action = "/updateRes" method = "post">
		<table>
			<tr>
				<td>
					<label>
						<input type = "radio" name = "desNum" value = "1" checked = "checked">
						<img src = "/resources/image/image1.jpg" alt = "디자이너1" height = "245" width = "245">
					</label>
				</td>
				<td>
					<label>
						<input type = "radio" name = "desNum" value = "2">
						<img src = "/resources/image/image2.jpg" alt = "디자이너2" height = "245" width = "245">
					</label>
				</td>
			</tr>
			<tr>
				<td>카나다 원장</td>
				<td>오키나와 디자이너</td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type = "date" id = "resIndate" name = "resIndate" value = "">
					<select id = "resIntime" name = "resIntime">
						<option selected>예약 시간</option>
						<option value = "10:00">10:00</option>
						<option value = "10:30">10:30</option>
						<option value = "11:00">11:00</option>
						<option value = "11:30">11:30</option>
						<option value = "12:00">12:00</option>
						<option value = "12:30">12:30</option>
						<option value = "13:00">13:00</option>
						<option value = "13:30">13:30</option>
						<option value = "14:30">14:30</option>
						<option value = "15:00">15:00</option>
						<option value = "15:30">15:30</option>
						<option value = "16:00">16:00</option>
						<option value = "16:30">16:30</option>
						<option value = "17:00">17:00</option>
						<option value = "17:30">17:30</option>
					</select>
				</td>
			</tr>
			<tr>
				<!-- <td>시술메뉴선택
					<select id = "hairType1" name = "hairType1">
						<optgroup label = "컷">
							<option value = "남성컷" data-price = "15000">남성컷</option>
							<option value = "레이어드" data-price = "19000">레이어드</option>
							<option value = "태슬컷" data-price = "20000">태슬컷</option>
							<option value = "페이스라인컷" data-price = "5000">페이스라인컷</option>
							<option value = "허쉬컷" data-price = "18000">허쉬컷</option>
						</optgroup>
					</select>
					<select id = "hairType2" name = "hairType2">
						<optgroup label = "펌">
							<option value = "그레이스펌">그레이스펌</option>
							<option value = "매직" data-price = "80000">매직</option>
							<option value = "볼륨매직" data-price = "100000">볼륨매직</option>
							<option value = "빌드펌" data-price = "100000">빌드펌</option>
							<option value = "웨이브펌" data-price = "150000">웨이브펌</option>
							<option value = "허쉬펌" data-price = "160000">허쉬펌</option>
							<option value = "히피펌" data-price = "150000">히피펌</option>
						</optgroup>
					</select>
					<select id = "hairType3" name = "hairType3">
						<optgroup label = "컬러">
							<option value = "뿌리염색" data-price = "60000">뿌리염색</option>
							<option value = "전체염색" data-price = "80000">전체염색</option>
							<option value = "탈색" data-price = "80000">탈색</option>
							<option value = "하이라이트" data-price = "100000">하이라이트</option>
						</optgroup>
					</select> -->
				<td>
				<ul>
   					<li>
   						<input type = "checkbox" name = "check1" id = "check1" value = "컷">
   						<label for = "check1"><span></span>&nbsp;&nbsp;&nbsp;컷</label>
   						<select id = "hairType1" name = "hairType1">
							<optgroup label = "컷">
								<option value = "남성컷" data-price = "15000">남성컷</option>
								<option value = "레이어드" data-price = "19000">레이어드</option>
								<option value = "태슬컷" data-price = "20000">태슬컷</option>
								<option value = "페이스라인컷" data-price = "5000">페이스라인컷</option>
								<option value = "허쉬컷" data-price = "18000">허쉬컷</option>
							</optgroup>
						</select>
   					</li>
   					<li>
   						<input type = "checkbox" name = "check2" id = "check2" value = "펌">
   						<label for = "check2"><span></span>&nbsp;&nbsp;&nbsp;펌</label>
   						<select id = "hairType2" name = "hairType2">
							<optgroup label = "펌">
								<option value = "그레이스펌">그레이스펌</option>
								<option value = "매직" data-price = "80000">매직</option>
								<option value = "볼륨매직" data-price = "100000">볼륨매직</option>
								<option value = "빌드펌" data-price = "100000">빌드펌</option>
								<option value = "웨이브펌" data-price = "150000">웨이브펌</option>
								<option value = "허쉬펌" data-price = "160000">허쉬펌</option>
								<option value = "히피펌" data-price = "150000">히피펌</option>
							</optgroup>
						</select>
   					</li>
   					<li>
   						<input type = "checkbox" name = "check3" id = "check3" value = "컬러">
   						<label for = "check3"><span></span>컬러</label>
   						<select id = "hairType3" name = "hairType3">
							<optgroup label = "컬러">
								<option value = "뿌리염색" data-price = "60000">뿌리염색</option>
								<option value = "전체염색" data-price = "80000">전체염색</option>
								<option value = "탈색" data-price = "80000">탈색</option>
								<option value = "하이라이트" data-price = "100000">하이라이트</option>
							</optgroup>
						</select>
   					</li>
   				</ul>
   				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<div align = "right">
						<input type = "button" value = "예약하기" onclick = "reserve(${sessionScope.userId });">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>