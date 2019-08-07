package user.program;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.program.ProgramVO;
import manage.reservation.ReservationVO;

@Controller
public class UProgramController {

	@Autowired
	private UProgramService uprogramService;
	
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
	

}
