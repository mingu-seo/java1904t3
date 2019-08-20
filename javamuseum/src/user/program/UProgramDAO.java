package user.program;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.jasper.tagplugins.jstl.core.Set;
import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.program.ProgramVO;
import manage.reservation.ReservationVO;

@Repository
public class UProgramDAO extends SqlMapClientDAOSupport {

	public int count(ProgramVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("uprogram.count", param);
	}
	
	public ArrayList list(ProgramVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("uprogram.list", param);
	}
	
	public ArrayList<HashMap> listOption(int program_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("uprogram.listOption", program_pk);
	}
	public ArrayList<HashMap> listOption_user(int program_pk) throws SQLException{
		return (ArrayList<HashMap>)getSqlMapClient().queryForList("uprogram.listOption_user", program_pk);
	}
	
	public ProgramVO detail(int no) throws SQLException {
		return (ProgramVO)getSqlMapClient().queryForObject("uprogram.detail", no);
	}

	public ArrayList<ProgramVO> list_time(ProgramVO param) throws SQLException {
		return (ArrayList<ProgramVO>)getSqlMapClient().queryForList("uprogram.list_time", param);
	}
	
	public int countMem(ReservationVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("uprogram.countMem", param);
	}

	
   public static void main(String[] args) throws SQLException {
	      UProgramDAO pd = new UProgramDAO();
	      ProgramVO av = new ProgramVO();
	      ReservationVO pv = new ReservationVO();
	      
//	      pd.list(av);
//	      pd.count(av);
//	     pd.detail(187);
//	     
//	      pd.list_time(av);

	      pv.setProgram_pk(189);
	      pv.setDate("2019-08-06");
	      pv.setTime(2);
	      pd.countMem(pv);
   }
}
