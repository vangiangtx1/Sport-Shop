package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
@Entity
public class DSTAIKHOAN {
	@Id
	@Column(name = "TAIKHOAN")
	private String taikhoan;
	private String matkhau;
	private String chucvu;
	public String getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(String taikhoan) {
		this.taikhoan = taikhoan;
	}
	public String getMatkhau() {
		return matkhau;
	} 
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getChucvu() {
		return chucvu;
	}
	public void setChucvu(String chucvu) {
		this.chucvu = chucvu;
	}
	public DSTAIKHOAN(String taikhoan, String matkhau, String chucvu) {
		super();
		this.taikhoan = taikhoan;
		this.matkhau = matkhau;
		this.chucvu = chucvu;
	}
	public DSTAIKHOAN() {
		super();
	}
	@OneToMany(mappedBy="dstaikhoan")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<KHACHHANG> khachhanglist;
	@OneToMany(mappedBy="dstaikhoan")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<NHANVIEN> nhanvienlist;
	
	public Collection<KHACHHANG> getKhachhanglist() {
		return khachhanglist;
	}
	public void setKhachhanglist(Collection<KHACHHANG> khachhanglist) {
		this.khachhanglist = khachhanglist;
	}
	public Collection<NHANVIEN> getNhanvienlist() {
		return nhanvienlist;
	}
	public void setNhanvienlist(Collection<NHANVIEN> nhanvienlist) {
		this.nhanvienlist = nhanvienlist;
	}
	
}
