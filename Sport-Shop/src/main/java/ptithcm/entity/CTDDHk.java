package ptithcm.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CTDDH")
public class CTDDHk {
	
	@Id
	@Column(name="Id")
	@GeneratedValue
	private int MSCTDDH;
	
	@ManyToOne
	@JoinColumn(name="MSDDH")
	private DDHk donDatHang;
	
	@ManyToOne
	@JoinColumn(name="MASP")
	private SANPHAMk sanPham;
	
	@Column(name="SL")
	private int soLuong;
	
	
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	public DDHk getDonDatHang() {
		return donDatHang;
	}
	public void setDonDatHang(DDHk donDatHang) {
		this.donDatHang = donDatHang;
	}
	public SANPHAMk getSanPham() {
		return sanPham;
	}
	public void setSanPham(SANPHAMk sanPham) {
		this.sanPham = sanPham;
	}
	public int getMSCTDDH() {
		return MSCTDDH;
	}
	public void setMSCTDDH(int mSCTDDH) {
		MSCTDDH = mSCTDDH;
	}

	
	
	
	
}
