package user.program;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import manage.program.ProgramVO;

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
	
	public ProgramVO detail(int no) throws SQLException {
		return (ProgramVO)getSqlMapClient().queryForObject("uprogram.detail", no);
	}
	
   public static void main(String[] args) throws SQLException {
	      UProgramDAO pd = new UProgramDAO();
	      ProgramVO av = new ProgramVO();
	      
//	      pd.list(av);
//	      pd.count(av);
	     
	      pd.detail(190);
	      
   }
}
