package bean.vo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement (name="data")
public class XERespuestaOK {
	
	String resp = "";

	public String getResp() {
		return resp;
	}

	public void setResp(String resp) {
		this.resp = resp;
	}
	
	

}
