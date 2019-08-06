<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>대관안내</title>
    <%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
    <link rel="stylesheet" href="/css/hall.css">
    <style>
    </style>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/jquery.mousewheel.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(document).ready(function(){
                var list=0;
                $(window).scroll(function(){
                    var scTop=$(this).scrollTop();

                    var box1=$(".con2-1").offset().top;
                    var box2=$(".con2-2").offset().top;
                    var box3=$(".con2-3").offset().top;

                    $(".con2-button li").removeClass("on");

                    if(scTop >= box1 && scTop < box2) {
                        $(".con2-button li").eq(0).addclass("on")
                    }
                    else if(scTop >= box2 && scTop < box3) {
                        $(".con2-button li").eq(1).addClass("on")
                    }
                    else if(scTop >= box3) {
                        $(".con2-button li").eq(2).addClass("on")
                    }
                });

                $(".con2-button li").click(function(event){
                    event.preventDefault();
                    list=$(this).index();
                    
                    var distance = $(".con2-div").eq(list).offset().top;
                    $("html,body").stop().animate({"scrollTop":distance});
                });
            });
        });
    </script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div class="con">
        <!-- 상단 배너 구역 -->
        <div class="con1">
            <div class="con1-box">
                <h3>RENTAL</h3>
                <p>대관안내</p>
            </div>
        </div>
        <!-- 상단 배너 구역 -->
         <!-- 중간 대관안내,대관료,대관규약 부분 -->
        <div class="con2">
            <ul class="con2-button ">
                <li><a href="#">대관안내</a></li>
                <li><a href="#">대관료</a></li>
                <li><a href="#">대관규약</a></li>
            </ul>
             <!-- 대관안내 구역 -->
            <div class="con2-1 con2-div">
                <h2>대관안내</h2>
                <div class="con2-box clear">
                    <div class="con2-list list1">
                        <img src="/img/hall-01.png">
                        <p>대관공고</p>
                        <div class="arrow"><img src="/img/hall-02.png"></div>
                    </div>
                    <div class="con2-list list2">
                        <img src="/img/hall-01.png">
                        <p>대관신청</p>
                        <div class="arrow"><img src="/img/hall-02.png"></div>
                    </div>
                    <div class="con2-list list3">
                        <img src="/img/hall-01.png">
                        <p>대관승인</p>
                        <div class="arrow"><img src="/img/hall-02.png"></div>
                    </div>
                    <div class="con2-list list4">
                        <img src="/img/hall-01.png">
                        <p>승인통보</p>
                        <div class="arrow"><img src="/img/hall-02.png"></div>
                    </div>
                    <div class="con2-list list5">
                        <img src="/img/hall-01.png">
                        <p>계약</p>
                    </div>
                </div>
                <h4>대관공고</h4>
                <p>-정기 신청 : 그 전해 9월 접수완료.<br/>
                    -수시 신청 : 잔여기간이 발생하거나 또는 대관취소의 경우에 홈페이지에 공고</p>

                <h4>대관신청</h4>
                <p>-대관서비스에 회원가입 후 신청서 작성 및 접수</p>

                <h4>대관승인</h4>
                <p>-대관 심의 시에는 아래와 같은 내용을 기준으로 함.<br/>
                    -순수무대예술로서 민족문화 창달과 국제문화예술교류에 이바지 할 수 있는 공연.<br/>
                    -국제적 수준의 공연단체 및 공연자, 정기공연, 실적이 많은 성실한 공연단체 및 기획사.<br/>
                    -출연자 및 스탭이 대외적으로 인정 받는 전문성을 갖춘 경우.</p>

                <h4>승인통보</h4>
                <p>-대관 심의 후 대관 신청자에게 ‘대관승인서' 또는 ‘대관불가통지서'가 서면으로 통보되며, 유선으로 안내할 수도 있음.<br/>
                    (단, 공연대관 이외의 대관인 경우는 이 절차를 생략할 수 있음.)</p>

                <h4>계약</h4>
                <p>-대관자는 대관승인통보서에 명기된 일자까지 계약을 체결하셔야 하며, 계약 체결 시 계약금으로 총 대관료의 일부<br/>
                    (정기대관은 30%, 수시대관은 50%)를 입금 함으로써 대관자로서의 자격을 갖게 된다.</p>
            </div>
             <!-- 대관안내 구역 -->
             <!-- 대관료 구역 -->
            <div class="con2-2 con2-div">
                <h2>대관료</h2>
                <span>1.전시실 기본시설 사용료</span>
                <div class="con2-tbl">
                    <table>
                        <tr>
                            <th class="tbl1-1">구분</th>
                            <th class="tbl1-2">전시실</th>
                            <th class="tbl1-3">면적</th>
                            <th class="tbl1-4">대관료/일</th>
                            <th class="tbl1-5">비고</th>
                        </tr>
                        <tr>
                            <td rowspan="8">자바미술관</td>
                            <td>제1 전시실</td>
                            <td>721㎡</td>
                            <td>1,010,000</td>
                            <td></td>
                        </tr>
                        <tr>
                
                            <td>제2 전시실</td>
                            <td>486㎡</td>
                            <td>680,000</td>
                            <td></td>
                        </tr>
                        <tr>
                            
                            <td>제3 전시실</td>
                            <td>499㎡</td>
                            <td>710,000</td>
                            <td></td>
                        </tr>
                        <tr>
                            
                            <td>제4 전시실</td>
                            <td>513㎡</td>
                            <td>850,000</td>
                            <td></td>
                        </tr>
                        <tr>
                        
                            <td>제5 전시실</td>
                            <td>865㎡</td>
                            <td>1,850,000</td>
                            <td></td>
                        </tr>
                        <tr>
                        
                            <td>제6 전시실</td>
                            <td>412㎡</td>
                            <td>650,000</td>
                            <td></td>
                        </tr>
                        <tr>
                        
                            <td>제7 전시실</td>
                            <td>515㎡</td>
                            <td>910,000</td>
                            <td></td>
                        </tr>
                        <tr>
                        
                            <td>제8 전시실</td>
                            <td>721㎡</td>
                            <td>1,360,000</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>비타민스테이션</td>
                            <td>제9 전시실</td>
                            <td>351㎡</td>
                            <td>530,000</td>
                            <td></td>
                        </tr>
                    </table>
                    <p>-위 대관료는 전시장 운영시간 오전 11시부터 오후 7시까지 8시간(하절기는 8시까지 9시간) 기준입니다.</p>
                    <p>-전시준비 또는 작품철수 등을 위해 기준시간(09:00~18:00)외 추가로 작업이 필요한 경우, 전당의 승인을 얻은 후 다음과 같이 시행하여야 합니다.<br/>
                        이 경우 추가 대관료는 1시간을 기본 단위로 하여 일일 기본시설 사용료의 시간 당 단가를 적용하며, 작업시간은 전시장의 시설안전 및 보안유지 관계로<br/> 
                    오후 10시까지로 제한합니다. 추가대관은 해당일보다 최소 2일 전까지 신청해야 하며, 당일 추가대관 신청은 불가합니다</p>
                    <p>-전시준비 또는 작품철수 등을 위해 불가피하게 오후 10시 이후 심야작업(자정 24:00까지)이 필요한 경우 작업 사유서를 해당일보다 최소 2일 전까지<br/>
                        제출하여 전당의 승인을 받아야 하며 당일 추가대관 신청은 불가합니다.<br/> 
                    이 경우 해당 시간에 대한 추가 대관료는 1시간을 기본단위로 사용시간에 따라 일일 기본시설 사용료의 시간당 단가를 적용한 후 150%로 할증됩니다.</p>
                    <p>-전시와 관련하여 작품 특성상 항온항습설비 가동이 필요한 경우 ‘나’항의 항온항습설비 사용료를 추가로 부담하여야 합니다.</p>
                    <p>-기타 방송, 영화, CF 제작을 위한 대관 시에는 2시간 이상 4시간을 기본단위로 하여 대관장소에 따라 일일 기본시설 사용료의 150%로 할증됩니다.<br/>
                        단, 전시기간 중에는 작품의 보호를 위하여 대관이 불가능합니다.<br/>
                    그러나 전시 주최 측에서 전시홍보를 위한 촬영의 경우 사전에 전당의 승인을 받아야 합니다.</p>
                </div>
                <span>2.부대설비 사용료</span>
                <div class="con2-tbl">
                    <table>
                        <tr>
                            <th class="tbl1-1">구분</th>
                            <th class="tbl1-2">전시실</th>
                            <th class="tbl1-3">보유량</th>
                            <th class="tbl1-4">사용료/일</th>
                            <th class="tbl1-5">비고</th>
                        </tr>
                        <tr>
                            <td rowspan="2">외벽 현수막</td>
                            <td>4.5m(w)×5m(h)</td>
                            <td>1면</td>
                            <td>20,000/1일</td>
                            <td></td>
                        </tr>
                        <tr>
                
                            <td>6m(w)×6m(h)</td>
                            <td>1면</td>
                            <td>45,000/1일</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>음향장비 시스템</td>
                            <td>앰프, 마이크(2), 단상 등</td>
                            <td>1조</td>
                            <td>200,000/1일</td>
                            <td>테이프 커팅봉</td>
                        </tr>
                        <tr>
                            <td>로비공간</td>
                            <td>30㎡ 이내</td>
                            <td></td>
                            <td>120,000/1일</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>향온항습설비</td>
                            <td>6,7,8,9월</td>
                            <td>각실</td>
                            <td>80.000/1일</td>
                            <td>각실 개별가동</td>
                        </tr>
                        <tr>
                            <td>미술관수장고</td>
                            <td>작품보관</td>
                            <td></td>
                            <td>200,000/1일</td>
                            <td></td>
                        </tr>
                    </table>
                    <p>-전시관련 도록판매 외에 기념품 등 상품을 판매하기 위한 간이판매점을 설치할 경우 시설규모 및 위치에 대하여 전당의 승인을 받아야 하며,<br/>
                        위의 항목과 같이 사용료가 부과됩니다.</p>
                    <p>- 수장고 사용은 디자인미술관 대관전시 중 항온항습 등 컨디션유지를 목적으로 하는 전시에 한하여 허가되며 위 항목과 같이 사용료가 부과됩니다. 
                        단, 수장고 사정에 따라 사용이 불가능할 수 있으므로 사전에 사용신청을 해야 하며 전당으로부터 승인을 받아야만 합니다.</p>
                </div>
            </div>
            <!-- 대관료 구역 -->
            <!-- 대관규약 구역 -->
            <div class="con2-3 con2-div">
                <h2>대관규약</h2>
                <div class="bottom-text">
                    <p>◆ 총 칙</p>

                    <p>제 1 조 (목적)<br/>
                        이 규약은 자바미술관 등 외 전시시설(이하 “미술관”, “디자인미술관”이라 하며 통칭할 경우 “전시장”이라 한다)의 대여에 따른 원칙을 밝히고,<br/>
                        전당과 대관자가 상호 성실의 원칙에 입각하여 본 규약을 준수함으로써 효율적인 전시장 운영과 문화예술 창달 등<br/> 
                        소기의 목적을 달성하기 위해 제정되었습니다.</p>
                        
                    <p>제 2 조 (용어의 정의)<br/>
                        ① 대관이라 함은 전시 및 이와 관련된 부대행사 등을 위해 소정의 절차를 거쳐 전시장의 시설 및 설비를 임대하여 사용하는 것을 말합니다.<br/>
                        ② 대관자라 함은 ①항의 대관절차를 통해 전당과 계약을 체결한 개인 또는 단체를 말합니다.</p>
                        
                    <p> 제 3 조 (대관의 범위)<br/>
                        이 규약의 적용을 받는 대관시설은 미술관, 디자인미술관이며 대관은 전시 및 이와 관련된 부대행사를 대상으로 합니다.</p>
                        
                    <p> 제 4 조 (대관의 종류)<br/>
                        ① 대관은 신청 시기에 따라 정기대관, 수시대관, 우선대관으로 구분합니다.<br/>
                        ② 정기대관은 차기년도 전시일정 확정을 위해 전당이 별도로 정하는 기간 내에 시행하는 대관입니다.<br/>
                        ③ 수시대관은 정기대관 이후 당해 연도에 한하여 잔여공간 발생 시 시행되며 사용일로부터 최소 30일 이전에 이루어집니다.<br/>
                        ④ 우선대관은 전시의 성격 또는 그 필요성이 인정되는 경우 2~3년 이후의 전시에 대해서도 신청을 받아 승인 받는 대관을 말합니다.<br/>
                        우선대관은 수시로 신청이 가능하며, 승인 받은 경우 대관료는 신청년도의 대관료를 기준으로 계약하고<br/> 
                        추후 전시날짜가 속한 년도의 대관규약에 의거하여 대관료를 재 산정합니다.<br/>
                        ⑤ 전시는 단기대관(30일 미만) 및 장기대관(30일 이상)으로 구분하여 대관료 산정, 진행 조건 등을 달리 적용합니다.</p>

                    <p>◆ 대 관 료</p>

                    <p> 제 8 조 (대관료 결정)<br/>
                        대관료는 매년 시설유지비, 감가상각비, 인건비 등 원가요인을 고려하여 전당이 정합니다.</p>
                        
                    <p> 제 9 조 (대관료 구성 및 산정)<br/>
                        대관료는 기본시설 사용료와 부대설비 사용료로 나뉘며, 사용시간은 오전 11시부터 오후 7시까지 8시간(하절기는 8시까지 9시간) 기준입니다.<br/>
                        ① 기본시설 사용료는 전시실 사용료 및 냉·난방비와 기본 전기료, 조명료 등을 포함합니다.<br/> 
                        단, 기본시설 사용료 외 전시연출을 위해 발생하는 전기사용료는 별도로 전력을 계측하여 청구합니다.<br/>
                        ② 부대시설 사용료는 대관자가 기본시설 외에 선택적으로 대여한 설비에 대하여 적용되는 비용입니다.<br/>
                        ③ 전시준비 또는 작품철수 등을 위해 기준시간(09:00~18:00)외 추가로 작업이 필요한 경우, 전당의 승인을 얻은 후 시행하여야 합니다.<br/> 
                        이 경우 해당 시간에 대한 추가 대관료는 8시간을 기준으로 1시간을 기본 단위로 하여 일일 기본시설 사용료의 시간당 단가를 적용하며,<br/> 
                        작업시간은 전시장의 시설안전 및 보안유지 관계로 오후 10시까지로 제한합니다.<br/> 
                        ④ 전시관람을 목적으로 추가대관이 필요한 경우, 전당의 승인을 얻은 후 시행하여야 합니다.<br/> 
                        ⑤ 관람객 증가에 따라 전시장 관리상 초과로 부하가 발생하는 부분에 대한 비용을 부과합니다.<br/> 
                        1일 평균유료관람객이 수용 적정수준인 3천 명을 초과할 경우 기본시설 사용료의 10%를 추가로 부과합니다.</p>
                        
                    <p> 제 10 조 (대관료 납부)<br/>
                        기본시설 사용료는 계약금과 잔금으로 나누어 납부합니다.<br/>
                        ① 계약금은 전당이 정한 기간 내에 납부하여야 하며 입금계좌는 개별 가상계좌 또는 지정계좌로 합니다.<br/>
                        동 기한 내 납부하지 않으면 대관은 자동 취소됩니다.<br/>
                        ② 계약금은 제9조에서 산정한 기본시설 사용료 총액 기준으로 정기대관은 30%, 수시대관은 50%입니다.<br/> 
                        단, 수시 대관의 경우 대관승인시점이 전시장 사용일로부터 30일 미만인 경우 기본시설 사용료 총액을 납부하여야 합니다.<br/>
                        ③ 잔금은 전시장 사용일로부터 10일 전까지 납부하여야 합니다. 단, 잔금납부일 이전에 티켓판매를 개시하고자 할 경우<br/>
                        티켓 판매개시 이전에 잔금을 완납하여야 합니다. 잔금을 납부하지 않으면 전당은 잔금납부 시까지 전시개막을 유보하거나<br/> 
                        전시작품 일부에 대하여 법적절차를 거쳐 전당이 권리를 행사할 수 있습니다.<br/>
                        ④ 전시기간 중 추가로 공간 및 부대설비 사용이 필요한 경우는 전당에 사용허가를 득한 후 사용하여야 하며,<br/> 
                        사용료는 반드시 사용 전에 납부하여야 합니다.<br/>
                        ⑤ 전당은 기본시설 사용료를 포함한 대관료 확보를 보장받기 위하여 필요한 경우 대관자에게 해당 전시의 입장권<br/>
                        판매금액 등을 최우선하여 담보로 받을 수 있습니다.</p>
                </div>
            </div>
            <!-- 대관규약 구역 -->
        </div>
    </div>
     <%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>