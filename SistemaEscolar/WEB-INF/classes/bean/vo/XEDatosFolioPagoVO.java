package bean.vo;


import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement (name="data")
public class XEDatosFolioPagoVO {
	
	private String idFolioReg="";
	
	private String mesPago="";
	private String concepto="";
	private String cantidad="";
	private String fecha="";
	public String getConcepto() {
		return concepto;
	}
	public void setConcepto(String concepto) {
		this.concepto = concepto;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public String getMesPago() {
		return mesPago;
	}
	public void setMesPago(String mesPago) {
		this.mesPago = mesPago;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getIdFolioReg() {
		return idFolioReg;
	}
	public void setIdFolioReg(String idFolioReg) {
		this.idFolioReg = idFolioReg;
	}
	
	

	
	
	

}
