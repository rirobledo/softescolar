package bean;

import java.io.StringWriter;


import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

public class XEUtiles {

//	private final static Logger logger = Logger.getLogger("PlantaOfertaVelocidadWebWL");
	private final static String MSINF 	= "MSINF."+XEUtiles.class.getName();
	private final static String MSERR 	= "MSERR."+XEUtiles.class.getName();
	private static final String SUFIJO_PARAMNAME="{parametroExtraAutomatico}"; //Sufijo en el nombre de un parametro URL agregado con el metodo 'addHttpParm(....)'
	
	/**
	 * MEtodo que recibe de parametro un bean del tipo Value Object y lo convierte en JSON
	 * @param bean
	 * @return
	 */
	public static JSONObject convertirBeanVOToJSON(Object bean, Class clase)
	{
		Marshaller jaxbMarshaller;
		JAXBContext jaxbContext;
		StringWriter sw = new StringWriter();
		String xmlSalida = "";
		JSONObject JSONRespuesta = new JSONObject();

		System.out.println(MSERR + ".convertirBeanVOToJSON()_ Convierte el beanVO a JSON, Bean:"+  bean.getClass().getName());
		try 
		{
			jaxbContext = JAXBContext.newInstance(clase);
		
			jaxbMarshaller = jaxbContext.createMarshaller();
			jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			
		
			//Convierte el beanVo de listamoleculas a un xml string
			jaxbMarshaller.marshal(bean, sw);
			xmlSalida = sw.toString();
			System.out.println(MSERR + ".convertirBeanVOToJSON()_ xmlSalida:"+  xmlSalida);
			//Convierte el xml a un objeto de tipo JSON
			JSONRespuesta = XML.toJSONObject(xmlSalida);
			System.out.println(MSERR + ".convertirBeanVOToJSON()_ JSONRespuesta:"+  JSONRespuesta);
		} 
		catch (JAXBException | JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally 
		{
			jaxbMarshaller = null;
			jaxbContext = null;
			sw = null;
		}
    	
		return JSONRespuesta;
	}
	
	/**
	* Retorna el valor del parametro 'parametro' existente en el objeto
	* del request, en caso de encontrar vacio retorna cadena vacia.
	**/
	public static String getParam(javax.servlet.http.HttpServletRequest req, String parametro)
	{
		return getParam(req, parametro, "");
	}
	
	/**
	* Retorna el valor del parametro 'parametro' existente en el objeto
	* del request, en caso de encontrar vacio retorna el valor por default
	* especificado en 'valDefault'
	**/
	public static String getParam(javax.servlet.http.HttpServletRequest req, String parametro, String valDefault)
	{
		String valor = req.getParameter(parametro);//Buscar el parametro entre los recibidos por URL
		
		if (valor == null || valor.length()==0)
		{
		    /*Ya que el parametro buscado no venia originalmente en el URL, entonces
		     * buscar en los atributos del request ya que este parametro
		     * lo pudo haber agregado otro proceso (clase o  jsp) utilizado
		     * el metodo 'TRUtiles.addHttpParm(...)'*/
		    valor=(String)req.getAttribute(SUFIJO_PARAMNAME+parametro);//RCC02 Es necesario utilizar el sufijo ya que asi se almaceno originalemente.
		    if (valor==null||valor.length()==0)
		    {
		        valor = valDefault; //RRV01
		    }
		}
	    valor=valor.trim();
		return valor;
	}
	
	
}
