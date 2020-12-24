<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" href="/images/logo.png">
    <title>회원가입 | 틈을 채우다</title>
    <link rel="stylesheet" href="../../css/reset.css">
    <link rel="stylesheet" href="../../css/layout.css">
    <link rel="stylesheet" href="../../css/reg.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
    <jsp:include page="/inc/header.jsp"/>

    <section class="container-sec">
        <div class="container">
            <main id="main" class="main">
               
                <!-- <h1>Join Now</h1> -->
                <img src="/images/join2.png" alt="">
                <div class="reg-form-sec">

                    <form action="/reg" method="post">
                        <div class="reg-form-container">
                            <div class="reg-form-item" style="position:relative;">
                                <label style="font-size: 12px;" for="email" title="이메일">
                                    <em style="color: red;">*</em>
                                    이메일
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="email check-validation" class="email check-validation"  
                                        placeholder="teum@example.com" id="email" name="email" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">올바른 이메일 형식을 입력해주세요</span>
                                    </div>
                                </div>
                                <button class="email-check">중복체크</button>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="password" title="비밀번호">
                                    <em style="color: red;">*</em>
                                    비밀번호
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="password" class="password check-validation" 
                                        placeholder="최소8자 영문/숫자/특수문자 필수" id="password" name="password" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">최소8자 영문/숫자/특수문자 필수입니다</span>
                                    </div>
                                </div>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="password-check" title="비밀번호확인">
                                    <em style="color: red;">*</em>
                                    비밀번호확인
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="password" class="password-check" 
                                        placeholder="비밀번호확인" id="password-check" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">비밀번호가 일치하지 않습니다</span>
                                    </div>
                                </div>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="name" title="이름">
                                    <em style="color: red;">*</em>
                                    이름
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="text" class="name check-validation" name="name"
                                        placeholder="이름" id="name" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">한글 이름만 허용됩니다</span>
                                    </div>
                                </div>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="birthday" title="생년월">
                                    <em style="color: red;">*</em>
                                    생년월일
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="text" class="birthday check-validation" name="birthday"
                                        placeholder="YYYYmmDD" id="birthday" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">19990000과 같은 형식으로 입력하세요</span>
                                    </div>
                                </div>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="phone" title="비밀번호확인">
                                    <em style="color: red;">*</em>
                                    연락처
                                </label>
                                <div class="input-box">
                                    <div>
                                        <input type="tel" class="phone check-validation" name="phone"
                                        placeholder="휴대폰번호" id="phone" autocorrect="off" 
                                        autocapitalize="off" autocomplete="off" aria-autocomplete="none" inputmode="text">
                                        <span class="caution-mention">휴대폰번호를 정확히 입력해주세요</span>
                                    </div>
                                </div>
                            </div>
                            <div class="reg-form-item">
                                <label style="font-size: 12px;" for="checkbox-2" title="비밀번호확인">
                                    <em style="color: red;">*</em>
                                    회원구분
                                </label>
                                <div>
                                    <div class="member-type">
                                        <div class="checkbox-container">
                                            <input name="member-type" type="radio" id="checkbox-2" value="회원" class="checkbox">
                                            <label for="checkbox-2"><span></span></label>
                                        </div>
                                        <div>
                                            개인회원
                                        </div>
                                        <div class="checkbox-container">
                                            <input name="member-type" type="radio" id="checkbox-3" value="업체" class="checkbox">
                                            <label for="checkbox-3"><span></span></label>
                                        </div>
                                        <div>
                                            기업회원
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="button-submit">
                            <input class="disabled" disabled type="submit" value="가입">
                        </div>
                    </form>
                </div>
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
    <script src="/js/reg.js"></script>
</body>
</html>