package bean.vo;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement (name="data") 
public class XEAlumnosVO2 {
	
	private String Matricula="";
	private String Nombre="";
	private String FechaNacimiento="";
	private String Grado="";
	private String Estatus="";
	private String FechaHrRegistro="";
	private String Domicilio="";
	
	
	
	public String getMatricula() {
		return Matricula;
	}
	public void setMatricula(String matricula) {
		Matricula = matricula;
	}
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String nombre) {
		Nombre = nombre;
	}
	
	public String getFechaNacimiento() {
		return FechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		FechaNacimiento = fechaNacimiento;
	}
	
	public String getGrado() {
		return Grado;
	}
	public void setGrado(String grado) {
		Grado = grado;
	}
	public String getEstatus() {
		return Estatus;
	}
	public void setEstatus(String estatus) {
		Estatus = estatus;
	}
	
	public String getFechaHrRegistro() {
		return FechaHrRegistro;
	}
	public void setFechaHrRegistro(String fechaHrRegistro) {
		FechaHrRegistro = fechaHrRegistro;
	}
	public String getDomicilio() {
		return Domicilio;
	}
	public void setDomicilio(String domicilio) {
		Domicilio = domicilio;
	}
	
	

}
