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
    <title>예약내역 | 틈을 채우다</title>
    <link rel="stylesheet" href="../../css/reset.css">
    <link rel="stylesheet" href="../../css/layout.css">
    <link rel="stylesheet" href="../../css/user/userInfo/reservationInfo.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="/js/user/userInfo/reservationInfo.js"></script>

</head>

<body>
    <jsp:include page="/inc/header.jsp"/>

    <section class="container-sec">
        <div class="container">
            <aside id="aside" class="aside">
                <!-- <h1>게시판</h1> -->
                <ul>
                    <li><a href="/user/userInfo/memberInfo"><i class="far fa-user-circle"></i>&nbsp;&nbsp;회원정보수정</a></li>
                    <li class="active"><a href="/user/reservation/reservationInfo"><i class="far fa-calendar-check"></i>&nbsp;&nbsp;예약관리</a></li>
                    <li><a href="/user/userInfo/offerList"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;제안신청관리</a></li>
                    <li><a href="/user/userInfo/pickList"><i class="fas fa-hand-holding-heart"></i>&nbsp;&nbsp;찜한상품조회</a></li>
                </ul>
            </aside>
            <main id="main" class="main">
                <div class="breadcrumb">
                    <ul class="breadcrumb-list">
                        <li><i class="fas fa-home"></i>&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i> </li>
                        <li>&nbsp;&nbsp;&nbsp;마이페이지</li>
                    </ul>
                </div>
                <section class="reservation-list-sec">
                    <h1>이용/취소내역</h1>
                    <ul class="reservation-list-container">
                    	<c:forEach items="${list }" var="info" varStatus="status">
                    	
	                        <li class="reservation-item">
	                        		<c:forTokens var="fileRoute" items="${info.fileRoute}" delims="," varStatus="st">
                                       <c:if test="${st.first == true}">
                                          <img src="${fileRoute}" alt="">
                                       </c:if>
                                    </c:forTokens>
	                            <c:if test="${info.cancelStatus == 0 }">
			               			<c:set var="now" value="<%=new java.util.Date()%>" />
			               			<c:choose>
			               				<c:when test="${info.checkinDate  >= now}">
			               					<p>이용예정</p>
			               				</c:when>
			               				<c:otherwise>
			               					<p>이용완료</p>
			               				</c:otherwise>
			               			</c:choose>
			               		</c:if>
			               		<c:if test="${info.cancelStatus == 1 }">
			               			<p>취소</p>
			               		</c:if>
	                            <p>${info.accName }</p>
	                            <p>${info.checkinDate } ~ ${info.checkoutDate }</p>
	                            <p style="display:flex;">
	                            	<input type="button" value="다시예약" class="re-reserve-btn">
	                            	<input type="hidden" value="${info.accId }">
	                            	<input type="button" value="${(info.reviewScore==0)?'리뷰쓰기':'리뷰수정' }" class="review-reg">
	                            	<input type="hidden" value="${info.id }">
	                            </p>
	                        </li>
	                        <input type="hidden" value="${info.id }">
                    	</c:forEach>
                        
                    </ul>
                    <div class="btn-more-sec">
		            	<a href="" class="btn-more">더보기</a>
	            		<input type="hidden" value="${page+1 }" class="page">
	            		<input type="hidden" value="${reservationCount }" class="reservation-count">
		            </div>
                </section>
            </main>
        </div>
    </section>

    <!-- <section class="userInfo_main">
        <main class="sec_userInfo_main">
            <h1>회원정보수정</h1>
            <aside>
                <h1>회원정보관리(개인)</h1>
                <ul>
                    <li>
                        <a href="">회원정보수정</a>
                    </li>
                    <li>
                        <a href="">예약관리</a>
                    </li>
                    <li>
                        <a href="">경매신청관리</a>
                    </li>
                    <li>
                        <a href="">최근살펴본상품조회</a>
                    </li>
                    <li>
                        <a href="">찜한상품조회</a>
                    </li>
                </ul>
            </aside>

            <div>
                <section>
                    <h1>예약관리</h1>

                    <section>
                        <h1>이용/취소내역</h1>
                        <ul>
                            <li>
                                <img src="배경1-1.PNG" alt="">
                                <p>사용완료</p>
                                <p>신촌 아이다호텔</p>
                                <p>12.23 일 - 12.23 일 / 대실</p>
                                <p><a href="">다시예약</a></p>
                            </li>
                        </ul>
                    </section>

                </section>
            </div>
        </main>
    </section> -->

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
    <script type="more-template" id="more-template">
    	<li class="reservation-item">
	                            <img src="../../images/company/호텔/서울/강남구/신라스테이_삼성/{fileName}" alt="">
	                            <p>{status}</p>
	                            <p>{accName}</p>
	                            <p>{checkinDate} ~ {checkoutDate}</p>
	                            <p>
									<input type="button" value="다시예약" class="re-reserve-btn">
									<input type="hidden" value="{accId}">
									<input type="button" value="{reviewStatus}" class="review-reg">
	                            	<input type="hidden" value="{id}">
								</p>
	                        </li>
							<input type="hidden" value="{id}">
    </script>
</body>

</html>