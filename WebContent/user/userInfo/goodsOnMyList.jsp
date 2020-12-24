<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" href="/images/logo.png">
    <title>찜한 상품 | 틈을 채우다</title>
    <link rel="stylesheet" href="../../css/reset.css">
    <link rel="stylesheet" href="../../css/layout.css">
    <link rel="stylesheet" href="../../css/user/userInfo/goodsOnMyList.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="/js/user/userInfo/goodsOnMyList.js"></script>

</head>

<body>
    <jsp:include page="/inc/header.jsp"/>

    <section class="container-sec">
        <div class="container">
            <aside id="aside" class="aside">
                <!-- <h1>게시판</h1> -->
                <ul>
                    <li><a href="memberInfo"><i class="far fa-user-circle"></i>&nbsp;&nbsp;회원정보수정</a></li>
                    <li><a href="/user/reservation/reservationInfo"><i class="far fa-calendar-check"></i>&nbsp;&nbsp;예약관리</a></li>
                    <li><a href="offerList"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;제안신청관리</a></li>
                    <li class="active"><a href="pickList"><i class="fas fa-hand-holding-heart"></i>&nbsp;&nbsp;찜한상품조회</a></li>
                </ul>
            </aside>
            <main id="main" class="main">
                <div class="breadcrumb">
                    <ul class="breadcrumb-list">
                        <li><i class="fas fa-home"></i>&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i> </li>
                        <li>&nbsp;&nbsp;&nbsp;마이페이지</li>
                    </ul>
                </div>
                <section class="picked-item-sec">
                    <h1>찜한 상품</h1>
                    <c:if test="${list ne null}">
                    
	                    <c:forEach items="${list}" var="pick" varStatus="status">
		                    <div class="snip1368" onclick="location.href='/accommodation/detail?accId=${pick.accId}'">
		                    	<c:forTokens var="fileRoute" items="${pick.accFileRoute}" delims="," varStatus="st">
                                       <c:if test="${st.first == true}">
                                          <img src="${fileRoute}" alt="">
                                       </c:if>
                                </c:forTokens>
		                        <h3>예약하기</h3>
		                        <figcaption>
		                            <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>
		                              <a href="#"> <i class="ion-social-twitter-outline"></i></a>
		                              <a href="#"> <i class="ion-social-vimeo-outline"></i></a>
		                            </div>
		                          </figcaption>
		                        <div class="description-item">
		                            <p>${pick.accName }</p>
		                            <P>리뷰 ${pointList.get(status.index) } 추천해요</P>
	                            	<p>${fn:substring(pick.accLocation,0,7) }</p>
		                        </div>
		                        <div class="item-price">
		                            <div>
		                                <p>숙박</p>
		                                <p>예약특가</p>
		                                <p><fmt:formatNumber value="${pick.price }" pattern="#,###" />원</p>
		                            </div>
		                        </div>
		                        <div class="delete-button">
		                        	<button>삭제</button>
		                        	<input type="hidden" value="${pick.accId }">
		                        	<input type="hidden" value="${pick.userId }">
		                       	</div>
		                        <div class="hovered-item-bg">
		                        </div>
		                    </div>
	                    </c:forEach>
                    </c:if>
                    <c:if test="${empty list}">
                    	<div>찜한 상품이 없습니다.</div>
                    </c:if>
                </section>
            </main>
        </div>
    </section>

    <section>
        <footer id="footer" class="footer">
            <div>
                <ul>
                    <li>
                        <a href="">회사소개</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="">이용약관</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="">개인정보처리방침</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="">사업자정보확인</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="">여기어때 마케팅센터</a>
                        <span>|</span>
                    </li>
                    <li>
                        <a href="">액티비티 호스트센터</a>
                        <span>|</span>
                    </li>
                    <li><a href="">콘텐츠산업진흥법에의한 표시</a></li>
                </ul>
        
                <p><b>고객행복센터 1577-8282</b>   오전 09:00 ~ 오후18:00</p>
    
                <address>
                    <span>(주)TEUM</span>
                    주소 : 서울특별시 종로구 인사동길 12 대일빌딩 15층
                    <br>대표이사 : 신중언 | 사업자등록번호 777-11-45678
                    <br>통신판매번호 : 2020-서울강남-12345 | 관광사업자 등록번호 : 제 1324-55호
                    <br>전화번호 : 010-1111-2222
                    <br>전자우편주소 : teum@teum.co.kr
                    <br>Copyright TEUM COMPANY Corp. All rights reserved.
                </address>
            </div>
        </footer>
    </section>
</body>

</html>