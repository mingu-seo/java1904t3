<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
    
<title>미술관소개</title>
<link rel="stylesheet" href="/css/sub-visit3.css">
<style>
      
</style>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>

</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div class="con">
        <!-- 메인배너 시작 -->
        <div class="con1">
            <div class="con1-box">
                <h3>VISIT</h3>
                <p>미술관 오시는 길</p>
            </div>
        </div>
        <!-- 메인배너 끝 -->
        <!-- 대중교통 시작 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-gr1 clear">
                    <h3>지하철 이용시</h3>
                    <img src="/img/subway.png">
                    <div class="con2-text">
                        <h5>경복궁역 3호선 3번출구</h5>
                        <p>1. 3번 출구에서 100m 직진</p> 
                        <p>2. 스타벅스 경복궁역점 우측 골목길 100m 직진</p>
                        <p>3. 골목길 왼편 대림미술관 도착</p>
                    </div>
                    <div class="con2-text">
                        <h5>경복궁역 3호선 4번출구</h5>
                        <p>1. 4번 출구에서 약 100m 직진 후 경복궁 방향 횡단보도 건너가기전 왼쪽길 </p> 
                        <p>2. 코오롱패션디자인학원까지약 170m 직진 후 왼쪽 골목 진입 </p>
                        <p>3. 약 40m 직진 후 대림미술관도착</p>
                    </div>
                </div>
                <div class="con2-gr1 clear">
                    <h3>버스 이용시</h3>
                    <img src="/img/bus.png">
                    <div class="con2-text">
                        <h5>경복궁역 3호선 3번출구</h5>
                        <p>1. 서울 지방 경찰청 앞 정류장 : 171, 272, 606, 706</p>
                        <p>2. 파파이스 앞 정류장 : 7212, 1020,1711, 7016, 7018</p>
                        <p>3. 할리스 커피 앞 정류장 : 7212, 1020, 1711, 7016, 7018, 7022</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 대중교통 끝 -->
    </div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>