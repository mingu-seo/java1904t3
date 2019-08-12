package user.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.qna.QnaService;
import board.qna.QnaVO;
import manage.member.MemberVO;
import manage.ticket.TicketVO;
import user.ticket.UTicketService;
import user.ticket.UTicketVO;
import util.Function;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	@Autowired
	private UTicketService uticketService;
	@Autowired
	private QnaService qnaService;

	@RequestMapping("/user/mypage/mypage")
	public String mypage(Model model, UTicketVO param, HttpServletRequest request) throws Exception {
		MemberVO member = (MemberVO)request.getSession().getAttribute("memberInfo");

		model.addAttribute("param", param);
		return "user/mypage/mypage";
	}

	@RequestMapping("/user/mypage/ticket")
	public String ticket(Model model, UTicketVO param, TicketVO tparam) throws Exception {
		ArrayList<UTicketVO> myResList = mypageService.myResList(param.getMember_pk());
		int[] resRowPageCount = mypageService.resCount(param);		//마이페이지 예매내역 페이징

		model.addAttribute("tparam", tparam);
		model.addAttribute("myResList", myResList);
		model.addAttribute("restotCount", resRowPageCount[0]);
		model.addAttribute("restotPage", resRowPageCount[1]);
		return "user/mypage/ticket";
	}


	@RequestMapping("/user/mypage/cancel") 
	public String ticketCancel(Model model, UTicketVO param) throws Exception { 
		uticketService.cancel(param);

		return "include/return"; 
	}
	
	@RequestMapping("/user/mypage/qna")
	public String qna(Model model, QnaVO param) throws Exception {
		ArrayList<QnaVO> qnaList = (ArrayList)qnaService.list(param);
		int[] qnaRowPageCount = qnaService.count(param);

		model.addAttribute("param", param);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnatotCount", qnaRowPageCount[0]);
		model.addAttribute("qnatotPage", qnaRowPageCount[1]);
		return "user/mypage/qna";
	}
	
	@RequestMapping("/user/mypage/qnaReply")
	public String qnaReply(Model model, QnaVO param) throws Exception {
		QnaVO data = (QnaVO)qnaService.read(param, false);
		
		model.addAttribute("data", data);
		return "user/mypage/qnaReply";
	}

	@RequestMapping("/user/mypage/qnaWrite")
	public String qnaWrite(Model model, QnaVO param) throws Exception {
		model.addAttribute("param", param);
		
		return "user/mypage/qnaWrite";
	}
	
	@RequestMapping("/user/mypage/qnaRead")
	public String readQna(Model model, QnaVO param) throws Exception {
		QnaVO data = (QnaVO)qnaService.read(param, false);
		
		model.addAttribute("data", data);
		return "user/mypage/qnaRead";
	}
	
	@RequestMapping("/user/mypage/process")
	public String process(Model model, QnaVO param, HttpServletRequest request) throws Exception {
		if ("qnaWrite".equals(param.getCmd())) {
			int r = qnaService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/user/mypage/mypage");
//		} else if ("edit".equals(param.getCmd())) {
//			int r = qnaService.update(param);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		} else if ("groupDelete".equals(param.getCmd())) {
//			int r = qnaService.groupDelete(param, request);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
//		} else if ("delete".equals(param.getCmd())) {
//			int r = qnaService.delete(param);
//			model.addAttribute("code", "alertMessageUrl");
//			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
//			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}else if ("reply".equals(param.getCmd())) {
			int r = qnaService.reply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 다변이 등록되었습니다.", "답변등록"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
} 