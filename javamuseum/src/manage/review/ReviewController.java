package manage.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.ticket.TicketVO;
import util.Function;


@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/manage/review/index")
	public String index(Model model, ReviewVO param) throws Exception {
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
		ReviewVO data = reviewService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/review/read";
	}
	
	@RequestMapping("/manage/review/edit")
	public String edit(Model model, ReviewVO param) throws Exception {
		ReviewVO data = reviewService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/review/edit";
	}
	
	@RequestMapping("/manage/review/write")
	public String write(Model model, ReviewVO param) throws Exception {
		model.addAttribute("vo", param);
		
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
			int r = reviewService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = reviewService.update(param);
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
	
}
