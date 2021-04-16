<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" />
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
  </head>
  <body>
    <header>
    
    	<ol>
	        <li>All</li>
	        <li>밥모임</li>
	        <li>클래스</li>
	        <li onclick="location.href='<%= request.getContextPath()%>/board/boardList'">자유게시판</li>
	        <li>공지사항</li>
	        <li>회원관리</li>
	        <li onclick="location.href='<%= request.getContextPath()%>/member/mypage'">마이페이지</li>
      	</ol>
    
    </header>

    <section>