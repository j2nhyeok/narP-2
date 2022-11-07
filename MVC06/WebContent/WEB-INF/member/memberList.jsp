<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.bit.model.*"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"
	<%
	//ArrayList<MemberVO> list=(ArrayList<MemberVO>)request.getAttribute("list"); 
%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
	function deleteFn(num){
		location.href="memberDelete.do?num="+num;
	}
</script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
  <h2>회원관리 시스템</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
	 <form class="form-inline" action="" method="post">
	  <div class="form-group">
	    <label for="user_id">ID:</label>
	    <input type="text" class="form-control" id="user_id" name="user_id">
	  </div>
	  <div class="form-group">
	    <label for="pwd">Password:</label>
	    <input type="password" class="form-control" id="password" name="password">
	  </div>
	  <button type="submit" class="btn btn-default">로그인</button>
	 </form>
    </div>
    <div class="panel-body">
		<div class="table-responsive">          
		  <table class="table">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>Firstname</th>
		        <th>Lastname</th>
		        <th>Age</th>
		        <th>City</th>
		        <th>Country</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>1</td>
		        <td>Anna</td>
		        <td>Pitt</td>
		        <td>35</td>
		        <td>New York</td>
		        <td>USA</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
    </div>
  </div>
</div>
	<table border='1'>
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>나이</td>  
				<td>이메일</td>
				<td>전화번호</td>
				<td>삭제</td>
			</tr> 
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.num }</td>
					<td><a href="memberContent.do?num=${vo.num }">${vo.id}</a></td>
					<td>${vo.pass}</td>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>${vo.email}</td>
					<td>${vo.phone}</td>
					<td><input type="button" value="삭제" onclick="deleteFn(${vo.num })" ></td>
				</tr>
			</c:forEach>
		<tr>
			<td colspan='8' align='right'><input type="button" value="회원가입" onclick="location.href='${ctx}/memberRegister.do'"/> </a></td>
		</tr>
	</table>

</body>
</html>