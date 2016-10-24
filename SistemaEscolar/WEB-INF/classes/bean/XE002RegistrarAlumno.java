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
import conexion.DataAccessDAO;
import java.sql.Connection;
import java.sql.SQLException;

public class XE002RegistrarAlumno extends DataAccessDAO {

	private final static String MSINF = "MSINF." + XE002RegistrarAlumno.class.getName();
	private final static String MSERR = "MSERR." + XE002RegistrarAlumno.class.getName();

	/**
	 * iNSERTA DATOS DE ALUMNOS
	 * @param altaAlumno
	 * @return
	 */
	public static JSONObject InsertarDatosAlumno(XEAltaAlumno altaAlumno) {
		JSONObject JSONObjRespRegistro = new JSONObject();

		
		JSONObjRespRegistro = XE002RegistrarAlumno.setAlumnos(altaAlumno);
	
		
		System.err.println(MSERR + ".InsertarDatosAlumno(): JSONObjRespRegistro:" + JSONObjRespRegistro);
		
		return JSONObjRespRegistro;
	}

	
	/**
	 * Metodo que obtiene las prioridades de las tecnologias
	 * 
	 * @param esquema
	 * @param aplicacion
	 * @param ciudad
	 * @return
	 */
	public static JSONObject setAlumnos(XEAltaAlumno altaAlumno)
	{
		String esquema = "db_escuela";
		String resp = "";
		Connection con = null;
		StringBuffer sbQry = new StringBuffer();
		ArrayList arrRespAlumnos = new ArrayList();
		ArrayList arrParams = new ArrayList();
		ArrayList arrParams2 = new ArrayList();
		ArrayList arrParams3 = new ArrayList();
		StringBuffer idAlumno = new StringBuffer();
		ArrayList arrFolioReg = new ArrayList();
		XEAlumnosVO beanAlumno = new XEAlumnosVO();
	    ArrayList<XEAlumnosVO> listaAlumnos = new ArrayList< XEAlumnosVO>();
	    JSONObject JSONRespFolio = new JSONObject();
	    
	    XEDatosFolioVO beanDatosFolio = new XEDatosFolioVO();
		
		try {
			con = getConnection();

			
			arrParams.add(altaAlumno.getNombre());
			arrParams.add(altaAlumno.getApellidoPat());
			arrParams.add(altaAlumno.getApellidoMat());
			arrParams.add(altaAlumno.getFecnacimiento());
			arrParams.add(altaAlumno.getEdad());
			arrParams.add(altaAlumno.getGrado());
			arrParams.add(altaAlumno.getCicloEscolar());
			arrParams.add(altaAlumno.getCurp());
			arrParams.add(altaAlumno.getSexo());
			arrParams.add(altaAlumno.getCellPadre());
			
			System.err.println(MSERR + ".setAlumnos(): Parámetros Insert Alumno:" + arrParams);
			
			if (con != null) 
			{
				sbQry.append("INSERT INTO ").append(esquema).append(".esctdatalumno (ESCTALUNOMB, ESCTALUAPAT, ESCTALUAMAT, ESCTALUFECNA, ESCTALUEDAD, ESCTALUGRADO, ESCTALUCICLOES,ESCTALUESTAT, ESCTALUFECH, ESCTALUCURP, ESCTALUSEXO, ESCTALUTELCASA, ESCTALUIDEMP) ");
				sbQry.append(" VALUES(?,?,?,?,?,?,?,'ACTIVO',CURRENT_TIMESTAMP, ?, ?, ?, '99999')");
				resp = SQLStatics.doUpdateMain(con, sbQry.toString(), arrParams);
				

				System.err.println(MSERR + ".setAlumnos(): Respuesta Insert Alumno:" + resp);
				
				if(resp.startsWith("OK"))
				{
					arrParams3.add(altaAlumno.getNombre());
					arrParams3.add(altaAlumno.getApellidoPat());
					arrParams3.add(altaAlumno.getApellidoMat());
					arrParams3.add(altaAlumno.getCurp());
					
					sbQry.delete(0, sbQry.length());
					sbQry.append("SELECT ESCTALUIDALU FROM ").append(esquema).append(".esctdatalumno WHERE ESCTALUNOMB = ? AND ESCTALUAPAT = ? AND ESCTALUAMAT = ? AND ESCTALUCURP = ? LIMIT 1");

					SQLStatics.doQueryMain(con, sbQry.toString(), idAlumno, true, arrParams3);
					
//					SQLStatics.doQuery(con, sbQry.toString(), arrIDs, true, ejeX, ejeY, fecha);
					
					
					if(idAlumno.length() > 0)
					{
						arrParams2.add(idAlumno.toString());
						arrParams2.add(altaAlumno.getNombre()+" "+altaAlumno.getApellidoPat()+" "+altaAlumno.getApellidoMat());
						arrParams2.add(altaAlumno.getGrado());
						
						sbQry.delete(0, sbQry.length());
						sbQry.append("INSERT INTO ").append(esquema).append(".esctgenfolio (ESCTFOLIDALUM, ESCTFOLALUM, ESCTFOLGRADO, ESCTFOLFECREG) ");
						sbQry.append(" VALUES(?,?,?,CURRENT_TIMESTAMP) ");
						resp = SQLStatics.doUpdateMain(con, sbQry.toString(), arrParams2);
						
						System.err.println(MSERR + ".setAlumnos(): Respuesta Insert Folio Registro:" + resp);
						
						if(resp.startsWith("OK"))
						{
							sbQry.delete(0, sbQry.length());
							sbQry.append("SELECT ESCTIDFOLIO, ESCTFOLFECREG FROM ").append(esquema).append(".esctgenfolio WHERE ESCTFOLIDALUM = ? AND ESCTFOLALUM = ? AND ESCTFOLGRADO = ? LIMIT 1");

							SQLStatics.doQueryMain(con, sbQry.toString(), arrFolioReg, true, arrParams2);
							
							System.err.println(MSERR + ".setAlumnos(): Respuesta Folio de Registro:" + arrFolioReg);
							
						}
						String folioReg = "";
						String fechaReg = "";
						ArrayList arrTmp = new ArrayList();
						
						if(arrFolioReg.size() > 0)
						{
							arrTmp = (ArrayList) arrFolioReg.get(0);
							folioReg = arrTmp.get(0).toString();
							fechaReg = arrTmp.get(1).toString();
						}
						
						beanDatosFolio.setIdFolioReg(folioReg);
						beanDatosFolio.setNombreAlumno(altaAlumno.getNombre()+" "+altaAlumno.getApellidoPat()+" "+altaAlumno.getApellidoMat());
						beanDatosFolio.setGrado(altaAlumno.getGrado());
						beanDatosFolio.setFechaHrRegistro(fechaReg);
						
						
						JSONRespFolio = XEUtiles.convertirBeanVOToJSON(beanDatosFolio, XEDatosFolioVO.class);
						
						/**************************DATOS DOMICILIO**********************************/
						arrParams3.clear();
						arrParams3.add(idAlumno.toString());
						arrParams3.add(altaAlumno.getCalle());
						arrParams3.add(altaAlumno.getNumExterior());
						arrParams3.add(altaAlumno.getNumInterior());
						arrParams3.add(altaAlumno.getEstado());
						arrParams3.add(altaAlumno.getMunicipio());
						arrParams3.add(altaAlumno.getCiudad());
						arrParams3.add(altaAlumno.getCodpostal());
						arrParams3.add("MEXICO");
						
											
						
						sbQry.delete(0, sbQry.length());
						sbQry.append("INSERT INTO ").append(esquema).append(".esctdatdomi (ESCTDOMIDALUM, ESCTDOMCALLE, ESCTDOMNUME, ESCTDOMNUMI, ESCTDOMDESEST, ESCTDOMDESMUN, ESCTDOMDESCIU, ESCTDOMCP, ESCTDOMDESPAIS, ESCTDOMFECH, ESCTEMPIDEMP) ");
						sbQry.append(" VALUES(?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,'99999') ");
						resp = SQLStatics.doUpdateMain(con, sbQry.toString(), arrParams3);
						
						System.err.println(MSERR + ".setAlumnos(): Respuesta Insert Domicilio:" + resp);
						
						
						/**************************DATOS TUTOR**********************************/
						arrParams3.clear();
						arrParams3.add(idAlumno.toString());
						arrParams3.add(altaAlumno.getPadre());
						arrParams3.add(altaAlumno.getCellPadre());
						arrParams3.add(altaAlumno.getCellPadre());
						arrParams3.add(altaAlumno.getEmailP());
						arrParams3.add(altaAlumno.getMadre());
						arrParams3.add(altaAlumno.getCellMadre());
						arrParams3.add(altaAlumno.getCellMadre());
						arrParams3.add(altaAlumno.getEmailM());
											
						System.err.println(MSERR + ".setAlumnos(): Parámetros Insert Tutores:" + arrParams3);					
						
						sbQry.delete(0, sbQry.length());
						sbQry.append("INSERT INTO ").append(esquema).append(".esctdattutores (ESCTTUTIDALUM, ESCTTUT1NOM, ESCTTUT1TEL, ESCTTUT1CEL, ESCTTUT1EMAIL, ESCTTUT2NOM, ESCTTUT2TEL, ESCTTUT2CEL, ESCTTUT2EMAIL, ESCTTUTFECH, ESCTTUTIDEMP) ");
						sbQry.append(" VALUES(?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,'99999') ");
						resp = SQLStatics.doUpdateMain(con, sbQry.toString(), arrParams3);
						
						System.err.println(MSERR + ".setAlumnos(): Respuesta Insert Domicilio:" + resp);
						
						
						/**************************DATOS DOCUMENTOS**********************************/
						arrParams2.clear();
						
						arrParams2.add("BOLETA ORIGINAL");
						arrParams2.add("BOLETA COPIA");
						arrParams2.add("ACTA DE NACIMIENTO ORIGINAL");
						arrParams2.add("ACTA DE NACIMIENTO COPIA");
						arrParams2.add("CARTILLA DE VACUNACION ORIGINAL");
						arrParams2.add("CARTILLA DE VACUNACION COPIA");
						arrParams2.add("FOTOS ORIGINAL");
						arrParams2.add("CERTIFICADO DE PREESCOLAR ORIGINAL");
						arrParams2.add("CERTIFICADO DE PREESCOLAR COPIA");
						arrParams2.add("CERTIFICADO DE PRIMARIA ORIGINAL");
						arrParams2.add("CERTIFICADO DE PRIMARIA COPIA");
						
						arrParams3.clear();
						//arrParams3.add(idAlumno.toString());
						arrParams3.add(altaAlumno.getBoletaOrig());
						arrParams3.add(altaAlumno.getBoletaCopy());
						arrParams3.add(altaAlumno.getActaNacimientoOrig());
						arrParams3.add(altaAlumno.getActaNacimientoCopy());
						arrParams3.add(altaAlumno.getCartillaVacOrig());
						arrParams3.add(altaAlumno.getCartillaVacCopy());
						arrParams3.add(altaAlumno.getFotosOrig());
						arrParams3.add(altaAlumno.getCertifPreescolarOrig());
						arrParams3.add(altaAlumno.getCertifPreescolarCopy());
						arrParams3.add(altaAlumno.getCertiPrimariaOrig());
						arrParams3.add(altaAlumno.getCertiPrimariaCopy());
						
					
						System.err.println(MSERR + ".setAlumnos(): Parametros Insert Documentos ID ALUMNO::" + idAlumno.toString());					
						for(int i=0; i < arrParams3.size(); i++)
						{
						
							System.err.println(MSERR + ".setAlumnos(): Parametros Insert Documentos:("+i+")" + arrParams2.get(i).toString()+":"+ arrParams3.get(i).toString());
							
							if(arrParams3.get(i).toString().length() > 0)
							{
								sbQry.delete(0, sbQry.length());
								sbQry.append("INSERT INTO ").append(esquema).append(".esctdocument (ESCTDOCIDALU, ESCTDOCUMENTO, ESCTDOCENTREGO, ESCTDOCFECHA, ESCTDOCIDEMP) ");
								sbQry.append(" VALUES(?,?,?,CURRENT_TIMESTAMP,'99999') ");
								resp = SQLStatics.doUpdate(con, sbQry.toString(), idAlumno.toString(),arrParams2.get(i).toString(), arrParams3.get(i).toString());
								
								System.err.println(MSERR + ".setAlumnos(): Respuesta Insert Documentos:" + resp);
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

		return JSONRespFolio;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		XE001Alumnos.getAlumnos();

	}


}
