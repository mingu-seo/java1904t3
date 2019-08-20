package user.mypage;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.program.ProgramDAO;
import manage.program.ProgramVO;
import manage.reservation.ReservationVO;
import user.ticket.UTicketVO;

@Repository
public class MypageDAO extends SqlMapClientDAOSupport{

	public ArrayList myResList(int member_pk) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("mypage.myResList", member_pk);
	}

	public int resCount(UTicketVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("mypage.resCount", param);
	}
	
	public ArrayList myProList(int param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("mypage.myProList", param);
	}
	
	public static void main(String[] args) throws SQLException {
	      MypageDAO pd = new MypageDAO();
	      
	      pd.myProList(1);
	}     
	
}