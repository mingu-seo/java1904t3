<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관 로그인</title>
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/login.css">
    <style>
    
    </style>
    <script type="text/javascript">
        $(function(){
            
        })
    </script>
    <script>
function loginCheck(){
	if ( $("#id").val() == "" ) {
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	if ( $("#password").val() == "" ) {
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked==true) {
		console.log('1');
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires="+now.getTime();
	}
	return true;
}

function userid_chk() {
	var f=document.board;
	var useridname = CookieVal("cookie_userid");
	console.log(useridname);
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}
</script>
</head>
<body onload="$('#id').focus();userid_chk();">
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div id="container">
        <!-- 메인배너 시작 -->
        <div class="con1">
        </div>
        <!-- 메인배너 끝 -->
        <!-- 로그인 창 시작 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-loginbox">
                    <h2>로그인</h2>
                    <p>대림미술관 홈페이지를 방문해주셔서 감사합니다.<br>로그인하시면 홈페이지를 보다 편리하게 사용하실 수 있습니다.</p>
                    <!-- 로그인 데이터 전송 방식 -->
                   <form name="board" id="board" method="post" action="<%=request.getContextPath()%>/user/login.do" onsubmit="return loginCheck();">
                        <input type="text" id="id" name="id" maxlength="20" placeholder="아이디를 입력하세요.">
                        <input type="password" id="password" name="password" maxlength="20" placeholder="비밀번호를 입력하세요.">
                        <div class="chk-box"> 
                            <input type="checkbox" name="reg" id="reg"/> <label for="reg">아이디 저장</label>
                        </div>
                        <input type="submit" value="로그인" id="submit01">
                        <ul class="login-sc">
                            <li><a href="/user/membership">회원가입</a></li>
                            <li><a href="/user/idfind">아이디 찾기</a></li>
                            <li><a href="/user/pwfind">비밀번호 찾기</a></li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <!-- 로그인 창 끝 -->
    </div>
    <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>