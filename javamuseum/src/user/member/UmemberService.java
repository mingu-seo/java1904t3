package user.member;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import email.SendMail;
import manage.member.MemberVO;
import test.Test;

@Service
public class UmemberService extends Test {
	
	@Autowired
	UmemberDAO umemberDao;
	
	public boolean loginCheck(MemberVO param) throws SQLException {
		int cnt = umemberDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		MemberVO vo = umemberDao.getLoginSessionInfo(param);
		return vo;
	}
	
	public boolean idCheck(MemberVO param) throws SQLException {
		int cnt = umemberDao.idCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public MemberVO findId(MemberVO param) throws SQLException {
		MemberVO vo = umemberDao.findId(param);
		return vo;
	}
	
	public boolean pwCheck(MemberVO param) throws SQLException {
		param.setEmail(param.getEmail() + "@" + param.getEmail2());
		
		int cnt = umemberDao.pwCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public MemberVO findPw(MemberVO param) throws Exception {
		String tempPw = numberGen(12,1);
		param.setPassword(tempPw);
		String email = param.getEmail();
		
		SendMail.sendEmail("handrush@naver.com", email, "[JAVA MUSEUM] 임시비밀번호 발송", "임시비밀번호: " + tempPw);
		MemberVO vo = umemberDao.findPw(param);
		return vo;
	}
	
	public void tempPw(MemberVO vo) throws SQLException {
		umemberDao.tempPw(vo);
	}
	
	public boolean confirmPassword(MemberVO param) throws SQLException {
		int cnt = umemberDao.confirmPassword(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public int delete(int no) throws SQLException {
		return umemberDao.delete(no);
	}
}
