<%@page import="board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<% 
	Board b = (Board)request.getAttribute("board");
	Board prev = (Board)request.getAttribute("prev");
	Board next = (Board)request.getAttribute("next");
	int cPage = (int)request.getAttribute("cPage");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/board.css" />
	
	<h2>자유게시판</h2>
	<hr />
	
	<div id="boardViewDesc">
		<div><h4><%=b.getBoardNo() %>. <%=b.getTitle() %></h4></div>
		<hr />
		<div><span id="boardViewWriter"><%=b.getWriter() %></span> <br> <span id="boardViewRegDate"><%=b.getRegDate() %></span></div>
	</div>
	<div id="boardViewContent">
		<%=b.getContent() %>
		<br>
		<div>
			<input type="button" value="수정" id="boardViewBtnUpdate" onclick="location.href='<%=request.getContextPath()%>/board/boardUpdate?boardNo=<%=b.getBoardNo()%>&cPage=<%=cPage%>'"/>
			<input type="button" value="삭제" id="boardViewBtnDelete" onclick="deleteBoard();"/>
		</div>
		<form action="<%= request.getContextPath()%>/board/boardDelete" id = "boardDelFrm" method="post">
			<input type="hidden" name="no" value="<%= b.getBoardNo()%>"/>
		</form>
	</div>
	<div id="boardViewRe">
	리플영역
	</div>
	
	<div id="boardViewNav">
		<% if(prev.getBoardNo()!=0){ %>
		<div>
			<a href="<%= request.getContextPath()%>/board/boardView?no=<%=prev.getBoardNo()%>">[이전 게시글] <strong><%=prev.getTitle() %></strong></a>
		</div>
		<% } %>
		<% if(next.getBoardNo()!=0){ %>
		<div>
			<a href="<%= request.getContextPath()%>/board/boardView?no=<%=next.getBoardNo()%>">[다음 게시글] <strong><%=next.getTitle() %></strong>	x</a>
		</div>
		<% } %>
	</div>
	<img id="boardViewImg" src="<%=request.getContextPath() %>/images/List_icon.png" onclick="location.href='<%=request.getContextPath() %>/board/boardList?cPage=<%=cPage %>'" />
	
	<script>
		function deleteBoard(){
			if(confirm("정말 게시글을 삭제 하시겠습니까?")){
				$("#boardDelFrm").submit();
			}
		};
	</script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>