package user;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import manage.exhibition.ExhibitionService;
import manage.exhibition.ExhibitionVO;
import manage.member.MemberVO;
import property.SiteProperty;
import user.member.UmemberService;

@Controller
public class UserMainController {
	@Autowired
	private UmemberService umemberService;
	@Autowired
	private ExhibitionService exhibitionService;
	
	// 메인페이지 구경용
	@RequestMapping("/user/index")
	public String main(Model model, ExhibitionVO param) throws Exception {
		ArrayList<ExhibitionVO> list = exhibitionService.ingList(param);
		
		model.addAttribute("list", list);
		return "/user/index";
	}
	
	@RequestMapping("/user")
	public String main2(Model model) throws Exception {
		return "/user/member/login";
	}

	@RequestMapping("/user/login")
	private String login(Model model, @RequestParam(value = "login_url", required = false) String login_url,
			@RequestParam(value = "login_param", required = false) String login_param, MemberVO vo, HttpSession session)
			throws Exception {
		if (umemberService.loginCheck(vo)) {
			MemberVO memberInfo = umemberService.getLoginSessionInfo(vo);
			session.setAttribute("memberInfo", memberInfo);
			String redirectUrl = SiteProperty.UserINDEX_PAGE;
			String pw = memberInfo.getPassword();
			System.out.println(pw);
			// 로그인 이전페이지 존재하는 경우
			if (login_url != null && !"".equals(login_url)) {
				redirectUrl = login_url;

				if (login_param != null && !"".equals(login_param)) {
					redirectUrl = redirectUrl + "?" + login_param;
				}
			}
			return "redirect:" + redirectUrl;
		} else {
			model.addAttribute("code", "alertMessageBack");
			model.addAttribute("message", "아이디, 비밀번호가 올바르지 않습니다.");
			return "include/alert";
		}
	}
	
	@RequestMapping("/user/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("url", "/user/index");
		
		return "include/alert";
	}
	
	@RequestMapping("/user/visit/visit1")
	public String visit1(Model model) throws Exception {
		return "user/visit/visit1";
	}
	
	@RequestMapping("/user/visit/visit2")
	public String visit2(Model model) throws Exception {
		return "user/visit/visit2";
	}
	
	@RequestMapping("/user/visit/visit3")
	public String visit3(Model model) throws Exception {
		return "user/visit/visit3";
	}
	
	@RequestMapping("/user/test")
	public String test(Model model) {
		return "/user/mypage/test";
	}
}
