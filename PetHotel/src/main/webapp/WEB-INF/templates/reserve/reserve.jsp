<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		check in : <input type="text" class="datepicker" id="datepicker1">
		check out : <input type="text" class="datepicker" id="datepicker2">
		마리수 : <input type="text" id="animalcnt">
		<input type="button" id="reserveSearch" value="검색">
	</div>
	<div>
		<div >
			
			
		</div>
		<div id = "showRoom">
		</div>
		
	</div>
</div> 


<script>
$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
	
	
$(document).ready(function(){       
    $( "#datepicker1,#datepicker2" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true
     });
    /* 첫번 째 달력에 오늘 이전의 날, 최대 날 지정*/
    $('#datepicker1').datepicker("option", "minDate", 0);
    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
    $('#datepicker1').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
        });
    
    /* 두번 째 달력에 예약 시작날, 지정 */
    $('#datepicker2').datepicker();
    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
    $('#datepicker2').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
       });
});

	
  /* $(function(){
    $('#datepicker1').datepicker({
    	minDate: 0,
    	onClose: function(){
    		$('#datepicker2').datepicker({
    			minDate: new Date($('#datepicker1').val()+1)
    		})
    	}
    });
  }); */
  
  /* datePickerSet($('#datepicker1'), $('#datepicker2'), true);
  
	function datePickerSet(sDate, eDate, flag){
		var sDay = sDate.val();
		var eDay = eDate.val();
		
		
	  
		if( flag && !isValidStr(sDay) && !isValidStr(eDay) ){
			var sdp = sDate.datePicker().data("datepicker");
			sdp.selectDate(new Date(sDay.replace(/-/g, "-")));
		
			var edp = eDate.datepicker().data("datepicker");
			edp.selectDate(new Date(eDay.replace(/-/g, "-")));
		}
		
		if (!isValidStr(eDay)) {
            sDate.datepicker("refresh",{
            	
            	maxDate: new Date(eDay.replace(/-/g, "-"))
            }).val();
        }
        sDate.datepicker({
        	minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert("start")
            }
        }).val();
        
        /* new Date(sDay.replace(/-/g,"-")) */
        
        /* if (!isValidStr(sDay)) {
        	alert(new Date(sDay.replace(/-/g,"-")));
        	alert(sDay)
            eDate.datepicker("refresh",{
                minDate: "20220925"
            }).val();
        }
        alert('test')
        eDate.datepicker({
        	minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert('end')
            }
        }).val();
		
	  
		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	  
	} */ 
	
	$("#reserveSearch").click(function() {
		var sendDate = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val()
		}
		
		$.ajax({
			url: "searchRoom.do",
			type: "POST",
			data: sendDate,
			success: function(data){
				alert("suc");
				$('#showRoom').html(data);
			}
		});
		
		
		
	});
</script>
</body>
</html>