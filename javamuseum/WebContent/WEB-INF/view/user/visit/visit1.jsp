<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<title>미술관소개</title>
<link rel="stylesheet" href="/css/sub-visit1.css">
<style>
      
</style>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
	$(function(){
		//con6 스텝4 구역 선 등장 구문
		//스크롤 했을때
		$(window).scroll(function(){
			//스크롤바 위치값을 알아내는 구문
			var scTop = $(this).scrollTop();

			//박스 시작하는 위치값 알아내는 구문
			var conBox1 = $(".con6-box1").offset().top-800; 
			var conBox2 = $(".con6-box2").offset().top-700;
			var conBox3 = $(".con6-box3").offset().top-600;
			var conBox4 = $(".con6-box4").offset().top-650;

			if(scTop >= conBox1 && scTop < conBox2) {
				$(".con6-box1-left").animate({"height":"100%"},300,function(){
					$(".con6-box1-top").animate({"width":"100%"},300,function(){
						$(".con6-box1-right").animate({"height":"100%"},300,function(){
							$(".con6-box1-bottom").animate({"width":"100%"},300,function(){
								$(".con6-box1-text").fadeIn();
							});
						});
					});
				});
			}
			else if(scTop >= conBox2 && scTop < conBox3) {
				$(".con6-box2-right").animate({"height":"100%"},300,function(){
					$(".con6-box2-bottom").animate({"width":"100%"},300,function(){
						$(".con6-box2-left").animate({"height":"100%"},300,function(){
							$(".con6-box2-top").animate({"width":"100%"},300,function(){
								$(".con6-box2-text").fadeIn();
							});
						});
					});
				});
			}
			else if(scTop >= conBox3 && scTop < conBox4) {
				$(".con6-box3-left").animate({"height":"100%"},300,function(){
					$(".con6-box3-top").animate({"width":"100%"},300,function(){
						$(".con6-box3-right").animate({"height":"100%"},300,function(){
							$(".con6-box3-bottom").animate({"width":"100%"},300,function(){
								$(".con6-box3-text").fadeIn()
							});
						});
					});
				});
			} else if (scTop >= conBox4) {
				$(".con6-box4-right").animate({"height" : "100%"}, 300, function() {
					$(".con6-box4-bottom").animate({"width" : "100%"}, 300, function() {
						$(".con6-box4-left").animate({"height" : "100%"}, 300, function() {
							$(".con6-box4-top").animate({"width" : "100%"}, 300, function() {
								$(".con6-box4-text").fadeIn();
							});
						});
					});
				});
			}
		});

	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div id="container">
        <!-- 상단 배너구역 -->
        <div class="con1">
            <h1>VISIT</h1>
            <p>관람안내</p>
        </div>
        <!-- 스텝1 구역 -->
        <div class="con2 clear">
            <div class="con2-left">
                <h2>STEP</h2>
                <p>관람 시간 및 요금 확인하고,<br/>
                    온라인 회원 가입하자!</p>
            </div>
            <div class="con2-right">
                <h3>관람 시간</h3>
                <p>화-일요일   10:00AM – 7:00PM  </p>
                <p>목, 토요일 (야간 개관)   10:00AM – 8:00PM</p>
                <table>
                    <tr>
                        <th>관람연령</th>
                        <td class="usual">일반</td>
                        <td colspan="3" class="dis">할인</td>
                    </tr>
                    <tr>
                        <th>성인</th>
                        <td>\10,000</td>
                        <td class="price">\8,000</td>
                        <td rowspan="3" class="text"><span>할인적용</span><br/>
                            자바 미술관 온라인 회원<br/>
                            10인 이상 단체관람<br/>
                            65세 이상 경로우대<br/>
                            장애인(복지카드 소지자 한해서 적용)</td>
                    </tr>
                    <tr>
                        <th>학생(초/중/고)</th>
                        <td>\3,000</td>
                        <td>\2,000</td>
                    </tr>
                    <tr class="table-under">
                        <th>미취학아동</th>
                        <td>&#92;2,000</td>
                        <td>\1,000</td>
                    </tr>
                </table>
            </div>
            <!-- 스텝1 구역 -->
        </div>
        <!-- 할인 팁 구역 -->
        <div class="con3">
            <div class="con3-in clear">
                <div class="con3-left">
                    <h4>온라인 회원이 되면,<br/>
                        전시 입장료 20% 이상 할인!</h4>
                    <span>미술관 이벤트 초대 + 미술관 정보 관련 e-뉴스레터 발송</span>
                    <p>전시 관람료 할인은 온라인 회원 본인만 적용<br/>
                        미술관 방문 시 자바뮤지엄 모바일 앱에서<br/>
                         온라인 회원 로그인 인증 후 할인 적용</p>
                    <a href="#">온라인 회원 가입하기</a>
                </div>
                <div class="con3-right">
                    <h4>인터파크에서 전시 입장권<br/>
                        예매하면 대기시간 없이<br/> 
                        바로 입장!</h4>
                    <p>전시 관람 시 작품, 작가에 대한 설명은 미술관 모바일 앱<br/>
                         모바일 투어를 통해서 확인 가능하며,<br/>
                        모바일 앱은 무료로 다운로드 받을 수 있습니다.
                    </p>
                    <a href="#">전시 예매하기</a>
                </div>
            </div>
        </div>
        <div class="con-back">
            <!-- 스텝2 구역 -->
            <div class="con4">
                <div class="con4-top clear">
                    <div class="con4-left">
                        <h2>STEP</h2>
                            <p>더욱 특별해진 J MEMBERS<br/>
                                    가입하고 풍성한 혜택 받자!</p>
                    </div>
                    <div class="con4-right">
                        <div class="con4-right-box">
                            <div class="con4-right-imgbox"><img src="/img/sub01_1-1.png"></div>
                            <p>3 EXHIBITION</p>
                            <span>전시관람 3회</span>
                        </div>
                        <div class="con4-right-box">
                            <div class="con4-right-imgbox"><img src="/img/sub01_1-2.png"></div>
                            <p>FAST PASS</p>
                            <span>대기시간 없는 빠른 입장</span>
                        </div>
                        <div class="con4-right-box">
                            <div class="con4-right-imgbox"><img src="/img/sub01_1-3.png"></div>
                            <p>MUSEUM SHOP</p>
                            <span>전아트 상품 10% 할인 2회</span>
                        </div>
                    </div>
                </div>
                <!-- 멤버스 가입방법     -->
                <h6>J MEMBERS 가입 방법</h6>
                <div class="con4-circle-box clear">
                    <div class="con4-circle">
                        <div class="arrow"><img src="/img/sub01_2-1.png"></div>
                        <div class="con4-innercircle">
                            <p>온라인 회원가입</p>
                            <span>대림미술관 모바일 앱을 다운 받아<br/>
                                온라인 회원 가입합니다.</span>
                        </div>
                    </div>
                    <div class="con4-circle">
                        <div class="arrow"><img src="/img/sub01_2-1.png"></div>
                        <div class="con4-innercircle">
                            <p>카드 등록하기</p>
                            <span>온라인 예매처 혹은 현장에서<br/>
                                J멤버스 카드를 구입하시면,<br/> 
                            등록과 함께 직접 드립니다.</span>
                        </div>
                    </div>
                    <div class="con4-circle">
                        <div class="con4-innercircle">
                            <p>J멤버스 가입완료</p>
                            <span>특별하고 다양한 J멤버스 서비스를<br/>
                                이용하실 수 있습니다.</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 스텝3 구역 -->
            <div class="con5">
                <h2>STEP<span class="con5-span">손 안의 미술관 모바일 APP으로 즐거움을 나누자!</span></h2>
                <div class="con5-box clear">
                    <div class="con5-list list1">
                        <p>APP 다운로드 &  D멤버스 간편 이용</p>
                        <span>무료로 다운로드하고, 미술관의 다양한 정보를<br/>
                                쉽고 편리하게 즐기기 </span>
                    </div>
                    <div class="con5-list list2">
                        <p>모바일 APP 쿠폰</p>
                        <span>온라인 회원을 위한 Special Gift.<br/>
                                이제 APP에서 쿠폰 선물 다운로드하기 </span>
                    </div>
                    <div class="con5-list list3">
                        <p>모바일 투어</p>
                        <span>그린 치킨의 전시 해설부터,작품들이 직접 전하는<br/>
                                비하인드 스토리까지 전시에 관한<br/>
                                모든 것이 담겨있는 전시 관람의 필수품 </span>
                    </div>
                    <div class="con5-list list4">
                        <p>D 스토리</p>
                        <span>전시 준비 에피소드, 작가 인터뷰, 칼럼 등<br/>
                                전시 관련 다양한 비하인드스토리 만나기 </span>
                    </div>
                </div>
            </div>
            <!-- 스텝4 구역 -->
            <div class="con6">
                <div class="con6-in">
                    <h2>STEP<span class="con6-span">네 가지의 투어로 전시를 재미있게 즐기자!</span></h2>
                    <div class="con6-list">
                        <div class="con6-box1">
                            <div class="con6-box1-img"><img src="/img/sub01_4-1.png"></div>
                            <div class="con6-box1-in">
                                <div class="con6-box1-top"></div>
                                <div class="con6-box1-right"></div>
                                <div class="con6-box1-bottom"></div>
                                <div class="con6-box1-left"></div>
                                <div class="con6-box1-text con6-box-text">
                                    <h5>모바일 투어</h5>
                                    <p>그린 치킨의 전시 해설부터, 작품 들이 직접 전하는 비하인드 스토리까지.<br/>
                                            하이메 아욘의 작품 속에 숨겨진 사연들이 궁금하다면,<br/>
                                            지금 대림미술관&디뮤지엄 앱을 통해 무료로 만나보세요. </p>
                                </div>
                            </div>
                        </div>
                        <div class="con6-box2">
                            <div class="con6-box2-img"><img src="/img/sub01_4-2.png"></div>
                            <div class="con6-box2-in">
                                <div class="con6-box2-top"></div>
                                <div class="con6-box2-right"></div>
                                <div class="con6-box2-bottom"></div>
                                <div class="con6-box2-left"></div>
                                <div class="con6-box2-text con6-box-text">
                                    <h5>정규 투어</h5>
                                    <p>에듀케이터의 전시 해설을 통해 하이메 아욘 작품들에<br/>
                                            숨겨진 사연들을 만나 보세요.<br/>
                                    </p>
                                    <span>      
                                            • 평일: 11시, 14시, 15시, 16시, 17시(총 5회)<br/>
                                            
                                            • 주말&공휴일: 12시, 13시(총 2회)<br/>
                                            
                                            • 야간 투어: 목요일 19시
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="con6-box3">
                            <div class="con6-box3-img"><img src="/img/sub01_4-3.png"></div>
                            <div class="con6-box3-in">
                                <div class="con6-box3-top"></div>
                                <div class="con6-box3-right"></div>
                                <div class="con6-box3-bottom"></div>
                                <div class="con6-box3-left"></div>
                                <div class="con6-box3-text con6-box-text">
                                    <h5>단체 투어 (한국어/ 영어)</h5>
                                    <p>소중한 사람들과 전시를 즐기고 싶다면,<br/>
                                            예약 단체만을 위한 투어에 참가해 보세요 </p>
                                    <span>
                                            • 대상: 10인 이상 단체<br/>
                                            (어린이, 청소년, 대학생, 성인)<br/>
                                        • 투어 참가비: 무료 (전시 관람비 별도)<br/>
                                        • 참여 방법: 하단 [단체 투어 예약하기]를<br/>
                                            통해 신청 후 담당자의 확인 전화로 예약 확정
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="con6-box4">
                            <div class="con6-box4-img"><img src="/img/sub01_4-4.png"></div>
                            <div class="con6-box4-in">
                                <div class="con6-box4-top"></div>
                                <div class="con6-box4-right"></div>
                                <div class="con6-box4-bottom"></div>
                                <div class="con6-box4-left"></div>
                                <div class="con6-box4-text con6-box-text">
                                <h5>스페셜 나이트 투어</h5>
                                    <p>미술관이 닫힌 후, 아무도 없는 미술관에서<br/>
                                            특별한 전시 해설과 함께 워라벨을 지켜보세요.<br/>
                                    </p>
                                    <span>      
                                            • 대상: 10인 이상 직장인 단체<br/>
                                            • 진행: 화, 수, 금 19시 이후 (최소 일주일 전 예약 필수)<br/>

                                            • 투어 참가비: 12,000원 (전시 관람료 포함)<br/>
                                            • 참여 방법: 하단 [스페셜 나이트 투어예약하기]를 통해 신청 후 담당자의 전화로 예약 확정
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>