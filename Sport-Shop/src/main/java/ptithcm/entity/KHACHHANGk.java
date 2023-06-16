package ptithcm.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="KHACHHANG")
public class KHACHHANGk {

	@Id
	@GeneratedValue
	private int maKH;
	@Column(name="HOTEN")
	private String hoTen;
	
	@Column(name="DIACHI")
	private String diaChi;
	
	@Column(name="SDT")
	private String sdt;
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="DOANHSO")
	private int doanhSo;
	
	@OneToOne
	@JoinColumn(name = "TAIKHOAN")
	private DSTAIKHOANk taiKhoan;

	@OneToMany(mappedBy ="maKH",fetch = FetchType.EAGER)
	private List<DDHk> DDH;

	public List<DDHk> getDDH() {
		return DDH;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDDH(List<DDHk> dDH) {
		DDH = dDH;
	}

	public int getMaKH() {
		return maKH;
	}

	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public int getDoanhSo() {
		return doanhSo;
	}

	public void setDoanhSo(int doanhSo) {
		this.doanhSo = doanhSo;
	}

	public DSTAIKHOANk getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(DSTAIKHOANk taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
}
