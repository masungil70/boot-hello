<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="<c:url value='/common.js'/>"></script>
<body>
	<form action="add" method="post">
		A : <input id="a" name="a" type="number" placeholder="정수입력해주세요" required="required"><br/> 
		B : <input id="b" name="b" type="number" placeholder="정수입력해주세요" required="required"><br/>
		result : <span id="result"></span><br/>
		
		A : <span id="result_a"></span><br/> 
		B : <span id="result_b"></span><br/>
		A : <span id="result_a2"></span><br/> 
		B : <span id="result_b2"></span><br/>
		
		<input type="submit" value="계산"> 
		<input type="button" id="jsonCalc" value="JSON계산"> 
	</form>
<script type="text/javascript">
const jsonCalc = document.querySelector("#jsonCalc");
jsonCalc.addEventListener("click", e => {
	e.preventDefault();
	const a = document.getElementById("a");
	const b = document.getElementById("b");
	const result = document.getElementById("result");
	const result_a = document.getElementById("result_a");
	const result_b = document.getElementById("result_b");
	
	myFetch("jsonCalc", {a:a.value, b:b.value}, json => {
		if (json.status == 0) {
			result.innerText = json.result;
			result_a.innerText = json.a;
			result_b.innerText = json.b;
		} else {
			alert(json.statusMessage);
		}
	});
});

const a = document.querySelector("#a");
a.addEventListener("keyup", e => {
	const result_a2 = document.getElementById("result_a2");
	result_a2.innerText = a.value;
});


</script>	
</body>
</html>