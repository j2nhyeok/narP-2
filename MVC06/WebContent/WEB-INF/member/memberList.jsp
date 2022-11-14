<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.bit.model.*"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			<c:if test="${!empty msg}">
				alert("${msg}");
				<c:remove var="msg" scope="session"/>
			</c:if>
		});
		function deleteFn(num){
			location.href="${ctx}/memberDelete.do?num="+num;
		}
		
		function check(){
			if($('#user_id').val()==''){
				alert("아이디를 입력하세요");
				return false;
			}
			if($('#password').val()==''){
				alert("비밀번호를 입력하세요");
				return false;
			}
			return true;			
		}
	</script>
</head>
<body>
	<div class="container">
  <h2>회원관리 시스템</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
	 <form class="form-inline" action="${ctx}/memberLogin.do" method="post">
	  <div class="form-group">
	    <label for="user_id">ID:</label>
	    <input type="text" class="form-control" id="user_id" name="user_id">
	  </div>
	  <div class="form-group">
	    <label for="pwd">Password:</label>
	    <input type="password" class="form-control" id="password" name="password">
	  </div>
	  <button type="submit" class="btn btn-default" onclick="return check()">로그인</button>
	 </form>
	 </c:if>
	 <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
		 ${sessionScope.userName}님. 환영합니다:)
		 <button type="button" class="btn btn-warning">로그아웃</button>
	</c:if>
    </div>
    <div class="panel-body">
		<div class="table-responsive">          
		  <table class="table table-hover">
		    <thead>
		      <tr>
		    	    <th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>나이</th>  
					<th>이메일</th>
					<th>전화번호</th>
					<th>삭제</th>
		      </tr>
		    </thead>
		    <tbody>
			   <c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.num }</td>
						<td><a href="${ctx}/memberContent.do?num=${vo.num }">${vo.id}</a></td>
						<td>${vo.pass}</td>
						<td>${vo.name}</td>
						<td>${vo.age}</td>
						<td>${vo.email}</td>
						<td>${vo.phone}</td>
						
						<c:if test="${sessionScope.userId==vo.id }">
						<td><input type="button" value="삭제" onclick="deleteFn(${vo.num })"  ></td>
						</c:if>
						<c:if test="${sessionScope.userId!=vo.id }">
						<td><input type="button" value="삭제" onclick="deleteFn(${vo.num })" disabled="disabled" ></td>
						</c:if>
					</tr>
				</c:forEach>
				<tr>
					<td colspan='8' align='right'><input type="button" value="회원가입" onclick="location.href='${ctx}/memberRegister.do'"/> </a></td>
				</tr>
		    </tbody>
		  </table>
		</div>
    </div>
    <div class="panel-footer">
    	회원관리 ERP System(admin@bit.com)
    </div>  
  </div>
</div>
</body>
</html>