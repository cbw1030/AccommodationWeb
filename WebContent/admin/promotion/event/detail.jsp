<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/admin/layout.css">
    <link rel="stylesheet" href="/css/admin/promotion/event/detail.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>이벤트 상세페이지</title>
</head>
<body>
    <header class="sec-header">
        <div id="header" class="header">
            <div class="header-h1">
                <h1><a class="teum-logo" href="http://127.0.0.1:5500/main.html">틈</a></h1>
            </div>
            <div>
                <ul class="main-menu">
                    <li class="header-search"><input type="text"><a href=""><i class="fas fa-search"></i></a></li>
                    <li><a href="">공지사항</a></li>
                    <li><a href="">이벤트</a></li>
                    <li><a href="">더보기</a></li>
                    <li class="mypage"><a href="">로그인</a>
                        <div class="mega-menu">
                            <ul>
                                <li><a href="">submenu</a></li>
                                <li><a href="">submenu</a></li>
                                <li><a href="">submenu</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </header>

	<main>
	    <section class="body">
	        <aside id="aside" class="aside">
	            <h1>프로모션 관리</h1>
	                <ul>
	                    <li><a href="/admin/promotion/goldenTime/list">골든타임 관리</a></li>
	                    <li><a href="/admin/promotion/event/list" class="active">이벤트 관리</a></li>
	                </ul>
	        </aside>
	        <div class="container">
	            <nav id="nav" class="nav">
	                <ul>
	                    <li><a href="/admin/accommodations/list"><i class="fas fa-hotel"></i><span>업체관리</span></li></a>
	                    <li><a href="/admin/userInfo/list"><i class="fas fa-user-circle"></i><span> 회원관리</span></a></li>
	                    <li class="current-tab"><a href="/admin/promotion/goldenTime/list"><i class="far fa-calendar-alt"></i><span>프로모션관리</span></a></li>
	                    <li><a href="/admin/customerService/notice/list"><i class="fas fa-headphones"></i><span>고객센터</span></a></li>
	                </ul>
	            </nav>
	            <main id="main" class="main">
	                <div class="sub-container">
	                    <div class="breadcrumb">
	                        <ul class="breadcrumb-list">
	                            <li><i class="fas fa-home"></i>HOME ▶ </li>
	                            <li>프로모션관리 ▶ </li>
	                            <li>이벤트 관리</li>
	                        </ul>
	                    </div>
	                    <section class="img-sec">
	                        <div class="img-container">
	                            <img src="/images/event/detail1.png" alt="">
	                            <!-- <img src="../../../images/event/detail2.png" alt="">
	                            <img src="../../../images/event/detail3.png" alt="">
	                            <img src="../../../images/event/detail4.png" alt="">
	                            <img src="../../../images/event/detail5.png" alt="">
	                            <img src="../../../images/event/detail6.png" alt=""> -->
	                        </div>
	                    </section>
	                    <div class="btns-container">
                            <button class="btn btn-edit" onclick="location.href='edit?eventNo=${currEv.eventNo}'">수정</button>
                            <button class="btn btn-delete" onclick="location.href='del?eventNo=${currEv.eventNo}'">삭제</button>
                        </div>
	                    <section class="page-list-sec">
	                    	
	                    	<c:choose>
	                    		<c:when test="${prevEv == null && nextEv == null}">
	                    			<!-- 아무런 출력이 없어야함 -->
	                    		</c:when>
	                    		<c:when test="${prevEv == null}">
	                    			<div class="page next-page">
			                            <a href="">
			                                <span class="page-direction">다음글</span>
			                                <span class="page-title">${nextEv.title}</span>
			                                <span class="page-date">기간: ${nextEv.startDate} ~ ${nextEv.endDate}</span>
			                            </a>
			                        </div>
	                    		</c:when>
	                    		<c:when test="${nextEv == null}">
	                    			<div class="page prev-page">
			                            <a href="">
			                                <span class="page-direction">이전글</span>
			                                <span class="page-title">${prevEv.title}</span>
			                                <span class="page-date">기간: ${prevEv.startDate} ~ ${prevEv.endDate}</span>
			                            </a>
		                        	</div>
	                    		</c:when>
	                    		<c:otherwise>
		                    		<div class="page prev-page">
			                            <a href="detail?eventNo=${prevEv.eventNo}">
			                                <span class="page-direction">이전글</span>
			                                <span class="page-title">${prevEv.title}</span>
			                                <span class="page-date">기간: ${prevEv.startDate} ~ ${prevEv.endDate}</span>
			                            </a>
		                        	</div>
			                		<div class="page next-page">
			                            <a href="detail?eventNo=${nextEv.eventNo}">
			                                <span class="page-direction">다음글</span>
			                                <span class="page-title">${nextEv.title}</span>
			                                <span class="page-date">기간: ${nextEv.startDate} ~ ${nextEv.endDate}</span>
			                            </a>
			                        </div>
	                    		</c:otherwise>
	                    	</c:choose>
	                    	
	                        <div class="btn-container">
	                            <button class="btn-list" onclick="location.href='list'">목록보기</button>
	                        </div>
	                    </section>
	                </div>
	            </main>
	        </div>
	    </section>
	</main>
</body>

</html>