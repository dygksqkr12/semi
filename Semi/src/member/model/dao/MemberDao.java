package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import board.model.dao.BoardDao;
import member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		
		String fileName = BoardDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember");

		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEvent1());
			pstmt.setString(5, member.getEvent2());
			pstmt.setString(6, member.getMemberId());
			// 쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML은 executeUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member selectOne(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectOne");

		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			// 미완성 쿼리문 값대입
			pstmt.setString(1, memberId);
			// 쿼리문실행
			rset = pstmt.executeQuery();

			if (rset.next()) {
				member = new Member();
				member.setMemberId(rset.getString("MEMBER_ID"));
				member.setPassword(rset.getString("PASSWORD"));
				member.setName(rset.getString("NAME"));
				member.setMemberRole(rset.getString("MEMBER_ROLE"));
				member.setEvent1(rset.getString("EVENT1"));
				member.setEmail(rset.getString("EMAIL"));
				member.setPhone(rset.getString("PHONE"));
				member.setEvent2(rset.getString("EVENT2"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updatePassword(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updatePassword");
		// updatePassword = update member set password = ? where member_id = ?
		
		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			// 쿼리문미완성
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMemberId());

			// 쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML은 executeUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteMember");

		try {
			// 미완성쿼리문을 가지고 객체생성.
			pstmt = conn.prepareStatement(query);
			// 쿼리문미완성
			pstmt.setString(1, memberId);

			// 쿼리문실행 : 완성된 쿼리를 가지고 있는 pstmt실행(파라미터 없음)
			// DML은 executeUpdate()
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}
