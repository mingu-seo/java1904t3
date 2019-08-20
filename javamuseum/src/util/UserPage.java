package util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class UserPage {
	
	public static String indexList(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 10;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}
		strList.append("<div class=\"number-box clear\">");
		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<div class=\"img-box\"><a href='"+listUrl+"reqPageNo="+curpage+"'><img src='/img/news1-prev.png' alt='' /></a></div> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
			  strList.append("<div class=\"number\"><a href='#;' class='cur'>"+reqPageNo+"</a></div>");
			} else {
			  strList.append("<div class=\"number\"><a href='"+listUrl+"reqPageNo="+curpage+"'>"+curpage+"</a></div>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1;  
			strList.append(" <div class=\"img-box\"><a href='"+listUrl+"reqPageNo="+curpage+"'><img src='/img/news1-next.png' alt='' /></a></div>");
		}else{
			strList.append(" ");
		}
		strList.append("</div> ");

		return strList.toString();
	}

	/**
	 *  페이징처리를위한 현재 페이지 URL + 파라미터 구하는 메서드
	 *  reqPageNo 제외
	 * @param request HttpServletRequest
	 * @return String 
	 */
	public static String getPageURL(HttpServletRequest request) {
		 
//		String originalURL = request.getRequestURI(); 
		String originalURL = (String)request.getAttribute("javax.servlet.forward.request_uri");
		  
		Enumeration param = request.getParameterNames();	// request
		String paramName = "";								// 파라미터 네임값
		String paramValue = "";								// 파라미터 밸류값
		String strParam = "";								// 파라미터 문자열
		String listUrl = "";								// url + 파라미터
		StringBuffer strList= new StringBuffer();			// 리턴될 페이지 인덱스 리스트
		
		while(param.hasMoreElements()) {
			paramName = (String)param.nextElement();
			paramValue = request.getParameter(paramName);
			if (!"reqPageNo".equals(paramName)) {
				strParam = paramName + "=" + paramValue + "&" + strParam;
			}
		}
		listUrl = originalURL+"?"+strParam; 
		return listUrl; 
	}
		

}
