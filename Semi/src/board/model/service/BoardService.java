package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.model.dao.BoardDao;
import board.model.vo.Board;

public class BoardService {
	BoardDao boardDao = new BoardDao();
	
	//boardListServlet 에서 사용되는 페이지당 필요한 list불러오는 메서드
	public List<Board> selectBoardList(int start, int end) {
		List<Board> list = null;
		Connection conn = getConnection();
		try {
			list = boardDao.selectBoardList(conn, start, end);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return list;
	}

	//boardListServlet에서 사용되는 총 자유게시판 글수를 불러오는 메서드
	public int selectBoardTotal() {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.selectBoardTotal(conn);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	//boardEnrollServlet에서 사용되는 게시글 추가 메서드
	public int insertBoard(Board b) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.insertBoard(conn,b);
			if(result>0) {
				commit(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	//게시글 번호로 해당 게시글에 댓글이 몇개가 있는지 조회하는 메서드
	public int selectCommentCnt(int boardNo) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.selectCommentCnt(conn, boardNo);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	//board객체 하나를 조회하는 메서드
	public Board selectBoardOne(int boardNo) {
		Board board = null;
		Connection conn = getConnection();
		try {
			board = boardDao.selectBoardOne(conn, boardNo);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return board;
	}

	//boardView next,prev를 위한 boardNumList가져오기
	public List<Integer> selectBoardNumList() {
		List<Integer> list = null;
		Connection conn = getConnection();
		try {
			list = boardDao.selectBoardNumList(conn);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return list;
	}

	//boardUpdate에서 업데이트 실행
	public int updateBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.updateBoard(conn,board);
			if(result>0) {
				commit(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	//boardDelete에서 게시물 삭제
	public int deleteBoard(int boardNo) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.deleteBoard(conn,boardNo);
			if(result>0) {
				commit(conn);
			}
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

}
