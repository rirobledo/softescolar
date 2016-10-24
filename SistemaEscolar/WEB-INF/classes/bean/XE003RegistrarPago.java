package bean;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import bean.vo.XEAltaAlumno;
import bean.vo.XEAlumnosVO;
import bean.vo.XEDatosFolioVO;
import bean.vo.XEGetAlumnos;
import bean.vo.XERegPago;
import bean.vo.XERespuestaOK;
import conexion.DataAccessDAO;
import java.sql.Connection;
import java.sql.SQLException;


public class XE003RegistrarPago extends DataAccessDAO {

	private final static String MSINF = "MSINF." + XE003RegistrarPago.class.getName();
	private final static String MSERR = "MSERR." + XE003RegistrarPago.class.getName();

	/**
	 * iNSERTA DATOS DE ALUMNOS
	 * @param altaAlumno
	 * @return
	 */
	public static JSONObject InsertarRegistroPago(XERegPago altaPago) {
		JSONObject JSONResp = new JSONObject();
		XERespuestaOK beanRespOK = new XERespuestaOK();

		
		String esquema = "db_escuela";
		String resp = "";
		String folio = "";
		String msgError1 = "";
		String msgError2 = "";
		String msgError3 = "";
		String msgError4 = "";
		String msgError5 = "";
		String msgError6 = "";
		String msgError7 = "";
		String msgError8 = "";
		StringBuffer msgFinal = new StringBuffer();
		
		Connection con = null;
		
		try 
		{
			con = getConnection();
			
			folio = generarFolioPago(con, esquema);
			
			if(altaPago.getInscripcion().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "INSCRIPCION", altaPago.getInscripcion(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError1 = "INSCRIPCION";
				}
				
			}
			if(altaPago.getLibros().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "LIBROS", altaPago.getLibros(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError2 = "LIBROS";
				}
			}
			if(altaPago.getUniformes().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "UNIFORMES", altaPago.getUniformes(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError3 = "UNIFORMES";
				}
			}
			if(altaPago.getSeguroEscolar().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "SEGURO ESCOLAR", altaPago.getSeguroEscolar(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError4 = "SEGURO ESCOLAR";
				}
			}
			if(altaPago.getCredenciales().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "CREDENCIALES", altaPago.getCredenciales(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError5 = "CREDENCIALES";
				}
			}
			if(altaPago.getCopias().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "COPIAS", altaPago.getCopias(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError6 = "COPIAS";
				}
			}
			if(altaPago.getColegiatura().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "COLEGIATURA", altaPago.getColegiatura(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError7 = "COLEGIATURA";
				}
			}
			if(altaPago.getTransporteEscolar().length() > 0)
			{
				resp = XE003RegistrarPago.setPago(con, esquema, altaPago.getIdAlumno(), altaPago.getNomAlumno(), altaPago.getMes(), "TRANSPORTE ESCOLAR", altaPago.getTransporteEscolar(), altaPago.getUsuarioAlta(), folio);
				if(!resp.startsWith("OK:1"))
				{
					msgError8 = "TRANSPORTE ESCOLAR";
				}
			}
			
			if(msgError1.length() > 0 || msgError2.length() > 0 || msgError3.length() > 0 || msgError4.length() > 0 || msgError5.length() > 0 || msgError6.length() > 0 || msgError7.length() > 0 || msgError8.length() > 0)
			{
				msgFinal.append("SE PRESENTARON PROBLEMAS AL REGISTRAR EL PAGO DE: ")
				.append(msgError1).append("-")
				.append(msgError2).append("-")
				.append(msgError3).append("-")
				.append(msgError4).append("-")
				.append(msgError5).append("-")
				.append(msgError6).append("-")
				.append(msgError7).append("-")
				.append(msgError8).append("-")
				.append("CONTACTE AL ADMINISTRADOR.");
			}
			
			if(msgFinal.length() > 0)
			{
				beanRespOK.setResp(folio+"/"+msgFinal.toString());
			}
			else
			{
				beanRespOK.setResp(folio);
			}
			
			
			JSONResp = XEUtiles.convertirBeanVOToJSON(beanRespOK, XERespuestaOK.class);
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			if (con != null)
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
//
//		
//		JSONObjRespRegistro = XE003RegistrarPago.setPago(altaPago);
//	
//		
//		System.err.println(MSERR + ".InsertarRegistroPago(): JSONObjRespRegistro:" + JSONObjRespRegistro);
//		
		return JSONResp;
	}

	
	/**
	 * Metodo que obtiene las prioridades de las tecnologias
	 * 
	 */
	public static String setPago(Connection con, String esquema, String idAlumno, String nomAlumno, String mesPago, String concepto, String cantidad, String usuarioAlta, String folio)
	{

		String resp = "";
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrParams = new ArrayList();
		
		try {

			
			System.err.println(MSERR + ".setPago(): Parámetros Insert idAlumno:" + idAlumno);
			System.err.println(MSERR + ".setPago(): Parámetros Insert nomAlumno:" + nomAlumno);
			System.err.println(MSERR + ".setPago(): Parámetros Insert mesPago:" + mesPago);
			System.err.println(MSERR + ".setPago(): Parámetros Insert concepto:" + concepto);
			System.err.println(MSERR + ".setPago(): Parámetros Insert cantidad:" + cantidad);
			System.err.println(MSERR + ".setPago(): Parámetros Insert usuario Alta:" + usuarioAlta);
			
			
			
			
			
			arrParams.add(idAlumno);
			arrParams.add(nomAlumno);
			arrParams.add(mesPago);
			arrParams.add(concepto);
			arrParams.add(cantidad);
			arrParams.add(folio);
			arrParams.add(usuarioAlta);
			
			
			
			if (con != null) 
			{
				sbQry.append("INSERT INTO ").append(esquema).append(".esctdatregpag (ESCTPAGIDALU, ESCTPAGNOMALU, ESCTPAGPERI, ESCTPAGCONC, ESCTPAGCANT, ESCTPAGFECRE, ESCTPAGFOLIO, ESCTPAGIDEMP) ");
				sbQry.append(" VALUES(?,?,?,?,?,CURRENT_TIMESTAMP,?,?) ");
				resp = SQLStatics.doUpdateMain(con, sbQry.toString(), arrParams);
				

				System.err.println(MSERR + ".setPago(): Respuesta Insert Pago:" + resp);
				
			}

		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{

		}
		
		

		return resp;
	}
	
	/**
	 * Metodo que obtiene las prioridades de las tecnologias
	 * 
	 */
	public static String generarFolioPago(Connection con, String esquema)
	{

		String resp = "";
		StringBuffer folio = new StringBuffer();
		StringBuffer sbQry = new StringBuffer();
		
		java.util.Date date= new java.util.Date();
		String fecha = "";
		try {

			java.sql.Timestamp ourJavaTimestampObject = new java.sql.Timestamp(date.getTime());
			
			System.err.println(MSERR + ".generarFolioPago(): ourJavaTimestampObject:" + ourJavaTimestampObject);
			
			fecha = ourJavaTimestampObject.toString().replace("-", "");
			fecha = fecha.replace(":", "");
			fecha = fecha.replace(".", " ");
			fecha = fecha.replaceAll(" ", "");
			
			
			System.err.println(MSERR + ".generarFolioPago(): fecha:" + fecha);
			if (con != null) 
			{
				sbQry.append("INSERT INTO ").append(esquema).append(".esctfoliador (IDGENFECHA) ");
				sbQry.append(" VALUES(?) ");
				resp = SQLStatics.doUpdate(con, sbQry.toString(),fecha.trim());
				
				

				System.err.println(MSERR + ".setPago(): Respuesta Insert Folio:" + resp);
				
				if(resp.startsWith("OK:1"))
				{
					sbQry.delete(0, sbQry.length());
					sbQry.append("SELECT IDGENFOLIO FROM ").append(esquema).append(".esctfoliador WHERE IDGENFOLIO > ? AND IDGENFECHA = ?");

					SQLStatics.doQuery(con, sbQry.toString(), folio, true, "0",fecha.trim());
					System.err.println(MSERR + ".setPago(): Respuesta  Folio:(" + folio+") _Parametro:"+fecha.trim());
					
				}
				
			}

		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 

		System.err.println(MSERR + ".generarFolioPago(): folio:" + folio);
		return folio.toString();
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		XE001Alumnos.getAlumnos();
		
		String esquema = "db_escuela";
		String resp = "";
		Connection con = null;
		
		try 
		{
			con = getConnection();
			generarFolioPago(con, esquema);
			
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			if (con != null)
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	}


}
