package ptithcm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="HOADON")
public class HOADONk {

	@Id
	@Column(name="SOHD")
	private String soHoaDon;
	@Column(name="NGAYLAPHD")
	private String ngayLapHoaDon;
	@Column(name="MANV")
	private String maNV;
	@Column(name="TONGGIA")
	private float tongGia;
	
	
	@OneToOne
	@JoinColumn(name="MSDDH")
	private DDHk DDH;
	
	public DDHk getDDH() {
		return DDH;
	}
	public void setDDH(DDHk dDH) {
		DDH = dDH;
	}
	
	
	
	public String getMaNV() {
		return maNV;
	}
	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}
	public String getSoHoaDon() {
		return soHoaDon;
	}
	
	public String getNgayLapHoaDon() {
		return ngayLapHoaDon;
	}

	public void setNgayLapHoaDon(String ngayLapHoaDon) {
		this.ngayLapHoaDon = ngayLapHoaDon;
	}

	public void setSoHoaDon(String soHoaDon) {
		this.soHoaDon = soHoaDon;
	}


	public float getTongGia() {
		return tongGia;
	}
	public void setTongGia(float tongGia) {
		this.tongGia = tongGia;
	}
	
	
}
