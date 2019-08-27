package user.program;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.program.ProgramVO;
import manage.reservation.ReservationVO;
import util.Page;

@Service
public class UProgramService {

	@Autowired
	private UProgramDAO uprogramDao;

	public int[] count(ProgramVO vo) throws Exception {
		int rowCount = uprogramDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public int countMem(ReservationVO vo) throws Exception {
		int countMem = uprogramDao.countMem(vo);
		return countMem;
	}
		

	public ArrayList list(ProgramVO vo) throws Exception {
		ArrayList list = uprogramDao.list(vo);
		
		return list;
	}
	
	public ArrayList<HashMap> listOption(int program_pk) throws Exception {
	      ArrayList<HashMap> list = uprogramDao.listOption(program_pk);
	      
	      return list;
   }
	
	public ArrayList<HashMap> listOption_user(int program_pk) throws Exception {
	      ArrayList<HashMap> list = uprogramDao.listOption_user(program_pk);
	      
	      return list;
 }
	
	public ArrayList list_time(ProgramVO vo) throws Exception {
		ArrayList list = uprogramDao.list_time(vo);
		
		return list;
	}
	
	public ProgramVO detail(int no) throws Exception {
		ProgramVO list = uprogramDao.detail(no);
		
		return list;
	}

	public int resnum(ReservationVO vo) throws Exception {
		int countMem = uprogramDao.resnum(vo);
		return countMem;
	}
	
}
