<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.teum.service.MemberService" %>
<%@ page import="com.teum.entity.Users" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../css/reset.css">
    <link rel="stylesheet" href="../../../css/layout.css">
    <link rel="stylesheet" href="../../../css/admin/layout.css">
    <link rel="stylesheet" href="../../../css/admin/userInfo/list.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>등록된 회원 리스트</title>
</head>
<body>
    <header class="sec-header-page">
        <section class="header-sec pcHeader">
            <div class="header-logo">
                <h1><a class="teum-logo" href="http://127.0.0.1:5500/main.html">틈</a></h1>
            </div>
            <div>
                <ul class="main-menu">
                    <li class="sub-page">
                        <a href="">로그인</a>
                    </li>
                </ul>
            </div>
        </section>
    </header>

	<main>
	    <section class="body">
	        <aside id="aside" class="aside">
				<h1>회원관리</h1>
					<ul>
						<li><a href="usersList" class="active">개인회원리스트</a></li>
						<li><a href="/admin/userInfo/company/companyList">기업회원리스트</a></li>
					</ul>
			</aside>
	        <div class="container">
	            <nav id="nav" class="nav">
	                <ul>
	                    <li><a href="/admin/accommodations/list"><i class="fas fa-hotel"></i><span>업체관리</span></a></li>
	                    <li class="current-tab"><a href="list"><i class="fas fa-user-circle"></i><span>회원관리</span></a></li>
	                    <li><a href="/admin/promotion/goldenTime/list"><i class="far fa-calendar-alt"></i><span>프로모션관리</span></a></li>
	                    <li><a href="/admin/customerService/notice/list"><i class="fas fa-headphones"></i><span>고객센터</span></a></li>
	                </ul>
	            </nav>
	            <main id="main" class="main">
	                <div class="sub-container">
	                    <div class="breadcrumb">
	                        <ul class="breadcrumb-list">
	                            <li><i class="fas fa-home"></i>&nbsp;&nbsp;HOME&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i></li>
	                            <li>&nbsp;&nbsp;&nbsp;회원관리&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i></li>
	                            <li>&nbsp;&nbsp;&nbsp;기업회원리스트&nbsp;&nbsp;&nbsp;</li>
	                        </ul>
	                    </div>
	
	                    <div>
	                        <h1>등급별 회원수</h1>
	                    </div>
	                    <div class="list-board">
	                        <table>
	                            <thead>
	                                <tr>
	                                    <td class="col-sm">등급</td>
	                                    <td class="col-m">인원</td>
	                                </tr>
	                            </thead>
	                            <tbody class="rank-count">
	                                <!-- <tr>
	                                    <td>실버</td>
	                                    <td>명</td>
	                                </tr>
	                                <tr>
	                                    <td>골드</td>
	                                    <td>30명</td>
	                                </tr>
	                                <tr>
	                                    <td>플레티넘</td>
	                                <td>3명</td>
	                                </tr>
	                                <tr>
	                                    <td>다이아</td>
	                                    <td>1명</td>
	                                </tr> -->
	                            </tbody>
	                        </table>
	                    </div>
	
	                    <div>
	                        <h1>등록된 개인회원리스트</h1>
	                        <select name="" id="">
	                            <option value="">전체등급</option>
	                            <option value="">실버</option>
	                            <option value="">골드</option>
	                            <option value="">플레티넘</option>
	                            <option value="">다이아</option>
	                        </select>
	                    </div>
	                    <section>
	                        <form action="delete" class="list-board" method="post">
	                            <table>
	                                <thead>
	                                    <tr>
	                                        <td class="col-s">No.</td>
	                                        <td class="col-sm">회원명</td>
	                                        <td class="col-m">이메일</td>
	                                        <td class="col-sm">생년월일</td>
	                                        <td class="col-m">휴대폰번호</td>
	                                        <td class="col-sm">회원등급</td>
	                                        <td class="col-s"><input type="checkbox"></td>
	                                    </tr>
	                                </thead>
	                                <tbody>
										<c:forEach var="m" items="${list}">
		                                    <tr>
		                                        <td class="col-s">${m.rownum }</td>
		                                        <td class="col-sm">${m.name }</td>
		                                        <td class="col-m" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href="detail?id=${m.id }">${m.email }</a></td>
		                                        <td class="col-sm">${m.birthday }</td>
		                                        <td class="col-m">${m.phone }</td>
		                                        <td class="col-sm user-rank">${m.rankId }</td>
		                                        <td class="col-s"><input type="checkbox" name="selected" value="${m.id }"></td>
		                                    </tr>
										</c:forEach>
	                                    <!-- <tr>
	                                        <td class="col-s">2</td>
	                                        <td class="col-sm">신중언</td>
	                                        <td class="col-sm">닉네임</td>
	                                        <td class="col-m">sje@newlecture.com</td>
	                                        <td class="col-sm">000000</td>
	                                        <td class="col-m">010-3462-8452</td>
	                                        <td class="col-m">2020-11-05</td>
	                                        <td class="col-s"><input type="checkbox"></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="col-s">3</td>
	                                        <td class="col-sm">김병준</td>
	                                        <td class="col-sm">닉네임</td>
	                                        <td class="col-m">kbj@newlecture.com</td>
	                                        <td class="col-sm">000000</td>
	                                        <td class="col-m">010-2365-5678</td>
	                                        <td class="col-m">2020-11-14</td>
	                                        <td class="col-s"><input type="checkbox"></td>
	                                    </tr>
	                                    <tr>
	                                        <td class="col-s">4</td>
	                                        <td class="col-sm">박수현</td>
	                                        <td class="col-sm">닉네임</td>
	                                        <td class="col-m">psh@newlecture.com</td>
	                                        <td class="col-sm">000000</td>
	                                        <td class="col-m">010-3863-1263</td>
	                                        <td class="col-m">2020-11-23</td>
	                                        <td class="col-s"><input type="checkbox"></td>
	                                    </tr> -->
	                                    <tr class="btn-delete">
	                                        <td colspan="7"><input type="submit" value="삭제"></td>
										</tr>
										<tr>
											<td colspan="6" class="no-border">
												<div class="pager-container">
													<div class="btn btn-prev">
														<span><a href="">이전</a></span>
													</div>
													<ul class="pager-list">
														<!-- <li class="active-page"><a href="usersList?page=1">1</a></li>
														<li><a href="usersList?page=2">2</a></li>
														<li><a href="">3</a></li>
														<li><a href="">4</a></li>
														<li><a href="">5</a></li>
														<li><a href="">6</a></li>
														<li><a href="">7</a></li>
														<li><a href="">8</a></li>
														<li><a href="">9</a></li>
														<li><a href="">10</a></li> -->
													</ul>
													<div class="btn btn-next">
														<span><a href="">다음</a></span>
													</div>
												</div>
											</td>
										</tr>
	                                </tbody>
	                            </table>
	                        </form>
	                    </section>
						<div class="search-container private-list">
							<div>
								<form action="usersList">
									<select name="field" id="">
										<option value="name" selected>회원명</option>
										<option value="email">이메일</option>
									</select>
									<input type="text" name="query">
									<input type="submit" value="검색">
								</form>
							</div>
						</div>
	                </div>
	            </main>
	        </div>
	    </section>
	</main>
	
	<script type="pager-template" id="pagerList">
		<li class><a href="usersList?page={id}">{page}</a></li>
	</script>
	
	<script type="rank-count-template" id="rankCount">
		<tr>
		    <td>{rank}</td>
		    <td>{count}명</td>
		</tr>
	</script>
    
    <script type="text/javascript">
    	window.addEventListener("load",function(){
    		
	    	var rank = document.querySelectorAll(".user-rank");
    		console.log(rank);
    		/* var icon = document.createElement('i');
    		icon.setAttribute("class","far fa-gem");
    		icon.style.color="red";
    		
			for(var v of rank){
				console.log(icon);
				v.append(icon);
				switch(v.innerText){
				case "0":
					v.innerText = "실버";
					break;
				case "1":
					v.innerText = "골드";
					break;
				case "2":
					v.innerText = "플래티넘";
					break;
				case "3":
					v.innerText = "다이아";
					break;
				}
			}
			
			var type = document.querySelectorAll(".user-type");
			for(var v of type){
				switch(v.innerText){
				case "0":
					v.innerText ="개인회원";
					break;
				case "1":
					v.innerText = "기업회원";
					break;
				}
			} */
		
			var icon = document.createElement('i');
	    	icon.setAttribute("class","far fa-gem");
	    	
			for(var i=0;i<rank.length;i++){
				(function(m){
					
					switch(rank[m].innerText){
		    		
					case "1":
						rank[m].style.color = "green";
						rank[m].innerHTML = "실버<i class='fas fa-gem'></i>";
						break;
					case "2":
						rank[m].style.color = "gold";
						rank[m].innerHTML = "골드<i class='fas fa-gem'></i>";
						break;
					case "3":
						rank[m].style.color = "gray";
						rank[m].innerHTML = "플래티넘<i class='fas fa-gem'></i>";
						console.log(m);
						break;
					case "4":
						rank[m].style.color = "black";
						rank[m].innerHTML = "다이아<i class='fas fa-gem'></i>";
						console.log(m);
						break;
					}
				})(i);
	    	}
    	});
    	
    	/*  페이저 구현 */
    	var pagerList = document.querySelector(".pager-list");
    	var html = document.querySelector("#pagerList").innerHTML;
    	var resultHTML = "";
    	for(var i=1;i<="${pageCount}";i++){
    		resultHTML = html.replace("{id}",i)
    						.replace("{page}",i);
    		pagerList.innerHTML+=resultHTML;
    	}
    	
    	if("${page}"==""){
    		pagerList.firstElementChild.setAttribute('class','active-page');
    	}
    	else{
    		pagerList.children[${page}-1].setAttribute('class','active-page');
    	}
		
    	/* 랭크별 인원수 구현 */
    	var ranks = ['실버','골드','플레티넘','다이아'];
    	
    	var rankCount = document.querySelector(".rank-count");
    	var html_rank_count = document.querySelector("#rankCount").innerHTML;
    	var resultHTML_rank = "";
    	<c:forEach items="${rankCount}" var="rankCount" varStatus="status">
    		resultHTML_rank = html_rank_count.replace("{rank}",ranks[${status.index}])
    										.replace("{count}","${rankCount}")
    		rankCount.innerHTML += resultHTML_rank;
    	</c:forEach>
    </script>
</body>
</html>