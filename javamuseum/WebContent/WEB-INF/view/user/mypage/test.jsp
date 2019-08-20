<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mypage.css">
<link rel="stylesheet" href="/css/memberInfoModified.css">
<style>
   
</style>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript">
</script>
</head>
<body>

        <div class="members-wrap">
            <!-- 회원정보 -->
            <div class="con3 clear">
                <div class="conInfoMod-center clear">
                        <!-- 회원가입 기본정보 입력란 -->
                         <div class="con3-text">
				            <h2>회원정보</h2>
				            <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
				        </div>
                        <div class="conInfoMod-box-top">
                            <table class="birth">
                                <tr class="tr-under">
                                    <th class="th-bg" id="nameFrame">이름</th>
                                        <td class="td-bg" id="nameFrame">
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
                                        <span>(6자리~12자리 사이의 영문,숫자)</span>
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
                            <form method="GET" action="insert.php">
                                <div class="con4-btnbox">
                                        <div class="con4-pw"><input type="password" id="con4-pw" name="con4-pw" placeholder="비밀번호를 입력해주세요." ></div>
                                        <div class="con4-btn clear">

                                            <div class="con4-okbtn">
                                                <a href="#">확인</a>
                                            </div>
                                            <div class="con4-closebtn">
                                                <a href="#">닫기</a>
                                            </div>
                                        </div>
                                </div>
                            </form>
                        </div>
                </div>
            </div>    
            <!-- 내가 본 작품 -->
            <div class="con5">
                <div class="con5-center">
                    <div class="con5-text">
                        <h2>내가 본 작품</h2>
                        <h4>감상한 작품을 한곳에 모아서 볼 수 있는 나만의 갤러리입니다.</h4>
                    </div>
                    <div class="con5-exhibition">
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-1.jpg">
                            </div>
                            <div class="con5-right">
                                <h3>WEATHER</h3>
                                <h5>WEATHER: 오늘, 당신의 날씨는 어떤가요?</h5>
                                <p>2018.05.03 - 2018.11.25</p>
                            </div>
                        </div>
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-2.png">
                            </div>
                            <div class="con5-right">
                                <h3>WANDERLAND</h3>
                                <h5>WANDERLAND: 파리지앵의 산책</h5>
                                <p>2016.11.19 - 2016.12.11</p>
                            </div>
                        </div>
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-3.jpg">
                            </div>
                            <div class="con5-right">
                                <h3>YOUTH</h3>
                                <h5>YOUTH: 청춘의 열병, 그 못다 한 이야기</h5>
                                <p>2015.02.09 - 2016.05.28</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 예매 내역 -->
            <div class="con6">
        
            </div>
            <!-- 대관내역 -->
            <div class="con7">
				<div class="con7-center">
					<div class="con7-text">
						<h2>대관내역</h2>
						<h4>고객님이 예약하신 대관장소입니다.</h4>
					</div>
					<table class="con7-table">
						<tr>
							<th>대관장소</th>
							<th>대관일시</th>
							<th>대관료</th>
							<th>비고</th>
						</tr>
						<tr>
							<td>제1 전시실</td>
							<td>2019.07.04</td>
							<td>1,010,000원</td>
							<td>대관중</td>
						</tr>
						<tr>
							<td>제2 전시실</td>
							<td>2019.02.01</td>
							<td>680,000원</td>
							<td>대관종료</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                    </table>
            		</div>
				</div>    
			</div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>