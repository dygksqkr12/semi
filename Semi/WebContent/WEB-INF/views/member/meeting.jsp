<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- css --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage.css" />

<h2>My page</h2>
<form id="memberUpdateFrm" method="post">
	<%-- 좌측 이동페이지 바 --%>
	<aside>
		<a href="<%=request.getContextPath()%>/member/mypage">MyPage</a> 
		<br />
		<a href="<%=request.getContextPath()%>/member/memberUpdate">개인정보 확인/수정</a> 
		<br /> 
		<a href="<%=request.getContextPath()%>/member/meeting">신청한 모임</a>
	</aside>
	
	<%-- 모임 전체보기 --%>
	<h4>신청한 모임</h4>
	<table>
		<tr>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'">사진</div>
			</td>
			<td><a href="<%=request.getContextPath()%>">제목</a>
				<div>내용</div></td>
		</tr>
		<tr>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'">사진</div>
			</td>
			<td><a href="<%=request.getContextPath()%>">제목</a>
				<div>내용</div></td>
		</tr>
		<tr>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'">사진</div>
			</td>
			<td><a href="<%=request.getContextPath()%>">제목</a>
				<div>내용</div></td>
		</tr>
		<tr>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'">사진</div>
			</td>
			<td><a href="<%=request.getContextPath()%>">제목</a>
				<div>내용</div></td>
		</tr>
	</table>
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>