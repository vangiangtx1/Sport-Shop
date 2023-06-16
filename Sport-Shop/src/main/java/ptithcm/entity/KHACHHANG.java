package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
public class KHACHHANG {
	@Id
	@Column(name = "MAKH")
	private String makh;
	private String hoten;
	private String diachi;
	private String sdt;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date ngaysinh;
	private Float doanhso;
	
	@ManyToOne
	@JoinColumn(name="TAIKHOAN")
	private DSTAIKHOAN dstaikhoan;
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public Date getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public Float getDoanhso() {
		return doanhso;
	}
	public void setDoanhso(Float doanhso) {
		this.doanhso = doanhso;
	}
	public Collection<DONDATHANG> getDdhlist() {
		return ddhlist;
	}
	public void setDdhlist(Collection<DONDATHANG> ddhlist) {
		this.ddhlist = ddhlist;
	}
	public DSTAIKHOAN getDstaikhoan() {
		return dstaikhoan;
	}
	public void setDstaikhoan(DSTAIKHOAN dstaikhoan) {
		this.dstaikhoan = dstaikhoan;
	}
	@OneToMany(mappedBy="khachhang")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<DONDATHANG> ddhlist;
	@Column(name = "EMAIL")
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
