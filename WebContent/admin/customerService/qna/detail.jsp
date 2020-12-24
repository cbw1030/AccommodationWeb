<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/logo.png">
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/admin/layout.css">
    <link rel="stylesheet" href="/css/admin/QnA/detail.css">
     <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>고객센터 | 틈을 채우다</title>
</head>
<body>
    <jsp:include page="/inc/header.jsp"/>
    <main>
	    <section class="body">
	        <aside id="aside" class="aside">
	            <h1>고객센터</h1>
	                <ul>
	                    <li><a href="/admin/customerService/notice/list" >공지사항</a></li>
	                    <li class="active"><a href="list" >QnA</a></li>
	                </ul>
	        </aside>
	        <div class="container">
	            <nav id="nav" class="nav">
	                <ul>
	                     <li><a href="/admin/accommodations/list"><i class="fas fa-hotel"></i><span>업체관리</span></a></li>
	                    <li><a href="/admin/userInfo/users/usersList"><i class="fas fa-user-circle"></i><span>회원관리</span></a></li>
	                    <li><a href="/admin/promotion/goldenTime/list"><i class="far fa-calendar-alt"></i><span>프로모션관리</span></a></li>
	                    <li class="current-tab"><a href="list"><i class="fas fa-headphones"></i><span>고객센터</span></a></li>
	                </ul>
	            </nav>
	            <main id="main" class="main">
	                <h1 class="d-none">문의사항</h1>
	                <section class="sub-container">
	                    <div class="breadcrumb">
	                        <ul class="breadcrumb-list">
	                              <li><i class="fas fa-home"></i>&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i> </li>
                        		<li>&nbsp;&nbsp;&nbsp;고객센터&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i></li>
	                            <li>&nbsp;&nbsp;&nbsp;QnA&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i></li>
	                            <li>&nbsp;&nbsp;&nbsp;문의사항 디테일</li>
	                        </ul>
	                    </div>
	                    <section class="form-sec">
	                        <h1>문의사항 디테일</h1>
	                        <form action="" class="reg-form">
	                            <table class="table">
	                                <tr>
	                                    <th class="col-m">제목</th>
	                                    <td class="col-l text-left">
	                                       ${q.title}
	                                      
	                                    </td>
	                                    <th class="col-m">카테고리</th>
	                                    <td class="col-l text-left">
	                                     <c:choose>
											<c:when test="${q.categoryId eq 1}">
												이벤트
											</c:when>
											<c:when test="${q.categoryId eq 2}">
												예약/결제
											</c:when>
											<c:when test="${q.categoryId eq 3}">
												취소/환불
											</c:when>
											<c:when test="${q.categoryId eq 4}">
												서비스이용
											</c:when>
											<c:when test="${q.categoryId eq 5}">
												회원/개인정보
											</c:when>
											<c:when test="${q.categoryId eq 6}">
												리뷰
											</c:when>
											<c:otherwise>
												기타
											</c:otherwise>
	                                     </c:choose>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>내용</th>
	                                    <td class="text-left" colspan="3">
	                                        ${q.content}
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>답변내용</th>
	                                    <td class="text-left" colspan="3">
	                                        ${q.answerContent}
	                                    </td>
	                                </tr>
	                            </table>
	                            <div>
	                            	<a class="btn-cancel" href="list">목록</a>
	                                <a class="btn-cancel" href="reg?id=${q.id}">답변하기</a>
                    				<a class="btn-cancel" href="del?id=${q.id}">삭제</a>
	                            </div>
	                        </form>
	                    </section>
	                </section>
	            </main>
	        </div>
	    </section>
   </main>
</body>
</html>