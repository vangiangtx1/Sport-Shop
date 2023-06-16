package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CTHD {
	@Id
	
	private String sohd;
	@ManyToOne
	@JoinColumn(name = "SOHD")
	private HOADON hoadon;
	@ManyToOne
	@JoinColumn(name="MASP")
	private SANPHAM sanpham;
	private Integer sl;
	
	public String getSohd() {
		return sohd;
	}

	public void setSohd(String sohd) {
		this.sohd = sohd;
	}

	public SANPHAM getSanpham() {
		return sanpham;
	}

	public void setSanpham(SANPHAM sanpham) {
		this.sanpham = sanpham;
	}

	public Integer getSl() {
		return sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public CTHD() {
		super();
	}
	
	
}
