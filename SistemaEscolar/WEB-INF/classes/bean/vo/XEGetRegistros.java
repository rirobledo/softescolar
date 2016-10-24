package bean.vo;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name="data") 
public class XEGetRegistros {
	
	private ArrayList<XEDatosFolioVO> data = new ArrayList< XEDatosFolioVO>();

	public ArrayList<XEDatosFolioVO> getData() {
		return data;
	}

	public void setData(ArrayList<XEDatosFolioVO> data) {
		this.data = data;
	}

	

	
	

	
	

}
