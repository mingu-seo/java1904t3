<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>자바미술관 ID/PW 찾기</title>
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/idfind.css">
    <style>
        
    </style>
    <script type="text/javascript">
        $(function(){
        	    
        })
        
        function findId() {
        	$("#email2").attr("disabled",false);
        	var name = $("#name").val();
        	var email = $("#email").val() + "@" + $("#email2").val();
        	var popUrl = "http://localhost:8080/user/searchId?name=" + name + "&email=" + email;	//팝업창에 출력될 페이지 URL
       		var popOption = "width=400px, height=220px, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
       		
        	if($("#name").val() == "") {
        		alert("이름을 입력해주세요.");
        		$("#name").focus();
        		$("#email2").attr("disabled",true);
        	} else if ($("#email").val() == "" || $("#email2").val() == "") {
        		alert("이메일을 입력해주세요.");
        		$("#email").focus();
        		$("#email2").attr("disabled",true);
        	}
        	

   			window.open(popUrl,"",popOption);
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
                        <div class="con2-pw"><a href="pwfind.html">비밀번호 찾기</a></div>
                    </div>
					<form name="frm" id="frm" action="/user/member/process.do" method="post">
                    	<table class="con2-date">
                        
                                <tr class="con2-tb1">
                                    <td class="con2-tb-id">이름</td>
                                    <td colspan="4"><input type="text" id="name" name="name"></td>
                                </tr>
                                <tr class="con2-tb2">
                                    <td class="con2-tb-pw">이메일</td>
                                    <td><input type="text" id="email" name="email"></td>
                                    <td><span>@</span></td>
                                    <td><input type="text" id="email2" name="email2" disabled value="naver.com"></td>
                                    <td>
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
                                <tr class="con2-tb3">
                                    <td colspan="5"><input type="button" value="아이디 찾기" id="findBtn" onclick="findId()"></td>
                                </tr>
                            <!-- 아이디찾기 버튼 -->
                   
                    	</table>
                    </form>
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