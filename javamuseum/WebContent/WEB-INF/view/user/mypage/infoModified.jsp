<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.member.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");

String email = data.getEmail();
String[] emailArr = email.split("@");

String tel = data.getTel();
String[] telArr = tel.split("-");

String birth = data.getBirthday();
String[] birthArr = birth.split("-");

String gender = Integer.toString(data.getGender());
%>
<input type="hidden" value="<%=data.getGender() %>"/>
<link rel="stylesheet" href="/css/memberInfoModified.css">

<div class="con3 clear">
	<div class="conInfoMod-center clear">
        <!-- 회원가입 기본정보 입력란 -->
       	<div class="con3-text">
		    <h2>회원정보</h2>
		    <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
		</div>
        <div class="conInfoMod-box-top">
        <form name="frm" id="frm" action="/user/member/process.do" method="post">
	        <table class="birth">
	            <tr class="tr-under">
	                <th class="th-bg" id="nameFrame">이름</th>
	                <td class="td-bg" id="nameFrame">
	                    <input type="text" id="name" name="name" value="<%=data.getName()%>">
	                </td>
	            </tr>
	            <tr class="tr-under">
	                <th class="th-bg">생년월일</th>
	                <td class="select td-bg">
	                   <input type="text" id="year" name="year" maxlength="4" placeholder="년(4자리)" value="<%=birthArr[0]%>" onKeyup="onlyNumber(this)"/>
							<select style="width:100px;margin-right:10px" name="month" id="month"> 
								<option value="0">월</option> 
								<option value="01" <%="01".equals(birthArr[1]) ? "selected":""%>>1</option>
								<option value="02" <%="02".equals(birthArr[1]) ? "selected":""%>>2</option>
								<option value="03" <%="03".equals(birthArr[1]) ? "selected":""%>>3</option>
								<option value="04" <%="04".equals(birthArr[1]) ? "selected":""%>>4</option>
								<option value="05" <%="05".equals(birthArr[1]) ? "selected":""%>>5</option>
								<option value="06" <%="06".equals(birthArr[1]) ? "selected":""%>>6</option>
								<option value="07" <%="07".equals(birthArr[1]) ? "selected":""%>>7</option>
								<option value="08" <%="08".equals(birthArr[1]) ? "selected":""%>>8</option>
								<option value="09" <%="09".equals(birthArr[1]) ? "selected":""%>>9</option>
								<option value="10" <%="10".equals(birthArr[1]) ? "selected":""%>>10</option>
								<option value="11" <%="11".equals(birthArr[1]) ? "selected":""%>>11</option>
								<option value="12" <%="12".equals(birthArr[1]) ? "selected":""%>>12</option>
							</select>
                        <input type="text" id="day" name="day" maxlength="2" placeholder="일" value="<%=birthArr[2]%>" onKeyup="onlyNumber(this)"/>
					</td>
				</tr>
                <tr class="tr-under">
                    <th class="th-bg">성별</th>
                    <td class="td-bg">
                        <input type="radio" id="gender" name="gender" value="0" <%="0".equals(gender) ? "checked":""%>>
                        <label for="gender">남성</label>
                        

                        <input type="radio" id="gender2" name="gender" value="1" <%="1".equals(gender) ? "checked":""%>>
                        <label for="gender2">여성</label>
                    </td>
                </tr>
                <tr class="tr-under">
					<th class="th-bg">연락처</th>
					<td class="td-bg">
						<input type="text" id="fTel" name=fTel value="<%=telArr[0]%>" maxlength="4" placeholder="처음(3~4자리)" onKeyup="onlyNumber(this)" />
						<input type="text" id="mTel" name=mTel value="<%=telArr[1]%>" maxlength="4" placeholder="중간(4자리)" onKeyup="onlyNumber(this)"/>
						<input type="text" id="eTel" name=eTel value="<%=telArr[2]%>" maxlength="4" placeholder="끝(4자리)" onKeyup="onlyNumber(this)"/>
					</td>
				</tr>
				<tr class="tr-under">
	                <th class="th-bg">주소</th>
	                <td class="td-bg"><input type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="<%=data.getZipcode()%>">
						<input type="button" id="findZipcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="addr1"  name="addr1" placeholder="주소" style="width: 400px" value="<%=data.getAddr1()%>"><br>
						<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력하세요" style="width: 400px" value="<%=data.getAddr2()%>">
					</td>
				</tr>
				<tr class="tr-under">
				     <th class="th-bg">아이디</th>
				     <td class="td-bg">
				         <input type="text" id="id" name="id" maxlength="20" value="<%=data.getId()%>" disabled="disabled">
				     </td>
				 </tr>
				 <tr class="tr-under">
					<th class="th-bg">이메일</th>
					<td class="td-bg">
					   <input type="text" name="email" id="email" style="width:100px" value="<%=emailArr[0]%>">
						@ 
						<input type="text" name="email2" id="email2" style="width:100px;" value="<%=emailArr[1]%>"> 
							<select name="selectEmail" id="selectEmail" style="width:120px; height:36px"> 
								<option value="1" selected>직접입력</option> 
								<option value="naver.com">naver.com</option> 
								<option value="hanmail.net">hanmail.net</option> 
								<option value="hotmail.com">hotmail.com</option> 
								<option value="nate.com">nate.com</option> 
								<option value="gmail.com">gmail.com</option>
							</select>
				    </td>
				</tr>
                 <tr class="tr-under">
                     <th class="th-bg">비밀번호&nbsp;&nbsp;<input type="button" value="변경" id="modPwBtn" onclick="modPw()"/></th>
                     <td class="td-bg">
                        <input type="password" id="password" name="password" title="회원 비밀번호를 입력해주세요." class="togglePw" style="display:none;" placeholder="비밀번호를 입력해주세요."/>
                     </td>
                 </tr>
				<tr class="tr-under togglePw" style="display:none;">
				    <th class="th-bg">비밀번호 확인</th>
				    <td class="td-bg">
				        <input type="password" id="pwdconfirm" name="pwdconfirm" value="" placeholder="비밀번호를 재입력해주세요."/>
						<span id="pwdconfirmText"></span>
             		</td>
				</tr>
			</table>
			<input type="hidden" name="cmd" id="cmd" value="modMemberInfo"/>
			<input type="hidden" name="no" id="no" value="<%=data.getNo()%>"/>
			</form>
			<!-- 확인 취소 입력란 -->
	            <div class="submit-box">
	                <input type="button" onclick="realSave();" value="확인" style="cursor:pointer">
	                <input type="button" id="cancelBtn" value="취소" onclick="realCancel()" style="cursor:pointer">
	            </div>
            <!-- 확인 취소 입력란 -->
		</div>
	</div>
</div>

