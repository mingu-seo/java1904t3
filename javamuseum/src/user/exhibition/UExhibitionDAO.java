package user.exhibition;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.exhibition.ExhibitionVO;

@Repository
public class UExhibitionDAO extends SqlMapClientDAOSupport{

	public ArrayList ingList(UExhibitionVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("uexhibition.intList", param);
	}
	
	public int count(UExhibitionVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("uexhibition.count", param);
	}
	
	public UExhibitionVO ticket(int no) throws SQLException {
		return (UExhibitionVO)getSqlMapClient().queryForObject("uexhibition.ticket", no);
	}
}
