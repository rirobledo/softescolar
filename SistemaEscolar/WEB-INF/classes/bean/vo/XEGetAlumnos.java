package bean.vo;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement (name="data") 
public class XEGetAlumnos {
	
	private ArrayList<XEAlumnosVO> data = new ArrayList< XEAlumnosVO>();

	public ArrayList<XEAlumnosVO> getData() {
		return data;
	}

	public void setData(ArrayList<XEAlumnosVO> data) {
		this.data = data;
	}

	

	
	

	
	

}
