<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="manage.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관 ID/PW 찾기</title>
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/pwfind.css">
    <script type="text/javascript">
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
    	$("#email2").attr("disabled",false);
    	$("#frm").submit();
    }
    </script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div id="container">
        <div class="con1">
        </div>
        <div class="con2">
            <div class="con2-center">
                <div class="con2-loginbox">
                    <h2>아이디/비밀번호 찾기</h2>
                    <p>개인정보는 확인용으로만 처리되며 본인확인 외 다른 용도로 사용되지 않습니다.</p>
                    <!-- 로그인 데이터 전송 방식 -->
                    <div class="con2-loginbtn clear">
                        <div class="con2-id"><a href="/user/idfind">아이디 찾기</a></div>
                        <div class="con2-pw"><a href="/user/pwfind">비밀번호 찾기</a></div>
                    </div>
					<form name="frm" id="frm" action="/user/member/process.do" method="post">
                    	<table class="con2-date">
                                <tr class="con2-tb1">
                                    <td class="con2-tb-id">이름</td>
                                    <td colspan="4"><input type="text" id="name" name="name"></td>
                                </tr>
                                <tr class="con2-tb1">
                                    <td class="con2-tb-id">아이디</td>
                                    <td colspan="4"><input type="text" id="id" name="id"></td>
                                </tr>

                                <tr class="con2-tb2">
                                    <td class="con2-tb-pw">이메일</td>
                                    <td><input type="text" id="email" name="email"></td>
                                    <td><span>@</span></td>
                                    <td><input type="text" id="email2" name="email2"></td>
                                    <td>
                                    	<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
											 <option value="1" selected>직접입력</option> 
											 <option value="naver.com">naver.com</option> 
											 <option value="hanmail.net">hanmail.net</option> 
											 <option value="hotmail.com">hotmail.com</option> 
											 <option value="nate.com">nate.com</option> 
											 <option value="gmail.com">gmail.com</option>
										 </select>
                                    </td>
                                </tr>
                                <tr class="con2-tb3">
                                    <td colspan="5"><input type="button" value="비밀번호 찾기" onclick="goSave();"></td>
                                </tr>
                            <!-- 아이디찾기 버튼 -->
                    	</table>
                    	<input type="hidden" id="cmd" name="cmd" value="pwfind">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
    
</body>
</html>