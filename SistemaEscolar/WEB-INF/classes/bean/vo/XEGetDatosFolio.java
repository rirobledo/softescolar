package bean.vo;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name="data") 
public class XEGetDatosFolio {
	
	private ArrayList<XEDatosFolioPagoVO> data = new ArrayList< XEDatosFolioPagoVO>();

	public ArrayList<XEDatosFolioPagoVO> getData() {
		return data;
	}

	public void setData(ArrayList<XEDatosFolioPagoVO> data) {
		this.data = data;
	}

	

	

	
	

	
	

}
