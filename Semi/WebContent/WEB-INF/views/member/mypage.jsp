<%@page import="member.model.service.MemberService"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 헤더 --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- css --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage.css" />
<%-- 멤버 임의값 --%>
<%
	Member loginMember = new Member("admin2", "1234", "관리자", "ㅇㅇㅇㅇ@.com", "01011111111", "T", "F",
		new Date(Calendar.getInstance().getTimeInMillis()), MemberService.ADMIN_ROLE);
%>

<h2 class="Mp">My page</h2>

<form id="memberUpdateFrm" method="post">
	<%-- 좌측 이동페이지 바 --%>
	<aside>
		<br />
		<a class="a" href="<%=request.getContextPath()%>/member/mypage">내 정보</a> 
		<br />
		<br />
		<a class="a" href="<%=request.getContextPath()%>/member/memberUpdate">개인정보 수정</a> 
		<br />
		<br /> 
		<%-- 
		<a class="a" href="<%=request.getContextPath()%>/member/meeting">신청한	모임</a>
		--%>
	</aside>
	
	<%-- 정보보기 --%>
	<h3 class="me">기본정보</h3>
	<table class="my">
		<tr>
			<th>아이디</th>
			<td><%=loginMember.getMemberId()%></td>
		</tr>

		<tr>
			<th>이름</th>
			<td><%=loginMember.getName()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=loginMember.getEmail()%></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><%=loginMember.getPhone()%></td>
		</tr>
		<tr>
			<td colspan="2"><label for="event1">이벤트 할인
					혜택 알림 수신에 동의합니다.(선택)</label> <input type="checkbox" name="event1"
				id="event1" value="T" disabled
				<%=loginMember.getEvent1().equals("T") ? "checked" : ""%> /></td>
		</tr>
		<tr>
			<td colspan="2"><label for="event2">장기 미접속 시
					계정 활성 상태 유지합니다.(선택)</label> <input type="checkbox" name="event2"
				id="event2" value="F" disabled
				<%=loginMember.getEvent2().equals("T") ? "checked" : ""%> /></td>
		</tr>
	</table>
	<input type="button"
		onclick="location.href='<%=request.getContextPath()%>/member/memberUpdate'"
		value="정보수정" 
		class="btn"/>
	
	<%-- 모임 간편보기 --%>
	<h3 class="mtm">나의모임</h3>
	<%-- 
	<a class="a2" href="<%=request.getContextPath()%>/member/meeting">더보기</a>
	--%>
	<table class="meet">
		<tr>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'"><img src="<%= request.getContextPath() %>/images/kh.jpg" id="kh" /></div>
			</td>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'"><img src="<%= request.getContextPath() %>/images/남산.jpg" id="nam" /></div>
			</td>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'"><img src="<%= request.getContextPath() %>/images/볼링.jpg" id="ball" /></div>
			</td>
			<td>
				<div class="box" onclick="location.href='<%=request.getContextPath() %>'"><img src="<%= request.getContextPath() %>/images/술.jpg" id="drink" /></div>
			</td>
		</tr>
		<tr>
			<td><a href="<%=request.getContextPath()%>">등원하실 분 모집!!</a>
				<div>내용</div></td>
			<td><a href="<%=request.getContextPath()%>">남산타워 모임!!</a>
				<div>내용</div></td>
			<td><a href="<%=request.getContextPath()%>">볼링치실분~~</a>
				<div>내용</div></td>
			<td><a href="<%=request.getContextPath()%>">간술하실분~!</a>
				<div>내용</div></td>
		</tr>
	</table>
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
