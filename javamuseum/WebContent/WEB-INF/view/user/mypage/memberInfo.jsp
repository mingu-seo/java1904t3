<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="manage.member.*" %>
<%
MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
%>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script>
$(function() {
	$(".con3-gr-btn").click(function(event){
		event.preventDefault();
		$(".con4-center").show();
		$(".con4-delBtn").hide();
		$(".con4-modBtn").show();
	});
	$(".con3-gr-delBtn").click(function(event){
		event.preventDefault();
		$(".con4-center").show();
		$(".con4-modBtn").hide();
		$(".con4-delBtn").show();
	});
	$(".con4-closebtn").click(function(event){
		event.preventDefault();
		$(".con4-center").hide();
	});
});
function identify() {
	if($("#con4-pw").val() == "") {
		alert("비밀번호를 입력해주세요.")
	} else {
		$.ajax({
			type: "GET",
			url: "/user/mypage/confirmPassword",
			data: { "no" : '<%=memberInfo.getNo()%>', "password":$("#con4-pw").val()},
			async: false,
			success: function(data){
				var ret = data.trim();
				if (ret == "false") {
					alert("비밀번호가 올바르지 않습니다.");	
					$("#con4-pw").val("");
					$("#con4-pw").focus();
				} else {
					$.ajax({
						type: "GET",
						url: "/user/mypage/infoModified",
						data: { "no" : '<%=memberInfo.getNo()%>' },
						async: false,
						success: function(data){
							$(".con3").html(data);
							$(".con3-center clear").hide();
							$(".con4-center").hide();
							
							$('#selectEmail').change(function(){ 
								$("#selectEmail option:selected").each(function () { 
									if($(this).val()== '1'){ //직접입력일 경우
										$("#email2").val(''); //값 초기화
										$("#email2").attr("disabled",false); //활성화
									}else{ //직접입력이 아닐경우
										$("#email2").val($(this).text()); //선택값 입력
										$("#email2").attr("disabled",true); //비활성화
									} 
								}); 
							});
							
						}
					});
				}
			}
		});
	}
}
$(".con4-closebtn").click(function() {
	$("#con4-pw").val("");
});
</script>
 <!-- 회원정보 -->
	<div class="con3 clear">
	    <div class="con3-center clear">
	        <div class="con3-text">
	            <h2>회원정보</h2>
	            <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
	        </div>
	        <div class="con3-gr-center">
	            <div class="con3-gr">
	                <h3>회원정보 수정</h3>
	                <p class="con3-gr-fs"><span>연락처 이메일</span>:AB******@na***.com</p>
	                <p><span>본인확인 이메일</span>:AB******@na***.com</p>
	                <p><span>휴대전화</span>:-82 10-68**-****</p>
	                <div class="con3-gr-btn">정보 변경</a></div>
	            </div>
	            <div class="con3-gr">
	                <h3>회원탈퇴</h3>
	                <h5>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h5>
	                <p>사용하고 계신 아이디(AB*****)는 탈퇴할 경우 재사용 및 복구가</p>
	                <p>불가능합니다. 탈퇴한 아이디는 본인과 타인 모두 재사용</p>
	                <p>및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
	                <div class="con3-gr-delBtn">회원탈퇴</a></div>
	            </div>
	        </div>
	    </div>
	    <div class="con4-center clear">
	            <div class="con4-text">
	                <h2>회원정보</h2>
	                <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
	            </div>
	            <div class="con4-pwbox">
	                <div class="con4-pwbox-text">
	                    <h3>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h3>
	                    <p>회원님의 개인정보 보호를 위한 본인 확인 절차이오니,</p>
	                    <p>자바미술관 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
	                </div>
	                    <div class="con4-btnbox">
	                            <div class="con4-pw"><input type="password" id="con4-pw" name="con4-pw" placeholder="비밀번호를 입력해주세요." ></div>
	                            <div class="con4-btn clear">
	
	                                <div class="con4-modBtn" onclick="identify()" style="cursor:pointer">
	                                    	<p>확인</p>
	                                </div>
	                                <div class="con4-delBtn" onclick="realDel(<%=memberInfo.getNo()%>)" style="cursor:pointer">
	                                    	<p>확인</p>
	                                </div>
	                                <div class="con4-closebtn">
	                                    <a href="#">닫기</a>
	                                </div>
	                            </div>
	                    </div>
	            </div>
	    </div>
	</div> 
