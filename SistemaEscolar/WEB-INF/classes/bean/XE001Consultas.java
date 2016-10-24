package bean;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;

import bean.vo.XEAlumnosVO;
import bean.vo.XEDatosFolioPagoVO;
import bean.vo.XEDatosFolioVO;
import bean.vo.XEGetAlumnos;
import bean.vo.XEGetDatosFolio;
import bean.vo.XEGetRegistros;
import conexion.DataAccessDAO;
import java.sql.Connection;
import java.sql.SQLException;

public class XE001Consultas extends DataAccessDAO {

	private final static String MSINF = "MSINF." + XE001Consultas.class.getName();
	private final static String MSERR = "MSERR." + XE001Consultas.class.getName();

	public static JSONObject obtenerAlumnos() {
		JSONObject JSONObjListaAlumnos = new JSONObject();

		XEGetAlumnos beanArrayAlumnos = new XEGetAlumnos();
		XEAlumnosVO beanAlumno = new XEAlumnosVO();
		
		XE001Consultas.getAlumnos(beanArrayAlumnos, beanAlumno);
//		XE001Alumnos.getAlumnos(beanAlumno);
		
		System.err.println(MSERR + ".XE001Alumnos(): beanArrayAlumnos:" + beanArrayAlumnos.getData());
		System.err.println(MSERR + ".XE001Alumnos(): beanAlumno:" + beanAlumno);
		
		JSONObjListaAlumnos = XEUtiles.convertirBeanVOToJSON(beanArrayAlumnos, XEGetAlumnos.class);
		
		
		System.err.println(MSERR + ".XE001Alumnos(): JSONObjListaAlumnos:" + JSONObjListaAlumnos);
		
		return JSONObjListaAlumnos;
	}

