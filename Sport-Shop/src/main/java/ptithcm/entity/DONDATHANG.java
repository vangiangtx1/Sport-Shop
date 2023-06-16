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
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class DONDATHANG {
	@Id
	@Column(name="MSDDH")
 private String msddh;
 private String hotenkh;
 private String diachi;
 private String SDT;
 private String trangthai;
 @Temporal(TemporalType.DATE)
 @DateTimeFormat(pattern="MM/dd/yyyy")
 private Date ngaylap;
 private String email;
public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public Date getNgaylap() {
	return ngaylap;
}
public void setNgaylap(Date ngaylap) {
	this.ngaylap = ngaylap;
}

public HOADON getHoadon() {
	return hoadon;
}

public void setHoadon(HOADON hoadon) {
	this.hoadon = hoadon;
}

public Collection<CTDDH> getCtddhlist() {
	return ctddhlist;
}

public void setCtddhlist(Collection<CTDDH> ctddhlist) {
	this.ctddhlist = ctddhlist;
}

public DONDATHANG() {
	super();
}

public String getMsddh() {
	return msddh;
}

public void setMsddh(String msddh) {
	this.msddh = msddh;
}

public String getHotenkh() {
	return hotenkh;
}

public void setHotenkh(String hotenkh) {
	this.hotenkh = hotenkh;
}

public String getDiachi() {
	return diachi;
}

public void setDiachi(String diachi) {
	this.diachi = diachi;
}

public String getSDT() {
	return SDT;
}

public void setSDT(String sDT) {
	SDT = sDT;
}

public String getTrangthai() {
	return trangthai;
}

public void setTrangthai(String trangthai) {
	this.trangthai = trangthai;
}

public KHACHHANG getKhachhang() {
	return khachhang;
}

public void setKhachhang(KHACHHANG khachhang) {
	this.khachhang = khachhang;
}

@ManyToOne(targetEntity = KHACHHANG.class)
@JoinColumn(name="MAKH")
private KHACHHANG khachhang;

@OneToOne(mappedBy = "dondathang")
  private HOADON hoadon;
@OneToMany(mappedBy="dondathang", fetch=FetchType.EAGER)
private Collection<CTDDH> ctddhlist;
}


