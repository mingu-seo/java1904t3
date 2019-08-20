package user.program;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.program.ProgramVO;
import manage.reservation.ReservationService;
import manage.reservation.ReservationVO;
import user.exhibition.UExhibitionVO;
import util.Function;

@Controller
public class UProgramController {

	@Autowired
	private UProgramService uprogramService;
	
	@Autowired
	private ReservationService reservationService;
	
	
	@RequestMapping("/user/program/program")
	public String index(Model model, ProgramVO param, ReservationVO vo) throws Exception {
		int[] rowPageCount = uprogramService.count(param);
		ArrayList<ProgramVO> list = uprogramService.list(param);
		ArrayList<ArrayList<HashMap>> olist = new ArrayList<ArrayList<HashMap>>();

		for (int i=0; i<list.size(); i++) {
		ArrayList<HashMap> ohmlist = uprogramService.listOption(list.get(i).getNo());
		ArrayList<HashMap> optlist = new ArrayList<HashMap>();
		System.out.println(ohmlist.size());
			for (int j=0; j<ohmlist.size(); j++) {
				System.out.println(ohmlist.get(j).get("no"));
				optlist.add(ohmlist.get(j));
			}
			olist.add(optlist);
		}	
			  
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		
		model.addAttribute("olist", olist);
		
		return "user/program/program";
	}
	

	@RequestMapping("/user/program/program_membCount")
	public String MembCount(Model model, ReservationVO vo) throws Exception {
		int countMem = uprogramService.countMem(vo);
		
		model.addAttribute("vo", vo);
		
		return "user/program/program_membCount";
	}

	

	@RequestMapping("/user/program/programTime")
	public String ProgramDate(Model model, ProgramVO param, HttpServletRequest request) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String date = request.getParameter("date");
		ArrayList<ProgramVO> olist = uprogramService.list_time(param);
		
		
		model.addAttribute("olist", olist);
		
		return "user/program/programTime";
	}
	
	
	@RequestMapping("/user/program/detail")
	public String detail(Model model, ProgramVO param) throws Exception {
		ProgramVO detail = (ProgramVO)uprogramService.detail(param.getNo());
		
		model.addAttribute("detail", detail);
		return "user/program/detail";
	}
	
	@RequestMapping("/user/program/reserve")
	public String ticket(Model model, ProgramVO param) throws Exception {
		ProgramVO reserve = (ProgramVO)uprogramService.detail(param.getNo());
		ArrayList<HashMap> olist = uprogramService.listOption_user(param.getNo());
		ArrayList<HashMap> list = uprogramService.listOption(param.getNo());
		
		model.addAttribute("olist", olist);
		model.addAttribute("list", list);
		model.addAttribute("reserve", reserve);
		return "user/program/reserve";
	}
	
	   @RequestMapping("/user/program/process")
	   public String process(Model model, ReservationVO param,  HttpServletRequest request) throws Exception {
	      model.addAttribute("vo", param);
	      
	          int r = reservationService.insert(param);
	          model.addAttribute("code", "alertMessageUrl");
	          model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
	          model.addAttribute("url", param.getTargetURLParam("program", param, 0));
	      
	      return "include/alert";
	   }


}