	/**
	 * Metodo que obtiene las prioridades de las tecnologias
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static void getAlumnos(XEGetAlumnos beanArrayAlumnos, XEAlumnosVO beanAlumno)
	{
		String esquema = "db_escuela";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrRespAlumnos = new ArrayList();

//		XEAlumnosVO beanAlumno = new XEAlumnosVO();
	    ArrayList<XEAlumnosVO> listaAlumnos = new ArrayList< XEAlumnosVO>();
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.append("SELECT ESCTALUIDALU, ESCTALUIDDOM, ESCTALUNOMB, ESCTALUAPAT, ESCTALUAMAT, ESCTALUFECNA, ESCTALUEDAD, ESCTALUGRADO, ESCTALUIDTUT, ESCTALUESTAT, ESCTALUFECH FROM ")
						.append(esquema).append(".esctdatalumno WHERE ESCTALUIDALU > ? ");
				SQLStatics.doQuery(con, sbQry.toString(), arrRespAlumnos, true, "0");

				System.err.println(MSERR + ".getAlumnos(): arrRespAlumnos:" + arrRespAlumnos);
				
				
				
				if(arrRespAlumnos.size() > 0)
				{
					int i=0;
					ArrayList arrTmp = new ArrayList();
					
					
					for(i = 0; i < arrRespAlumnos.size(); i++)
					{
						arrTmp = (ArrayList) arrRespAlumnos.get(i);

						beanAlumno.setNombre(arrTmp.get(2).toString()+" "+arrTmp.get(3).toString()+" "+arrTmp.get(4).toString());
						beanAlumno.setMatricula(arrTmp.get(0).toString());
						beanAlumno.setGrado(arrTmp.get(7).toString());
//						beanAlumno.setDomicilio(arrTmp.get(1).toString());
						beanAlumno.setDomicilio(getDomicilioAlumnos(con, esquema, arrTmp.get(0).toString()));
						beanAlumno.setEstatus(arrTmp.get(9).toString());
						beanAlumno.setFechaNacimiento(arrTmp.get(5).toString());
						beanAlumno.setFechaHrRegistro(arrTmp.get(10).toString());
//						beanAlumno.setEdad(arrTmp.get(6).toString());
						
//						beanAlumno.setIDTutores(arrTmp.get(8).toString());
						
						
						
						listaAlumnos.add(beanAlumno );
						
						
						
						beanAlumno = new XEAlumnosVO();
						
						if(arrRespAlumnos.size() == 1)
						{
							listaAlumnos.add(beanAlumno);
						}
					}
					beanArrayAlumnos.setData(listaAlumnos);
					
					System.err.println(MSERR + ".getAlumnos(): listaAlumnos:" + listaAlumnos);
				
				}
				else
				{
					listaAlumnos.add(beanAlumno);
					beanArrayAlumnos.setData(listaAlumnos);
				}
			}

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
	
	/**
	 * Metodo que obtiene los domicilios de los alumnos
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static String getDomicilioAlumnos(Connection con, String esquema, String idAlumno)
	{
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrResp = new ArrayList();
		StringBuffer strDomicilio = new StringBuffer();

	    
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.setLength(0);
				sbQry.append("SELECT ESCTDOMCALLE, ESCTDOMNUME, ESCTDOMNUMI, ESCTDOMDESMUN, ESCTDOMDESCIU, ESCTDOMDESEST, ESCTDOMCP, ESCTDOMDESPAIS FROM ")
						.append(esquema).append(".esctdatdomi WHERE ESCTDOMIDALUM = ? LIMIT 1");
				SQLStatics.doQuery(con, sbQry.toString(), arrResp, true, idAlumno);

				System.err.println(MSERR + ".getDomicilioAlumnos(): arrResp:" + arrResp);
				
				
				
				if(arrResp.size() > 0)
				{
					int i=0;
					ArrayList arrTmp = new ArrayList();
					
					arrTmp = (ArrayList) arrResp.get(0);
					for(i = 0; i < arrTmp.size(); i++)
					{
						

						
						if(i == 2 && arrTmp.get(i).toString().length() > 0)
						{
							strDomicilio.append(" INT ").append(arrTmp.get(i).toString()).append(", ");
						}
						else
						{
						
							if(i == 6 && arrTmp.get(i).toString().length() > 0)
							{
								strDomicilio.append(" CP:").append(arrTmp.get(i).toString()).append(", ");
							}
							else
							{
								
								if(i < arrTmp.size() - 1)
								{
									strDomicilio.append(arrTmp.get(i).toString()).append(", ");
								}
								else
								{
									strDomicilio.append(arrTmp.get(i).toString());
								}
							}
						}
						
						
						
					}
				}
			}

		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		

		return strDomicilio.toString();
	}

	
	public static JSONObject obtenerRegistros() 
	{
		JSONObject JSONObjListaDatos = new JSONObject();

		XEGetRegistros beanArrayDatos = new XEGetRegistros();
		
		XE001Consultas.getRegistros(beanArrayDatos);

		JSONObjListaDatos = XEUtiles.convertirBeanVOToJSON(beanArrayDatos, XEGetRegistros.class);

		
		System.err.println(MSERR + ".obtenerRegistros(): JSONObjListaDatos:" + JSONObjListaDatos);
		
		return JSONObjListaDatos;
	}
	
	/**
	 * Metodo que obtiene las prioridades de las tecnologias
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static void getRegistros(XEGetRegistros beanArrDatos)
	{
		String esquema = "db_escuela";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrResp = new ArrayList();

		XEDatosFolioVO beanDatos = new XEDatosFolioVO();
	    ArrayList<XEDatosFolioVO> listaDatos = new ArrayList< XEDatosFolioVO>();
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.append("SELECT ESCTIDFOLIO, ESCTFOLALUM, ESCTFOLGRADO, ESCTFOLFECREG FROM ")
						.append(esquema).append(".esctgenfolio WHERE ESCTIDFOLIO > ?  ORDER BY ESCTIDFOLIO DESC");
				SQLStatics.doQuery(con, sbQry.toString(), arrResp, true, "0");

				System.err.println(MSERR + ".getAlumnos(): arrRespAlumnos:" + arrResp);
				
				if(arrResp.size() > 0)
				{
					int i=0;
					ArrayList arrTmp = new ArrayList();
					for(i = 0; i < arrResp.size(); i++)
					{
						arrTmp = (ArrayList) arrResp.get(i);

						beanDatos.setIdFolioReg(arrTmp.get(0).toString());
						beanDatos.setNombreAlumno(arrTmp.get(1).toString());
						beanDatos.setGrado(arrTmp.get(2).toString());
						beanDatos.setFechaHrRegistro(arrTmp.get(3).toString());
						
						listaDatos.add(beanDatos);
						beanDatos = new XEDatosFolioVO();
						
						if(arrResp.size() == 1)
						{
							listaDatos.add(beanDatos);
						}
					}
					beanArrDatos.setData(listaDatos);
					
					System.err.println(MSERR + ".getAlumnos(): listaAlumnos:" + listaDatos);
				}
				else
				{
					listaDatos.add(beanDatos);
					beanArrDatos.setData(listaDatos);
				}
			}

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
	
	public static JSONObject obtenerDatosFolioPago(String folio) 
	{
		JSONObject JSONObjListaDatos = new JSONObject();

		XEGetDatosFolio beanArrayDatos = new XEGetDatosFolio();
		
		XE001Consultas.getDatosFolioPago(beanArrayDatos, folio);

		JSONObjListaDatos = XEUtiles.convertirBeanVOToJSON(beanArrayDatos, XEGetDatosFolio.class);

		
		System.err.println(MSERR + ".obtenerDatosFolioPago(): JSONObjListaDatos:" + JSONObjListaDatos);
		
		return JSONObjListaDatos;
	}
	
	public static JSONObject consultaDatosPagoAlumno(String matricula) 
	{
		JSONObject JSONObjListaDatos = new JSONObject();

		XEGetDatosFolio beanArrayDatos = new XEGetDatosFolio();
		
		XE001Consultas.getDatosPagoAlumno(beanArrayDatos, matricula);

		JSONObjListaDatos = XEUtiles.convertirBeanVOToJSON(beanArrayDatos, XEGetDatosFolio.class);

		
		System.err.println(MSERR + ".obtenerRegistros(): JSONObjListaDatos:" + JSONObjListaDatos);
		
		return JSONObjListaDatos;
	}
	
	/**
	 * 
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static void getDatosFolioPago(XEGetDatosFolio beanArrDatos, String folio)
	{
		String esquema = "db_escuela";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrResp = new ArrayList();

		XEDatosFolioPagoVO beanDatos = new XEDatosFolioPagoVO();
	    ArrayList<XEDatosFolioPagoVO> listaDatos = new ArrayList< XEDatosFolioPagoVO>();
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.append("SELECT ESCTPAGFOLIO, ESCTPAGPERI, ESCTPAGCONC, ESCTPAGCANT, ESCTPAGFECRE FROM ")
						.append(esquema).append(".esctdatregpag WHERE ESCTPAGFOLIO = ? ORDER BY ESCTPAGFOLIO DESC");
				SQLStatics.doQuery(con, sbQry.toString(), arrResp, true, folio);

				System.err.println(MSERR + ".getDatosFolioPago(): arrResp:" + arrResp);
				
				if(arrResp.size() > 0)
				{
					int i=0;
					ArrayList arrTmp = new ArrayList();
					for(i = 0; i < arrResp.size(); i++)
					{
						arrTmp = (ArrayList) arrResp.get(i);

						beanDatos.setIdFolioReg(arrTmp.get(0).toString());
						beanDatos.setMesPago(arrTmp.get(1).toString());
						beanDatos.setConcepto(arrTmp.get(2).toString());
						beanDatos.setCantidad(arrTmp.get(3).toString());
						beanDatos.setFecha(arrTmp.get(4).toString());
						
						listaDatos.add(beanDatos);
						beanDatos = new XEDatosFolioPagoVO();
						
						if(arrResp.size() == 1)
						{
							listaDatos.add(beanDatos);
						}
					}
					beanArrDatos.setData(listaDatos);
					
					System.err.println(MSERR + ".getDatosFolioPago(): lista:" + listaDatos);
				}
				else
				{
					listaDatos.add(beanDatos);
					beanArrDatos.setData(listaDatos);
				}
			}

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

	/**
	 * 
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static void getDatosPagoAlumno(XEGetDatosFolio beanArrDatos, String matricula)
	{
		String esquema = "db_escuela";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrResp = new ArrayList();

		XEDatosFolioPagoVO beanDatos = new XEDatosFolioPagoVO();
	    ArrayList<XEDatosFolioPagoVO> listaDatos = new ArrayList< XEDatosFolioPagoVO>();
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.append("SELECT ESCTPAGNOMALU, ESCTPAGPERI, ESCTPAGCONC, ESCTPAGCANT, ESCTPAGFECRE FROM ")
						.append(esquema).append(".esctdatregpag WHERE ESCTPAGIDALU = ? ORDER BY ESCTPAGFECRE ASC");
				SQLStatics.doQuery(con, sbQry.toString(), arrResp, true, matricula);

				System.err.println(MSERR + ".getAlumnos(): arrResp:" + arrResp);
				
				if(arrResp.size() > 0)
				{
					int i=0;
					ArrayList arrTmp = new ArrayList();
					for(i = 0; i < arrResp.size(); i++)
					{
						arrTmp = (ArrayList) arrResp.get(i);
						
						beanDatos.setIdFolioReg(arrTmp.get(0).toString());
						beanDatos.setMesPago(arrTmp.get(1).toString());
						beanDatos.setConcepto(arrTmp.get(2).toString());
						beanDatos.setCantidad(arrTmp.get(3).toString());
						beanDatos.setFecha(arrTmp.get(4).toString());
						
						listaDatos.add(beanDatos);
						beanDatos = new XEDatosFolioPagoVO();
						
						if(arrResp.size() == 1)
						{
							listaDatos.add(beanDatos);
						}
					}
					beanArrDatos.setData(listaDatos);
					
					System.err.println(MSERR + ".getAlumnos(): listaAlumnos:" + listaDatos);
				}
				else
				{
					listaDatos.add(beanDatos);
					beanArrDatos.setData(listaDatos);
				}
			}

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
	
	/**
	 * Metodo que valida login
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static String getLogin(String email, String password)
	{
		String esquema = "db_escuela";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrResp = new ArrayList();
		String resp = "";

//		XEDatosFolioVO beanDatos = new XEDatosFolioVO();
//	    ArrayList<XEDatosFolioVO> listaDatos = new ArrayList< XEDatosFolioVO>();
		
		try {
			con = getConnection();

			if (con != null) 
			{
				sbQry.append("SELECT ESCTIDUSUARIO FROM ")
						.append(esquema).append(".esctusuarios WHERE ESCTUSUARIO = ? AND ESCTPASSUSUA = ? LIMIT 1");
				SQLStatics.doQuery(con, sbQry.toString(), arrResp, true, email, password);
				
				System.err.println(MSERR + ".getAlumnos(): sbQry:" + sbQry);
				System.err.println(MSERR + ".getAlumnos(): arrRespAlumnos:" + arrResp);
				
				if(arrResp.size() > 0)
				{
					resp = "OK";
				}
				
			}

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

		return resp;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		XE001Alumnos.getAlumnos();

	}

}
