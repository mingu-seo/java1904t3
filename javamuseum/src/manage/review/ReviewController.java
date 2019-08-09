package manage.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.exhibition.ExhibitionService;
import manage.exhibition.ExhibitionVO;
import manage.ticket.TicketVO;
import util.Function;


@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ExhibitionService exhibitionService;

	
	@RequestMapping("/manage/review/index")
	public String index(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<ReviewVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/review/index";
	}
	
	@RequestMapping("/manage/review/read")
	public String read(Model model, ReviewVO param) throws Exception {
		ReviewVO data = reviewService.read(param.getNo(), false);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/review/read";
	}
	
	@RequestMapping("/manage/review/write")
	public String write(Model model, ReviewVO param, ExhibitionVO dparam) throws Exception {
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(dparam);
		model.addAttribute("vo", param);
		model.addAttribute("list", list);
		return "manage/review/write";
	}
	
	@RequestMapping("/manage/review/idcheck")
	public String idcheck(Model model, ReviewVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = reviewService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	@RequestMapping("/manage/program/reservation/searchMemb")
	public String search(Model model, TicketVO param) throws Exception {
		return "manage/program/reservation/searchMemb";
	}

	@RequestMapping("/manage/review/process")
	public String process(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = reviewService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reviewService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = reviewService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reviewService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}

	
	
	@RequestMapping("/user/review/review")
	public String review(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<ReviewVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		
		return "/user/review/review";
	}
	
	
	@RequestMapping("/user/review/index")
	public String userindex(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<ReviewVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		
		return "/user/review/index";
	}
	
	@RequestMapping("/user/review/read")
	public String userread(Model model, ReviewVO param) throws Exception {
		ReviewVO data = reviewService.read(param.getNo(), false);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		
		return "/user/review/read";
	}
	
	@RequestMapping("/user/review/write")
	public String userwrite(Model model, ReviewVO param, ExhibitionVO dparam) throws Exception {
		
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(dparam);
		model.addAttribute("vo", param);
		model.addAttribute("list", list);
		
		return "user/review/write";
	}
	
	@RequestMapping("/user/review/edit")
	public String uesredit(Model model, ReviewVO param, ExhibitionVO dparam) throws Exception {
		param.setTablename("review");
		ReviewVO data = reviewService.read(param.getNo(), false);
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(dparam);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		model.addAttribute("list", list);
		
		return "user/review/edit";
	}
	
	@RequestMapping("/user/review/process")
	public String userprocess(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = reviewService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reviewService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}  else if ("delete".equals(param.getCmd())) {
			int r = reviewService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
	
	
	
}
