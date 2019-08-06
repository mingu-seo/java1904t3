<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="manage.review.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>미술관소개</title>
    <link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/review.css">
    <link rel="stylesheet" href="/css/footer.css">
    <style>
    
    </style>
    <script src="https://kit.fontawesome.com/3db09483e7.js"></script>
    <script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/js/slick.js"></script>
    <script type="text/javascript" src="/js/aos.js"></script>
    <script type="text/javascript" src="/js/gnb.js"></script>
    <script type="text/javascript">
        $(function(){
            
            $(".con2-bggroup > li > a").click(function(event){ // a링크 정지
                event.preventDefault(); // a링크 정지
                $(this).siblings(".con2-sub01").stop().fadeIn(); 
            });
            $(".sub01-close").click(function(event){ // a링크 정지
                event.preventDefault(); // a링크 정지
                $(this).parent(".con2-sub01").stop().fadeOut();
            });

            $(".sub01-btn .li1").click(function(event){
                event.preventDefault();
                $(".con3-bg").show();
            });
            $(".sub01-btn .li2").click(function(event){
                event.preventDefault();
                $(".con4-bg").show();
            })
            $("#submit-btn2").click(function(){
                $(".con3-bg").hide();
            });
            $(".con4 #submit-btn2").click(function(){
                $(".con4-bg").hide();
            });
            $(".con4-epilogue").click(function(event){
                event.preventDefault();
                var list=$(this).hasClass("on") //클릭한 자기자신에게 on이 붙어있는지 없는지 확인
                

                if(list) { //on이 붙어있을때 - true
                    $(this).removeClass("on");
                    $(this).siblings(".con4-ep-cont").stop().slideUp();
                }
                else { //on이 없을때 - false

                    $(".con4-epilogue").removeClass("on")
                    $(this).addClass("on");
                    $(".con4-epilogue").siblings(".con4-ep-cont").stop().slideUp();
                    $(this).siblings(".con4-ep-cont").stop().slideDown();
                }
            })
        })
    </script>
</head>
<body>
    
    <div class="con">
       
        <div class="con2">
            <div class="con2-center">
                
                	
               
                <ul class="con2-bggroup clear">
                    
                    
                   <ul class="sub01-btn clear">
                                        <li class="li1"><a href="#">예매하기</a></li>
                                        <li class="li2"><a href="#">후기</a></li>
                                    </ul>
              		</ul>
                
            </div>
        </div>
        
        
        
        
        
        <div class="con4">
            <div class="con4-bg">
                <div class="con4-gr">
                    <div class="con4-header">
                        <h3>전시후기</h3>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    <div class="con4-center">
                        <ul class="con4-top clear">
                            <li class="con4-top-img"><img src="/img/sub-exhibition1-1.jpg"></li>
                            <li class="con4-top-text">
                                <h4>로봇 일러스트레이션을 통해</h4>
                                <h4>기계적 판타지를 구현하는</h4>
                                <h3>하지메 소라야마 / Hajime Sorayama</h3>
                                <p>하지메 소라야마는 40여 년 동안 메탈을 소재로 에어 브러시 페인팅 기법을</p>
                                <p>이용한 로봇 일러스트레이션과 조각을 선보여 왔다. 작가는 인간의 형태를 정확히 따르고</p>
                                <p>있는 휴머노이드(humanoid)를 통해 인간과 기계에 대한 통합적인 아름다움을 보여주며,</p>
                                <p>일본 내 다양한 대중문화 콘텐츠로 등장한 기계적 판타지의 서막을 열었다.</p>
                            </li>
                        </ul>
                 <div>후기 더 보기</div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div class="con4-bot">
                            <div class="con4-bot-title">
                                <h4>BEST 한줄평 / 후기</h4>
                            </div>
                            
                            
                            
                            
                            <div class="con4-bot-text">
                                <div class="con4-bot-text-list">
                                    <div class="con4-epilogue clear">
                                        <div class="rating">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <div class="notice">
                                            <p class="notice-title">관람후기제목</p>
                                            <p class="auther">
                                                <span>김**</span>
                                                <span>2019-07-04</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="con4-ep-cont">
                                        후기 잘봤습니다.<br/>
                                        후기 잘봤습니다.
                                    </div>
                                </div>
                            </div>
                                                       
                           
                        </div>
                        <ul class="write clear">
                            <form method="GET" action="insert.php">
                                <li><input type="text" id="text" name="text" placeholder="내용을 입력하세요"></li>
                                <li><input type="submit" id="write-submit" name="write-submit" value="등록"></li>
                            </form>
                        </ul>
                        <div class="con4-btn clear">
                                <ul class="btn-group clear">
                                    <li><input type="submit" id="submit-btn1" name="submit-btn1" value="예매하기"></li>
                                    <li><button id="submit-btn2">닫기</button></li>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    

</body>
</html>