package manage.review;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import manage.exhibition.ExhibitionDAO;
import manage.exhibition.ExhibitionVO;
import property.SiteProperty;
import util.CodeUtil;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private ExhibitionDAO exhibitionDao;
	
	public int[] count(ReviewVO param) throws SQLException {
		int rowCount = reviewDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(ReviewVO param) throws SQLException {
		ArrayList list = reviewDao.list(param);
		return list;
	}

	public int insert(ReviewVO vo, HttpServletRequest request) throws SQLException {
		ExhibitionVO data = exhibitionDao.read(vo.getDisplay_pk());		//작품 평점을 위해 전시 VO를 가져온다.
		int count = reviewDao.reviewCount(vo.getDisplay_pk());
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			try {
				fu.upload(file, SiteProperty.REVIEW_UPLOAD_PATH, SiteProperty.REAL_PATH, "review");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setImagename(fu.getName());
		}
		
		int no = reviewDao.insert(vo);
		
		// 리뷰 작성시 평점 부여
		double score = data.getScore();									// 해당 작품 점수를 가져온다.
		data.setScore(Math.round((((score * count) + vo.getReview_score()) / (count+1))*10)/10.0);
		exhibitionDao.reviewScore(data);
		
		
		return no;
	}

	public int update(ReviewVO vo, HttpServletRequest request) throws SQLException {
		ReviewVO data = reviewDao.read(vo);
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("imagename_tmp");
		if (!file.isEmpty()) {
			try {
				fu.upload(file, SiteProperty.REVIEW_UPLOAD_PATH, SiteProperty.REAL_PATH, "review");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setImagename(fu.getName());
		}
		int r = (Integer)reviewDao.update(vo);
		if(r > 0) {
			if("1".equals(vo.getImagename_chk()) || !"".equals(Function.checkNull(vo.getImagename()))) {
				Function.fileDelete(vo.getUploadPath(), data.getImagename());
			}
		}
		return r;
	}

	public int delete(int no) throws SQLException {
		int cnt = reviewDao.delete(no);
		return cnt;
	}

	public ReviewVO read(ReviewVO vo, boolean userCon) throws SQLException {
		ReviewVO data = reviewDao.read(vo);
		if (userCon) {	// 사용자쪽 조회시만 update
			reviewDao.updateReadno(vo);
		}
		return data;
	}

	public ArrayList displayReview(int display_pk) throws Exception {
		ArrayList list = reviewDao.displayReview(display_pk);
		
		return list;
	}
	
//	public boolean loginCheck(ReviewVO param) throws SQLException {
//		int cnt = reviewDao.loginCheck(param);
//		boolean result = false;
//		if (cnt == 1) {
//			result = true;
//		}
//		return result;
//	}
//
//	public ReviewVO getLoginSessionInfo(ReviewVO param) throws SQLException {
//		ReviewVO vo = reviewDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}
//
//	public int[] countLoginHistory(ReviewVO param) throws SQLException {
//		int rowCount = reviewDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(ReviewVO param) throws SQLException {
//		ArrayList list = reviewDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(ReviewVO param) throws SQLException {
//		reviewDao.insertLoginHistory(param);
//	}

	public int idcheck(ReviewVO param) throws SQLException {
		return reviewDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += reviewDao.delete(nos);
		}
		return r;
	}
	
}