package user.exhibition;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.member.MemberService;
import manage.member.MemberVO;
import manage.review.ReviewService;
import manage.review.ReviewVO;

@Controller
public class UExhibitionController {

	@Autowired
	private UExhibitionService uexhibitionService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/user/exhibition/subExhibition1")
	public String index(Model model, UExhibitionVO param, ReviewVO review) throws Exception {
		int[] rowPageCount = uexhibitionService.count(param);
		ArrayList<UExhibitionVO> ingList = uexhibitionService.ingList(param);
		ArrayList<ReviewVO> reviewList = reviewService.list(review);
		
		model.addAttribute("rList", reviewList);
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("param", param);
		model.addAttribute("ingList", ingList);
		
		return "user/exhibition/subExhibition1";
	}
	
	@RequestMapping("/user/exhibition/ticket")
	public String ticket(Model model, UExhibitionVO param,HttpServletRequest req) throws Exception {
		UExhibitionVO ticket = uexhibitionService.display(param.getNo());
		MemberVO member1 = (MemberVO)req.getSession().getAttribute("memberInfo");
		MemberVO member = memberService.read(member1.getNo());
		
		model.addAttribute("member", member);
		model.addAttribute("ticket", ticket);
		return "user/exhibition/ticket";
	}
	
	@RequestMapping("/user/exhibition/detail")
	public String detail(Model model, UExhibitionVO param) throws Exception {
		UExhibitionVO detail = uexhibitionService.display(param.getNo());
		
		model.addAttribute("detail", detail);
		return "user/exhibition/detail";
	}
	
	@RequestMapping("/user/exhibition/subExhibition2")
	public String index2(Model model, UExhibitionVO param) throws Exception {
		ArrayList<UExhibitionVO> edList = uexhibitionService.edList(param);
		
		model.addAttribute("param", param);
		model.addAttribute("edList", edList);
		if(param.getStartdate() != null) {
			return "user/exhibition/pastExhibition2";
		} else {
			return "user/exhibition/subExhibition2";
		}
	}
	
	@RequestMapping("/user/exhibition/pastDetail")
	public String pastDetail(Model model, UExhibitionVO param) throws Exception {
		UExhibitionVO detail = uexhibitionService.pastReview(param.getNo());
		
		model.addAttribute("detail", detail);
		return "user/exhibition/pastDetail";
	}
}
