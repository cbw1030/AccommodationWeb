<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/logo.png">
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/user/offer/edit.css"  type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>제안신청 | 틈을 채우다</title>
</head>
<body>
    <jsp:include page="/inc/header.jsp"/>

    <section class="container-sec">
        <div class="container">
            <main id="main" class="main">
                <div class="ment-container">
                    <div class="ment-title">Teum</div>
                    <div class="ment-content">
                        <div class="quote left-quote">
                            <i class="fas fa-quote-left"></i>
                        </div>
                        <div class="quote right-quote">
                            <i class="fas fa-quote-right"></i>
                        </div>
                        <div class="ment">지금까지 고정된 가격에 숙소를 예약하셨나요?</div>
                        <div class="ment">숙박 시장에 새로운 <span>패러다임(Paradigm)</span>과 <span>혁신(Innovation)</span>으로</div>
                        <div class="ment">틈을 이용하는 모든 고객들에게 새로운 가치를 제공합니다.</div>
                    </div>
                </div>

                <section class="reg-form-sec">
                    <form action="edit" method="post" class="reg-form">
                        <div>
                            <section>
                                <i class="far fa-calendar-alt"></i><span>&nbsp;&nbsp;&nbsp;&nbsp;날짜&nbsp;&nbsp;&nbsp;</span> 
                                <input type="date" name="checkin-date" class="form-option date start-date" required>
                                <input type="date" name="checkout-date" class="form-option date end-date" required>
                            </section>
                            <section>
                                <i class="fas fa-map-marker-alt"></i><span>&nbsp;&nbsp;&nbsp;&nbsp;지역&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <select name="main-city" class="form-option main-city">
                                    <option value="서울">서울</option>
                                    <option value="부산">부산</option>
                                    <option value="제주">제주</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="강원">강원</option>
                                    <option value="경상">경상</option>
                                    <option value="전라">전라</option>
                                    <option value="충청">충청</option>
                                </select>
                                <select name="sub-city" class="form-option sub-city">
                                    <option value="강남구">강남구</option>
				                    <option value="강동구">강동구</option>
				                    <option value="강북구">강북구</option>
				                    <option value="강서구">강서구</option>
				                    <option value="관악구">관악구</option>
				                    <option value="광진구">광진구</option>
				                    <option value="구로구">구로구</option>
				                    <option value="금천구">금천구</option>
				                    <option value="노원구">노원구</option>
				                    <option value="도봉구">도봉구</option>
				                    <option value="동대문구">동대문구</option>
				                    <option value="동작구">동작구</option>
				                    <option value="마포구">마포구</option>
				                    <option value="서대문구">서대문구</option>
				                    <option value="서초구">서초구</option>
				                    <option value="성동구">성동구</option>
				                    <option value="성북구">성북구</option>
				                    <option value="송파구">송파구</option>
				                    <option value="양천구">양천구</option>
				                    <option value="영등포구">영등포구</option>
				                    <option value="용산구">용산구</option>
				                    <option value="은평구">은평구</option>
				                    <option value="종로구">종로구</option>
				                    <option value="중구">중구</option>
				                    <option value="중랑구">중랑구</option>
                                </select>
                            </section>
                            <section>
                                <i class="fas fa-hotel"></i><span>&nbsp;&nbsp;&nbsp;타입&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <select name="acc-type" class="form-option category">
                                    <option value="호텔">호텔</option>
                                    <option value="모텔">모텔</option>
                                    <option value="펜션">펜션</option>
                                    <option value="리조트">리조트</option>
                                    <option value="게스트하우스">게스트하우스</option>
                                </select>
                            </section>
                            <section>
                                <i class="fas fa-user"></i><span>&nbsp;&nbsp;&nbsp;인원수&nbsp;</span>
                                <select name="headcount" class="form-option people-select">
                                    <option value="">1</option>
                                    <option value="" selected>2</option>
                                    <option value="">3</option>
                                    <option value="">4</option>
                                    <option value="">5</option>
                                    <option value="">6</option>
                                    <option value="">7</option>
                                    <option value="">8</option>
                                    <option value="">9</option>
                                    <option value="">10</option>
                                    <option value="">11</option>
                                    <option value="">12</option>
                                    <option value="">13</option>
                                    <option value="">14</option>
                                    <option value="">15</option>
                                    <option value="">16</option>
                                    <option value="">17</option>
                                    <option value="">18</option>
                                    <option value="">19</option>
                                    <option value="">20</option>
                                </select>
                            </section>
                            <section>
                                <i class="fas fa-won-sign"></i><span>&nbsp;&nbsp;&nbsp;가격&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" name="price" class="form-option price-input" placeholder="원(￦) 단위로 입력해 주세요" required>
                            </section>
                        </div>
                        <section class="submit-btn-sec">
                            <input type="submit" class="btn submit-btn" value="저장하기" />
                            <a href="/index" class="btn cancel-btn">돌아가기</a>
                        </section>
                    </form>
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
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li>
                        <a href="">이용약관</a>
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li>
                        <a href="">개인정보처리방침</a>
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li>
                        <a href="">사업자정보확인</a>
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li>
                        <a href="">틈 마케팅센터</a>
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li>
                        <a href="">액티비티 호스트센터</a>
                        <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    </li>
                    <li><a href="">콘텐츠산업진흥법에의한 표시</a></li>
                </ul>

                <p><b>고객행복센터 1577-8282</b> 오전 09:00 ~ 오후18:00</p>

                <address>
                    <span>(주)TEUM</span>
                    주소 : 서울특별시 종로구 인사동길 12 대일빌딩 15층
                    <br />대표이사 : 신중언 | 사업자등록번호 777-11-45678 <br />통신판매번호 : 2020-서울강남-12345 | 관광사업자 등록번호 : 제
                    1324-55호 <br />전화번호 : 010-1111-2222 <br />전자우편주소 : teum@teum.co.kr <br />Copyright TEUM COMPANY Corp. All rights
                    reserved.
                </address>
            </div>
        </footer>
    </section>

</body>
</html>