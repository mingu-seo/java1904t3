package user.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.member.MemberService;
import manage.member.MemberVO;
import manage.member.PointVO;
import manage.rental.RentalVO;
import property.SiteProperty;
import util.Function;

@Controller
public class UmemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private UmemberService umemberService;
	
	@RequestMapping("/user/membership")
	public String membership(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "user/member/membership";
	}
	
	@RequestMapping("/user/member/sendcernum")
	public String userProcess(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		String cerNum = memberService.cerNum(param);
		
		model.addAttribute("value", cerNum);
		
		return "include/return";
	}
	
	@RequestMapping("/user/member/process")
	public String userprocess(Model model, MemberVO param, HttpServletRequest request, PointVO pntparam) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			param.setEmail(param.getEmail() + "@" + param.getEmail2());
			param.setTel(param.getfTel() + "-" + param.getmTel() + "-" + param.geteTel());
			param.setBirthday(param.getYear() + "-" + param.getMonth() + "-" + param.getDay());
			int r = memberService.insert(param);
			pntparam.setMember_pk(r);
			pntparam.setAccum(1000);
			pntparam.setMemo("회원가입 적립금");
			pntparam.setState(0);
			int p = memberService.pointinsert(pntparam);
			model.addAttribute(p);
			memberService.pointupdate(pntparam);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/user");
		} 
		return "include/alert";
	}
	
	@RequestMapping("/user/idfind")
	public String idfind(Model model, MemberVO vo) throws Exception {
		return "user/member/idfind";
	}
	
	@RequestMapping("/user/searchId")
	public String searchId(MemberVO vo, Model model) throws Exception {
		if (umemberService.idCheck(vo)) {
			MemberVO data = umemberService.findId(vo);
			model.addAttribute("data", data);
			return "user/member/searchId";
		} else {
			model.addAttribute("code", "alertMessagePopUpClose");
			model.addAttribute("message", "동일한 조건의 계정이 없습니다.");
			return "include/alert";
		}
	}

}