package manage.review;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import db.SqlMapClientDAOSupport;
import manage.review.ReviewVO;

@Repository
public class ReviewDAO extends SqlMapClientDAOSupport {

	public int count(ReviewVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("review.count", param);
	}
	
	
	public ArrayList list(ReviewVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.list", param);
	}

	public int insert(ReviewVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("review.insert", vo);
	}

	public int update(ReviewVO vo) throws SQLException {
		return getSqlMapClient().update("review.update", vo);
	}

	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("review.delete", no);
	}

	public ReviewVO read(ReviewVO vo) throws SQLException {
		return (ReviewVO)getSqlMapClient().queryForObject("review.read", vo);
	}
	
	public int updateReadno(ReviewVO vo) throws SQLException {
		return getSqlMapClient().update("review.updateReadno", vo);
	}


	public int loginCheck(ReviewVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("review.loginCheck", param);
	}
	
	public int idcheck(ReviewVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("review.idcheck", param);
	}

	public ReviewVO getLoginSessionInfo(ReviewVO param) throws SQLException {
		return (ReviewVO) getSqlMapClient().queryForObject("review.loginSessionInfo", param);
	}

	public int countLoginHistory(ReviewVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("review.countLoginHistory", param);
	}

	public ArrayList listLoginHistory(ReviewVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.listLoginHistory", param);
	}
	
	public int reviewCount(int display_pk) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("review.reviewCount", display_pk);
	}

	public void insertLoginHistory(ReviewVO param) throws SQLException {
		getSqlMapClient().insert("review.insertLoginHistory", param);
	}

	public ArrayList displayReview(int display_pk) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.displayReview", display_pk);
	}
	
//	public static void main(String[] args) throws Exception {
//		ReviewDAO ad = new ReviewDAO();
//		ReviewVO av = new ReviewVO(10);
//		av.setId("test");
//		int a = ad.idcheck(av);
//		System.out.println(a);
//	}
}
