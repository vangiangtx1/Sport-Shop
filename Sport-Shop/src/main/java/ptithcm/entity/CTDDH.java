package ptithcm.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CTDDH")
public class CTDDH {
	@Id
	@Column(name ="ID")
	@GeneratedValue
	private Integer id;
	@ManyToOne
	@JoinColumn(name="MSDDH")
	private DONDATHANG dondathang;	
	@ManyToOne
	@JoinColumn(name="MASP")
	private SANPHAM sanpham;	
	private Integer SL;
	
	public SANPHAM getSanpham() {
		return sanpham;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public DONDATHANG getDondathang() {
		return dondathang;
	}
	public void setDondathang(DONDATHANG dondathang) {
		this.dondathang = dondathang;
	}
	public void setSanpham(SANPHAM sanpham) {
		this.sanpham = sanpham;
	}
	public Integer getSL() {
		return SL;
	}
	public void setSL(Integer sL) {
		SL = sL;
	}
	
	
}
