window.addEventListener('load', function () {
	var btnList = document.querySelector('.btn-list');
	var dateBox = document.querySelector('.date-box');
	var start= dateBox.querySelector('.start');
	var end= dateBox.querySelector('.end');
	var radio=document.querySelector('.radio');
	var startDate=document.querySelector('.startDate');
	var endDate=document.querySelector('.endDate');
	var priceInput=document.querySelector('.price-input');
	var modify=document.querySelector('.modify');
	var progress=document.querySelector('.progress');
	var nonprogress=document.querySelector('.nonprogress');

/*수정 버튼 비활성화*/
	checkForm(startDate, endDate,priceInput,radio);
   	buttonActive(radio);
	
	
	 btnList.addEventListener('click', function (e){
	
        if(e.target.value=="진행"&&start.innerHTML==""&&end.innerHTML==""){
               
            alert("수정 버튼을 눌러 날짜와 가격을 먼저 등록해주세요!");
            return false;
        }else{
		return true;
}
	
    });

	/* 라디오 버튼 체크하면 수정 버튼 활성화*/
	radio.onclick=function(){
		 checkForm(startDate, endDate,priceInput,radio);
		buttonActive(radio);
	}
   /* 등록일 입력 */
    startDate.onkeyup = function() {
       checkForm(startDate, endDate,priceInput,radio);
    }

    /* 마감일 입력 */
    endDate.onkeyup = function() {
        checkForm(startDate, endDate,priceInput,radio);
    }
 /* 등록일 입력 */
    priceInput.onkeyup = function() {
        checkForm(startDate, endDate,priceInput,radio);
    }

     function checkForm(startDate, endDate,priceInput,radio){
        if (startDate.value != '' && endDate.value != '' &&priceInput.value != '' &&radio.checked) {
            modify.style.opacity = 1;
            modify.disabled = false;
            return;
        } 
        modify.style.opacity = 0.3;
        modify.disabled = true;
    }

	function buttonActive(radio){
        if (radio.checked) {
          	 progress.style.opacity = 1;
            progress.disabled = false;
			nonprogress.style.opacity = 1;
            nonprogress.disabled = false;
            return;
        } 
	        progress.style.opacity = 0.3;
	        progress.disabled = true;
			nonprogress.style.opacity = 0.3;
	        nonprogress.disabled = true;
    }

});
