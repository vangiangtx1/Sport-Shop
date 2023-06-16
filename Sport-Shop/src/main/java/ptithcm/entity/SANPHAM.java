package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.OrderBy;
import org.hibernate.validator.constraints.NotBlank;



@Entity
public class SANPHAM {
	
	@Id 
	@Column(name = "MASP")

	private String masp;
	
	@NotBlank(message = "Không được để trống tên sản phẩm!")
	private String tensp;
	
	@OneToMany(mappedBy="sanpham")
	@LazyCollection(LazyCollectionOption.FALSE)	
	private Collection<CTDDH> ctddhlist;

	
	
	
	public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public String getLoaisp() {
		return loaisp;
	}
	public void setLoaisp(String loaisp) {
		this.loaisp = loaisp;
	}
	public Collection<CTDDH> getCtddhlist() {
		return ctddhlist;
	}
	public void setCtddhlist(Collection<CTDDH> ctddhlist) {
		this.ctddhlist = ctddhlist;
	}
	
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public Integer getSoluongton() {
		return soluongton;
	}
	public void setSoluongton(Integer soluongton) {
		this.soluongton = soluongton;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public Float getSale() {
		return sale;
	}
	public void setSale(Float sale) {
		this.sale = sale;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public SANPHAM() {
		super();
	}
	private String mota;
	@NotNull(message = "Không được để trống số lượng!")
	@Min(value =0,message = "Số lượng không hợp lệ !")
	private Integer soluongton;
	@NotNull(message = "Không được để trống sản phẩm !")
	private String loaisp;
	private String hinhanh;
	@NotNull(message = "Không được để trống đơn giá !")
	private Integer dongia;
	@NotNull(message = "vui lòng chọn nước sản xuất!")
	private String nuocsx;
	private Integer trangthaixoa;
	private Float sale;

	public Integer getTrangthaixoa() {
		return trangthaixoa;
	}
	public void setTrangthaixoa(Integer trangthaixoa) {
		this.trangthaixoa = trangthaixoa;
	}
	public Integer getDongia() {
		return dongia;
	}
	public void setDongia(Integer dongia) {
		this.dongia = dongia;
	}
	public String getNuocsx() {
		return nuocsx;
	}
	public void setNuocsx(String nuocsx) {
		this.nuocsx = nuocsx;
	}
	
}
