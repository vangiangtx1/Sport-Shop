package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Past;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class NHANVIEN {
	@Id
	@Column(name = "MANV")
	private Integer manv;
	@NotBlank(message = "Names cannot be left blank!")
	private String hoten;
	@NotBlank(message = "Phone numbers cannot be left blank!")
	private String sdt;
	@NotBlank(message = "Picture cannot be left blank!")
	private String hinhanh;
	@OneToMany(mappedBy="nhanvien")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<HOADON> hoadonlist;
	@NotBlank(message = "Email cannot be left blank!")
	private String email;
	@NotBlank(message = "Address cannot be left blank!")
	private String diachi;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public Collection<HOADON> getHoadonlist() {
		return hoadonlist;
	}
	public void setHoadonlist(Collection<HOADON> hoadonlist) {
		this.hoadonlist = hoadonlist;
	}
	
	public NHANVIEN() {
		super();
	}
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")	
	private Date ngayvaolam;
	@ManyToOne
	@JoinColumn(name="TAIKHOAN")
	private DSTAIKHOAN dstaikhoan;

	public Integer getManv() {
		return manv;
	}
	public void setManv(Integer manv) {
		this.manv = manv;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public Date getNgayvaolam() {
		return ngayvaolam;
	}
	public void setNgayvaolam(Date ngayvaolam) {
		this.ngayvaolam = ngayvaolam;
	}
	public DSTAIKHOAN getDstaikhoan() {
		return dstaikhoan;
	}
	public void setDstaikhoan(DSTAIKHOAN dstaikhoan) {
		this.dstaikhoan = dstaikhoan;
	}
	
}