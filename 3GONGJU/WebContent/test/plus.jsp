<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택된 물품 계산하기</title>
<script>
var sum=0;
function calc(cBox) {
var sumtext = document.getElementById("sumtext"); // 이런것들 무조건 function안에 쓰기.
 
    if(cBox.checked)
        sum += parseInt(cBox.value);
    else
        sum -= parseInt(cBox.value);
    sumtext.value = sum;
    //document.getElementById("sumtext").value = sum;
}

//전체선택 체크박스 선택하면 나머지 체크박스 전체 선택 or 해제
function selectAll(selectAll)  {
    const checkboxes = document.getElementsByName('category');
	checkboxes.forEach(function(checkbox){checkbox.checked = selectAll.checked;})
}
</script>
</head>
<body>
<h3>물품을 선택하면 금액이 자동 계산됩니다</h3>
<hr>
<form>
	<input type="checkbox" name = "selectall" onclick='selectAll(this)'>전체선택
    <input type="checkbox" name="category" value="10000"
        onclick="calc(this)">모자 1만원
    <input type="checkbox" name="category" value="30000"
        onclick="calc(this)">구두 3만원
    <input type="checkbox" name="category" value="80000"
        onclick="calc(this)">명품가방 8만원<br>
    지불하실 금액 <input type="text" id="sumtext" value="0" >
</form>
</body>
</html>
