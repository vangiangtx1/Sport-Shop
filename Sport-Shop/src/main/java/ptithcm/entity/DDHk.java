package ptithcm.entity;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="DONDATHANG")
public class DDHk {
	
	@Id
	@GeneratedValue
	private int MSDDH;
	
	@Column(name="HOTENKH")
	private String hoTenKH;
	@Column(name="DIACHI")
	private String diaChi;
	@Column(name="SDT")
	private String sdt;
	@Column(name="TRANGTHAI")
	private String trangThai;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date ngaylap;
	@Column(name="EMAIL")
	private String email;

	  @ManyToOne
	  @JoinColumn(name="MAKH") 
	  private KHACHHANGk maKH;
	  
	  @OneToMany(mappedBy ="donDatHang",fetch = FetchType.EAGER) 
	  private List<CTDDHk> CTDDH;
	 
	  public List<CTDDHk> getCTDDH() {
			return CTDDH;
		}

		public void setCTDDH(List<CTDDHk> cTDDH) {
			CTDDH = cTDDH;
		}
	  @Transient
	  private float tongGia;
	  
	 
	public float getTongGia() {
		return tongGia;
	}
	
	public Date getNgaylap() {
		return ngaylap;
	}
	public void setNgaylap(Date ngaylap) {
		this.ngaylap = ngaylap;
	}

	public int getMSDDH() {
		return MSDDH;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setMSDDH(int mSDDH) {
		MSDDH = mSDDH;
	}

	public void setTongGia(float tongGia) {
		this.tongGia = tongGia;
	}

	public KHACHHANGk getMaKH() {
		return maKH;
	}

	public void setMaKH(KHACHHANGk maKH) {
		this.maKH = maKH;
	}

	

	public String getHoTenKH() {
		return hoTenKH;
	}

	public void setHoTenKH(String hoTenKH) {
		this.hoTenKH = hoTenKH;
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

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

}
