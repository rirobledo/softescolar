package bean.vo;


import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement (name="data")
public class XEDatosFolioVO {
	
	private String idFolioReg="";
	private String NombreAlumno="";
	private String Grado="";
	private String FechaHrRegistro="";
	
	public String getIdFolioReg() {
		return idFolioReg;
	}
	public void setIdFolioReg(String idFolioReg) {
		this.idFolioReg = idFolioReg;
	}
	public String getNombreAlumno() {
		return NombreAlumno;
	}
	public void setNombreAlumno(String nombreAlumno) {
		NombreAlumno = nombreAlumno;
	}
	public String getGrado() {
		return Grado;
	}
	public void setGrado(String grado) {
		Grado = grado;
	}
	public String getFechaHrRegistro() {
		return FechaHrRegistro;
	}
	public void setFechaHrRegistro(String fechaHrRegistro) {
		FechaHrRegistro = fechaHrRegistro;
	}

	
	
	

}
