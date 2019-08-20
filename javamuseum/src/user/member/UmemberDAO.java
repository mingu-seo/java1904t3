package user.member;

import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.member.MemberVO;

@Repository
public class UmemberDAO extends SqlMapClientDAOSupport {
	
	public int loginCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("umember.loginCheck", param);
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("umember.loginSessionInfo", param);
	}
	
	public int idCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("umember.idCheck", param);
	}
	
	public MemberVO findId(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("umember.findId", param);
	}
	
	public int pwCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("umember.pwCheck", param);
	}
	
	public MemberVO findPw(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("umember.findPw", param);
	}
	
	public void tempPw(MemberVO vo) throws SQLException {
		getSqlMapClient().update("umember.tempPw", vo);
	}
	
	public int confirmPassword(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("umember.confirmPassword", param);
	}
	
	public int delete(int no) throws SQLException {
		return (Integer) getSqlMapClient().delete("umember.delete", no);
	}
}
