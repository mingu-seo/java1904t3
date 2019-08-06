package board.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import util.Function;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@RequestMapping("/manage/board/qna/index")
	public String index(Model model, QnaVO param) throws Exception {
		param.setTablename("qna");
		int[] rowPageCount = qnaService.count(param);
		ArrayList<AdminVO> list = qnaService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/qna/index";
	}
	
	@RequestMapping("/manage/board/qna/read")
	public String read(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/board/qna/read";
	}
	
	
	
	@RequestMapping("/manage/board/qna/write")
	public String write(Model model, QnaVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write";
	}
	
	@RequestMapping("/manage/board/qna/edit")
	public String edit(Model model, QnaVO param) throws Exception {
		param.setTablename("qna");
		QnaVO data = qnaService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna/edit";
	}
	
	@RequestMapping("/manage/board/qna/reply.do")
	public String reply(Model model, QnaVO param) throws Exception {
		QnaVO data = qnaService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna/reply";
	}
	
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/board/qna/process.do")
	public String process(Model model, QnaVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("qna");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = qnaService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = qnaService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = qnaService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = qnaService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}else if ("reply".equals(param.getCmd())) {
			int r = qnaService.reply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 다변이 등록되었습니다.", "답변등록"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		return "include/alert";
	}
}
