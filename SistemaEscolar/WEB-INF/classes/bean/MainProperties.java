package bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.MissingResourceException;
import java.util.PropertyResourceBundle;

import org.apache.log4j.Logger;
 
/**
 * Bean estático para obtener el path de configuración de las
 * aplicaciones para que estas puedan leer los properties correspondientes.
 * <br>
 * <br>Autor: Ruben Araujo Salgado
 * <br>Fecha de Creacion: (2/MAR/2006)
 * <br>Compania: ZENTRUM SERVICIOS
 * 
 * @author DSARAURTJ
 * @see menu.bean.Conexion
 * @see menu.bean.ConexionModulo
 * @see menu.bean.ResultadoConexion
 * @viz.diagram MainProperties.tpx
 */
public class MainProperties 
{
	/**
	 * Contiene nombre de programa para concatenar en mensajes de error.
	 */
	private static final String HDR_ERR="MSERR_B_MainProperties.";
	/**
	 * Variable que almacena el directorio actual.
	 */
	private static String PATH_BASE="";
	
	/**
	 * Objeto para envío de avisos y mensajes de error.
	 */
    static Logger logger = Logger.getLogger(MainProperties.class.getName());
	static {
		File f=new File(".");
		
		try{ 
			PATH_BASE = f.getCanonicalPath() + File.separatorChar;
			
			PATH_BASE =  "C:\\Oracle\\Middleware\\user_projects\\domains\\base_domain\\";

		} catch (Exception e) {			
			logger.error(new StringBuffer(HDR_ERR).append("{static body} Error al determinar el path absoluto del directorio base.Exception=").append(e.toString()));
		}
	}
	
	/**
	 * Contiene la ruta y nombre del archivo main.properties.
	 */
	private static final String ARCHIVO_MAIN = new StringBuffer(PATH_BASE).append("zntwasconfig").append(File.separatorChar).append("main.properties").toString(); //$NON-NLS-1$

	private MainProperties()  
	{
		super();	
	}

	/** 
	 * Obtiene el path de la aplicación solicitada y que se encuentra
	 * registrada en el main.properties.
	 * Fecha de creación: (11/07/2002 12:23:29)
	 * 
	 * @param propiedad Nombre de la propiedad para obtener su valor.
	 * @return Valor de la propiedad indicada en el parámetro <i>propiedad</i>.
	*/
	public static synchronized String getProperty(String propiedad)   
	{
		FileInputStream inputStream = null;
		PropertyResourceBundle properties = null;
		String property = null;
		StringBuffer buffer = new StringBuffer("");
		try {
			inputStream = new FileInputStream(ARCHIVO_MAIN);
			properties = new PropertyResourceBundle(inputStream);
		} 
		catch (FileNotFoundException e)
		{
			buffer.append(HDR_ERR).append("getProperty() Archivo de propiedades (").append(ARCHIVO_MAIN).append(") no encontrado.");			
			logger.error(buffer);
		}
		catch (Exception e) //RCC01 (Capturar todos las excepciones
		{
			buffer.delete(0,buffer.length());
			buffer.append(HDR_ERR).append("getProperty() Error de lectura de archivo de propiedades (").append(ARCHIVO_MAIN).append(").Exception=").append(e.toString());
			logger.error(buffer);
		}
		
		if (properties!=null)
		{
			try 
			{
				property = properties.getString(propiedad);
			} 
			catch (MissingResourceException e) 
			{
				buffer.delete(0,buffer.length());
				buffer.append(HDR_ERR).append("getProperty() Propiedad (").append(propiedad).append(") no existente  en archivo (").append(ARCHIVO_MAIN).append(")");
				logger.error(buffer);
			}
			catch (Exception e) 
			{
				buffer.delete(0,buffer.length());
				buffer.append(HDR_ERR).append("getProperty() Error al recuperar propiedad (").append(propiedad).append(") de archivo (").append(ARCHIVO_MAIN).append(").Exception=").append(e.toString());
				logger.error(buffer);
			}
			finally
			{
				try {
					if (inputStream!=null) {
						inputStream.close();
					}
				} catch (Exception e) {
					buffer.delete(0,buffer.length());
					buffer.append(HDR_ERR).append("getProperty() Error al cerrar inputStream: ").append(e.toString());
					logger.error(buffer);
				}
			}
		}
		return property;		
	}
	
	/**
	 * Obtiene la ruta donde se encuentra el archivo main.properties incluyendo su nombre.
	 * 
	 * @return La ruta del archivo main.properties.
	 */
	public static synchronized String getCanonicalPath(){
	  return 	ARCHIVO_MAIN;
	}
}