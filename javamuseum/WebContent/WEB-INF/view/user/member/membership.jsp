<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="manage.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title> 
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/membership.css">
    <style>
        
    </style>
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/function_jquery.js"></script>
    <script type="text/javascript" src="/js/function.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
    var cerNum="";
    var certify = false;
    $(function() {
    	
    	$("#sendCerNum").click(function(){
    		$("#email2").attr("disabled",false);
        	if($("#email").val() == "" || $("#email2").val() == "") {
        		alert("이메일을 입력해주세요.");
    		} else if (certify == true) {
    			alert("이미 인증이 완료되었습니다.")
    		} else {
    			var email = $("#email").val()+"@"+$("#email2").val();
    			$.ajax ({
    			type:'POST',
    			url:"/user/member/sendcernum",
    			data:{
    				"email": email
    			},
    			async:false,
    			success:function(data) {
    				cerNum = data.trim();
    					alert("인증번호가 발송되었습니다.");
    			}
    			});
    			if($("#selectEmail").val() != 1) {
    				$("#email2").attr("disabled",true);
    			}
    		}
    	});
    	
    	$("#idCheckBtn").click(function(){
    		if($("#id").val() == "") {
    			alert("아이디를 입력하세요.");
    		} else if(!validId($("#id"))) {
    		} else {
    		$.ajax ({
    			type:'POST',
    			url:"/manage/member/idcheck",
    			data:{
    				"id":$("#id").val()
    			},
    			async:false,
    			success:function(data) {
    				var val = data.trim();
    				if (val == "0") {
    					alert("사용가능한 아이디입니다.");
    					$("#idcheck").val("1");
    					$("#id").attr("readonly", "readonly");
    				} else {
    					alert("존재하는 아이디입니다.");
    					$("#id").val("");
    					$("#idcheck").val("0");
    					$("#id").focus();
    					return false;
    				}
    			}
    		});
    		}
    	});
    	
    	$("input").keyup(function(){
                var pwd1=$("#password").val();
                var pwd2=$("#pwdconfirm").val();
                if(pwd1 != "" || pwd2 != ""){
                    if(pwd1 == pwd2){
                    	$("#pwdconfirmText").text("비밀번호가 일치합니다");
    					$("#pwdconfirmText").css("color", "#0000FF");
    				} else {
    					$("#pwdconfirmText").text("비밀번호가 일치하지 않습니다");
    					$("#pwdconfirmText").css("color", "red");
                    }    
                }
        });
        
    	$("#password").keyup(function(){
    		var jQuerypass = $("#password").val();
    		var jQuerystr = /^[a-zA-Z0-9@]{6,12}$/;
    		var jQuerystr2 = /(\w)\1\1\1/;
    		var jQuerychk_num = jQuerypass.search(/[0-9]/g);
    		var jQuerychk_eng = jQuerypass.search(/[a-z]/ig);
    		var check = false;
    		if (jQuerypass == "") {
    			$("#pwdText").css("color", "red");
    		}else if(!jQuerystr.test(jQuerypass) || jQuerypass.indexOf(' ') > -1){
    			$("#pwdText").css("color", "red");
    		}else if(jQuerystr2.test(jQuerypass)){
    			$("#pwdText").css("color", "red");
    		}else if(jQuerychk_num < 0 || jQuerychk_eng < 0) {
    			$("#pwdText").css("color", "red");
    		} else {
    			$("#pwdText").css("color", "#0000FF");
    		}
    	});



    });
    function compareCerNum() {
    	if(cerNum == "") {
    		alert("먼저 인증번호를 발송해주세요.")
    	} else if (certify == true) {
    		alert("이미 인증이 완료되었습니다.")
    	} else if (cerNum == $("#cerNum").val()) {
    		alert("인증이 성공하였습니다.");
    		$("#cerNum").attr("readonly", "readonly");
    		$("#email").attr("readonly", "readonly");
    		$("#email2").attr("readonly", "readonly");
    		$('#selectEmail option').each(function() {
    		    $(this).prop('disabled', true);
    		});
    		certify = true;
    	} else if (cerNum != $("#cerNum").val()) {
    		alert("인증번호가 틀렸습니다.");
    		$("#cerNum").val("");
    	}
    	
    }
    
    function goSave() {
    	if ($("#name").val() == "") {
    		alert("이름을 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
    	if ($("#id").val() == "") {
    		alert("아이디를 입력해주세요.");
    		$("#id").focus();
    		return false;
    	}
    	if ($("#email").val() == "" || $("#email2").val() == "") {
    		alert("이메일을 입력해주세요.");
    		$("#email").focus();
    		return false;
    	}
    	if ($("#year").val() == "" || $("#month").val() == 0 || $("#day").val() == "") {
    		alert("생년월일을 입력해주세요.");
    		$("#year").focus();
    		return false;
    	}
    	if ($("#fTel").val() == "" || $("#mTel").val() == "" || $("#eTel").val() == "") {
    		alert("연락처를 입력해주세요.");
    		$("#fTel").focus();
    		return false;
    	}
    	
    	$.ajax ({
    		type:'POST',
    		url:"/manage/member/idcheck",
    		data:{
				"id":$("#id").val()
			},
    		async:false,
    		success:function(data) {
    			var val = data.trim();
    			if (val == "0") {
    				$("#idcheck").val("1");
    			} else {
    				alert("존재하는 아이디입니다.");
    				$("#idcheck").val("0");
    				return false;
    			}
    		}
    	});
    	if ($("#idcheck").val() == "0") {
    		return false;
    	}
    	
    	if ($("#day").val() < 10 && $("#day").val().length == 1) {
    		$("#day").val("0" + $("#day").val());
    	}
    	
    	// 비밀번호 유효성체크
    	if(!validPassword($("#password"))) return false;
    	// 생년월일 유효성체크
    	if(!isValidBirth($("#year").val(), $("#day").val())) return false;
    	
    	if(certify == false) {
    		alert("이메일 인증을 해주세요.");
    		return false;
    	}
    	
    	$("#email2").attr("disabled",false);
    	$("#frm").submit();
    }
    
    </script>
</head>
<body>
  <%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div id="container">
        <!-- 배경 구역 -->
        <div class="con1-join">
        </div>
        <!-- 배경 구역 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-loginbox">
                    <h2>회원가입</h2>
                    <p>안전한 개인정보 보호를 위해 회원님의 동의 없이 제3자에게 정보를 제공하지 않습니다.</p>
                    <h3>기본 정보 입력</h3>
                    <!-- 회원가입 데이터 전송 방식 -->
                    <form name="frm" id="frm" action="/user/member/process.do" method="post">
                        <!-- 회원가입 기본정보 입력란 -->
                        <div class="con2-box-top">
                            <table class="birth">
                                <tr class="tr-under">
                                    <th class="th-bg">이름</th>
                                        <td class="td-bg">
                                            <input type="text" id="name" name="name">
                                        </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">생년월일</th>
                                    <td class="select td-bg">
                                       <input type="text" id="year" name="year" maxlength="4" placeholder="년(4자리)" value="" onKeyup="onlyNumber(this)"/>
                                        <select style="width:100px;margin-right:10px" name="month" id="month"> 
											<option value="0">월</option> 
											<option value="01" id="1">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
                                        <input type="text" id="day" name="day" maxlength="2" placeholder="일" value="" onKeyup="onlyNumber(this)"/>
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">성별</th>
                                    <td class="td-bg">
                                        <input type="radio" id="gender" name="gender" value="0">
                                        <label for="gender">남성</label>

                                        <input type="radio" id="gender2" name="gender" value="1">
                                        <label for="gender2">여성</label>
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">연락처</th>
                                    <td class="td-bg">
										<input type="text" id="fTel" name=fTel value="" maxlength="4" placeholder="처음(3~4자리)" onKeyup="onlyNumber(this)"/>
										<input type="text" id="mTel" name=mTel value="" maxlength="4" placeholder="중간(4자리)" onKeyup="onlyNumber(this)"/>
										<input type="text" id="eTel" name=eTel value="" maxlength="4" placeholder="끝(4자리)" onKeyup="onlyNumber(this)"/>
									</td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">주소</th>
                                    <td class="td-bg"><input type="text" id="zipcode" name="zipcode" placeholder="우편번호">
										<input type="button" id="findZipcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="addr1"  name="addr1" placeholder="주소" style="width: 400px"><br>
										<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력하세요" style="width: 400px">
									</td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">아이디</th>
                                    <td class="td-bg">
                                        <input type="text" id="id" name="id" maxlength="20">
                                        <input type="button" value="중복확인" id="idCheckBtn">
                                        <span>(6자리~10자리 사이의 영문,숫자)</span>
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">비밀번호</th>
                                    <td class="td-bg">
                                        <input type="password" id="password" name="password" title="회원 비밀번호를 입력해주세요." />
											<span id="pwdText">(영문, 숫자가 포함된 6~12자리)</span>
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">비밀번호 확인</th>
                                    <td class="td-bg">
                                       <input type="password" id="pwdconfirm" name="pwdconfirm" value=""/>
											<span id="pwdconfirmText"></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- 회원가입 기본정보 입력란 -->
                        <!-- 본인 인증 입력란 -->
                        <h3>이메일 인증</h3>
                        <div class="con2-box-bot">
                            <table class="acception">
                                <tr class="tr-under">
                                    <th class="th-bg">이메일</th>
                                    <td class="td-bg">
                                       <input type="text" name="email" id="email" style="width:100px" value="">
											 @ 
											 <input type="text" name="email2" id="email2" style="width:100px;" disabled value="naver.com"> 
											 <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
												 <option value="1">직접입력</option> 
												 <option value="naver.com" selected>naver.com</option> 
												 <option value="hanmail.net">hanmail.net</option> 
												 <option value="hotmail.com">hotmail.com</option> 
												 <option value="nate.com">nate.com</option> 
												 <option value="gmail.com">gmail.com</option>
											 </select>
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <th class="th-bg">이메일 인증</th>
                                    <td class="td-bg">
                                        <input type="button" value="인증번호 발송" id="sendCerNum">
                                    </td>
                                </tr>
                                <tr class="tr-under">
                                    <td class="th-bg">인증번호 입력</td>
                                    <td class="td-bg">
                                        <input type="text" id="cerNum">
                                        <input type="button" value="인증번호 확인" onclick="compareCerNum()">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" name="idcheck" id="idcheck" value="0"/>
                            <input type="hidden" name="cmd" id="cmd" value="write"/>
                        </div>
                        </form>
                        <!-- 본인 인증 입력란 -->
                        <!-- 확인 취소 입력란 -->
                        <div class="submit-box">
                            <input type="button" onclick="goSave();" href="#" value="확인">
                            <input type="reset" value="취소">
                        </div>
                        <!-- 확인 취소 입력란 -->
                    
                </div>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>

<script> 
//이메일 입력방식 선택
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
</script>
</html>

