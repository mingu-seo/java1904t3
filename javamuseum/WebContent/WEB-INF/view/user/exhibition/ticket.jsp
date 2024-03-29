<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%
UExhibitionVO ticket = (UExhibitionVO)request.getAttribute("ticket");
MemberVO member = (MemberVO)request.getAttribute("member");
%>
<script>
/* $(function(){
	var IMP = window.IMP;
	IMP.init('imp10084821');
}); */

function setComma(v) {
	 var rV="";//리턴할 값
	 var vS=new String(v), leng=vS.length;

	 var remnant = leng%3;
	 if(remnant==0) remnant=3;

	 while( leng>3 ) {
	  rV += vS.substr(0,remnant)+",";
	  vS = vS.substr(remnant);

	  leng = vS.length;
	  remnant=3;
	 }
	 rV += vS;

	 return rV;
	}

function goSave(){
	
	if ($("#totnumber").val() == 0) {
		alert("인원을 선택해주세요.");
		return false;
	}
	if (!$("#chk01").prop("checked") && !$("#chk02").prop("checked")) {
		alert("결제 수단을 선택해주세요.");
		return false;
	}
	
	var IMP = window.IMP;
	IMP.init('imp10084821');
	if($("#chk01").prop("checked")){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'vbank',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '<%=ticket.getTitle()%>',
		    amount : $("#totalPrice").val() - $("#con3-usepoint").val(),
		    buyer_email : '<%=member.getEmail()%>',
		    buyer_name : '<%=member.getName()%>',
		    buyer_tel : '<%=member.getTel()%>',
		    buyer_addr : '<%=member.getAddr1()%>',
		    buyer_postcode : '<%=member.getZipcode()%>',
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        $.ajax({
		        	type: "POST",
		        	url: "/user/exhibition/process",
		        	async: false,
		        	data: $("[name=frm]").serialize(),
		        	success: function(data){
		        		
		        	}
		        });
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	} else if($("#chk02").prop("checked")) {
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '<%=ticket.getTitle()%>',
		    amount : $("#totalPrice").val() - $("#con3-usepoint").val(),
		    buyer_email : '<%=member.getEmail()%>',
		    buyer_name : '<%=member.getName()%>',
		    buyer_tel : '<%=member.getTel()%>',
		    buyer_addr : '<%=member.getAddr1()%>',
		    buyer_postcode : '<%=member.getZipcode()%>',
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        /* msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid; */
		        msg += '결제 금액 : ' + rsp.paid_amount + "원이 결제 되었습니다.";
		        /* msg += '카드 승인번호 : ' + rsp.apply_num; */
		        
		        $.ajax({
		        	type: "POST",
		        	url: "/user/exhibition/process",
		        	async: false,
		        	data: $("[name=frm]").serialize(),
		        	success: function(data){
		        		
		        	}
		        });
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	return false;
	
}

function sumPrice() {
	var totalPrice = 0;
	var num = parseInt($("#old_number").val()) + parseInt($("#adult_number").val()) + parseInt($("#student_number").val());
	if(num >= 5){
		 totalprice = (parseInt($("#old_number").val()) * 5000)
		 +((parseInt($("#adult_number").val())
		 +parseInt($("#student_number").val())) * 7000);
	} else {
		totalprice = (parseInt($("#old_number").val()) * 5000)
		+(parseInt($("#adult_number").val()) * 9000)
		+(parseInt($("#student_number").val()) * 8000);
	}
	$("#totnumber").val(num);
	$("#totalPrice").text(setComma(totalprice));
	$("#totalPrice").val(totalprice);
}
$(function(){
	// 대관 시작
	$("#con3-day-start").datepicker({
		dayNamesMin:['일','월','화','수','목','금','토'], // 요일 변경 구문
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 변경 구문
		// 달력안에 오늘날짜로 돌리는 내용과 닫는 창을 노출시키는 필수 구문
		showButtonPanel: true, // 밑에 내용들 떄문에 써야하는 필수 구문
		currentText: '오늘 날짜', // 오늘 날짜로 돌아오는 구문 
		closeText: '닫기', // 달력창 닫기

		dateFormat: "yy-mm-dd", // 날짜 클릭시 text box에 담겨지는 순서
		yearRange: "2019:2019", // 2019년에서만 선택할 수 있게하는 구문
		minDate: "0D" //오늘 기준에서 이전거는 선택할 수 없게하는 구문
	});
	
	$("#submit-btn2").click(function(event){
		event.preventDefault();
		$(".con3-bg").remove();
	});
})
 
</script>
<!-- con2에서 예매하기 버튼 클릭 시 -->
<div class="con3-bg">
	<div class="con3-gr">
		<div class="con3-header">
			<h3>전시예매</h3>
		</div>
		<div class="con3-center">
			<ul class="con3-top clear">
				<li class="con3-top-img"><img src="/upload/exhibition/<%=ticket.getImagename()%>" /></li>
				<li class="con3-top-text">
					<h4><%=ticket.getTitle() %></h4>
					<h3><%=ticket.getArtist()%></h3>
					<p><%=ticket.getPreview().replace("\n","<br/>")%></p>
				</li>
			</ul>
			<!-- 예매하기 전송 내용 -->
			<div class="con3-bot">
				<form method="POST" action="process" name="frm" id="frm" onsubmit="return goSave();">
					<table class="con3-tb">
						<tr>
							<th>관람일</th>
							<td colspan="4">
								<input type="text" id="con3-day-start" name="displaydate" value="<%=DateUtil.getToday()%>" style="cursor:pointer;"/>
							</td>
						</tr>
						<tr>
							<th>인원</th>
							<td colspan="4">
							<input type="text" id="totnumber" name="number" value="0" readonly>&nbsp;&nbsp;명 
								&nbsp;|&nbsp;(노인: 
								<select id="old_number" name="old_number" onchange="sumPrice()">
									<option value=0>0명</option>
									<option value=1>1명</option>
									<option value=2>2명</option>
									<option value=3>3명</option>
									<option value=4>4명</option>
									<option value=5>5명</option>
								</select>
								&nbsp;성인: 
								<select id="adult_number" name="adult_number" onchange="sumPrice()">
									<option value=0>0명</option>
									<option value=1>1명</option>
									<option value=2>2명</option>
									<option value=3>3명</option>
									<option value=4>4명</option>
									<option value=5>5명</option>
								</select>
								&nbsp;학생: 
								<select id="student_number" name="student_number" onchange="sumPrice()">
									<option value=0>0명</option>
									<option value=1>1명</option>
									<option value=2>2명</option>
									<option value=3>3명</option>
									<option value=4>4명</option>
									<option value=5>5명</option>
								</select>
								)
							</td>
						</tr>
						<tr>
							<th>보유포인트</th>
							<td colspan="2"><input type="text" id="con3-point" value="<%=member.getPoint()%>" readonly></td>
							<td colspan="2">
								<span class="point-span">점</span>
							</td>
						</tr>
						<tr>
							<th>사용포인트</th>
							<td colspan="2"><input type="text" id="con3-usepoint" name="usepoint" value="0" onkeydown="minPrice()"></td>
							<td colspan="2"><span class="point-span">점</span></td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td class="chk-radio"><input type="radio" id="chk01" name="method" value="bank"></td>
							<td class="chk-text"><label for="chk01">무통장입금</label></td>
							<td class="chk-radio"><input type="radio" id="chk02" name="method" value="card"></td>
							<td class="chk-text"><label for="chk02">신용카드</label></td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td colspan="4" id="con3-glod"><span id="totalPrice">0</span></td>
						</tr>
					</table>
					<input type="hidden" name="cmd" value="reserve"/>
					<input type="hidden" name="canceldate" value=""/>
					<input type="hidden" name="reservestate" value="1"/>
					<input type="hidden" name="reservedate" value="<%=DateUtil.getToday()%>"/>
					<input type="hidden" name="paydate" value="<%=DateUtil.getToday()%>"/>
					<input type="hidden" name="paystate" value="1"/>
					<input type="hidden" name="member_pk" value="<%=member.getNo()%>"/>
					<input type="hidden" name="display_pk" value="<%=ticket.getNo()%>" />
					<div class="con3-btn clear">
						<ul class="btn-group">
							<li><button id="submit-btn1">예매하기</button></li>
							<li><button id="submit-btn2">닫기</button></li>
						</ul>
					</div>
				</form>
				<!-- //예매하기  -->
			</div>
			<!-- //예매하기 전송 종료 -->
		</div>
	</div>
</div>
<!-- //con2에서 예매하기 버튼 클릭 시 //con3-bg 종료 -->
