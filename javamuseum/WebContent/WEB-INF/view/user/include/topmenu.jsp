<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="util.*" %>
<%@ page import="manage.member.*" %>
<%
MemberVO umembervo = (MemberVO)session.getAttribute("memberInfo");
%>
<!-- 헤더 구역 -->
    <div id="header">
        <div class="h-top clear">
            <ul class="login">
            <%
            if(umembervo != null) {
            %>
	            <li id="memberName"><%= umembervo.getName() %>님</li>
	            <li><a href="/user/mypage/mypage">MY PAGE</a></li>
	            <li><a href="/user/logout">LOGOUT</a></li>
            <%
            } else {
            %>
                <li><a href="/user">LOGIN</a></li>
                <li><a href="/user/membership">JOIN</a></li>
            <% } %>
            </ul>
            
        </div>
        <div class="h-bot">
            <div class="h-bot-line"></div>
            <div class="h-bot-in clear">
                <div class="logo"><a href="/user/index">자바미술관</a></div>
                <ul class="h-menu">
                    <li>
                        <a href="#">VISIT</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="/user/visit/visit1">관람안내</a></li>
                                <li><a href="/user/visit/visit2">미술관 소개</a></li>
                                <li><a href="/user/visit/visit3">오시는길</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">EXHIBITION</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="/user/exhibition/subExhibition1">현재 전시</a></li>
                                <li><a href="/user/exhibition/subExhibition2">지난 전시</a></li>
                                <li><a href="/user/review/index">모든 리뷰</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">RENTAL</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="/user/rental/hall">대관안내</a></li>
                                <li><a href="/user/rental/hall2">대관신청</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#">NEWS</a>
                        <div class="sub">
                            <ul class="sub-menu">
                                <li><a href="/user/program/program">프로그램</a></li>
                                <li><a href="/user/notice/notice">공지사항</a></li>
                                <li><a href="/user/faq/index">FAQ</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 헤더 구역 -->