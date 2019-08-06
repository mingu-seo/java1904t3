package manage.rental;

import java.sql.Timestamp;

public class Rental_replyVO {

	private int no;
	private int rental_pk;
	private String reply;
	private Timestamp registdate;
	
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRental_pk() {
		return rental_pk;
	}
	public void setRental_pk(int rental_pk) {
		this.rental_pk = rental_pk;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
}
