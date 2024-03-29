package manage.exhibition;

import java.sql.Timestamp;
import java.util.HashMap;

import util.Parameter;

public class ExhibitionVO extends Parameter {

	protected int no;
	protected String title;							//전시 제목
	protected String artist;						//아티스트 작가
	protected int hallnumber;						//관 번호
	protected String contents;			
	protected double score;							//평점
	protected String imagename;						//목록 이미지
	protected int state;							//전시 상태 (1.전시대기 2.전시중 3.전시종료)
	private String[] sstate;
	protected HashMap<String, Integer> state_chk;	//상태 checkbox 검색
	protected int like_cnt;							//좋아요 수
	protected String startdate;						//전시 시작일
	protected String enddate;						//전시 종료일
	protected Timestamp registdate;					//작성일
	protected String preview;						//프리뷰
	protected String imagename_chk;					//수정시 필요한 이미지 체크
	
	public String getImagename_chk() {
		return imagename_chk;
	}

	public void setImagename_chk(String imagename_chk) {
		this.imagename_chk = imagename_chk;
	}

	public ExhibitionVO() {
		super.setPageRows(10);
	}
	
	public HashMap<String, Integer> getState_chk() {
		return state_chk;
	}
	
	public void setState_chk(String name, int state_chk) {
		this.state_chk.put(name, state_chk);
	}
	
	public String getPreview() {
		return preview;
	}
	
	public void setPreview(String preview) {
		this.preview = preview;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public int getHallnumber() {
		return hallnumber;
	}
	public void setHallnumber(int hallnumber) {
		this.hallnumber = hallnumber;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public String[] getSstate() {
		return sstate;
	}

	public void setSstate(String[] sstate) {
		this.sstate = sstate;
	}

	
}
