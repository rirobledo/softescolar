package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import bean.XE001Consultas;
import bean.XE002RegistrarAlumno;
import bean.XEUtiles;
import bean.vo.XEAltaAlumno;

/**
 * Servlet implementation class XEDatosAlumnos
 */
@WebServlet("/XERegistrarAlumno")
public class XERegistrarAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XERegistrarAlumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		XEAltaAlumno altaAlumno = new XEAltaAlumno();
		JSONObject JSONObjResp = new JSONObject();
		
		/**Datos del Alumno**/
		altaAlumno.setNombre(XEUtiles.getParam(request, "nombre").toUpperCase());
		altaAlumno.setApellidoPat(XEUtiles.getParam(request, "apellidoPat").toUpperCase());
		altaAlumno.setApellidoMat(XEUtiles.getParam(request, "apellidoMat").toUpperCase());
		altaAlumno.setGrado(XEUtiles.getParam(request, "grado"));
		altaAlumno.setFecnacimiento(XEUtiles.getParam(request, "fecnacimiento"));
		altaAlumno.setSexo(XEUtiles.getParam(request, "sexo").toUpperCase());
		altaAlumno.setCurp(XEUtiles.getParam(request, "curp").toUpperCase());
		altaAlumno.setEdad(XEUtiles.getParam(request, "edad"));
		altaAlumno.setCicloEscolar(XEUtiles.getParam(request, "cicloEscolar"));

		/**Datos de Domicilio**/
		altaAlumno.setCalle(XEUtiles.getParam(request, "calle").toUpperCase());
		altaAlumno.setNumExterior(XEUtiles.getParam(request, "numExterior"));
		altaAlumno.setNumInterior(XEUtiles.getParam(request, "numInterior").toUpperCase());
		altaAlumno.setEstado(XEUtiles.getParam(request, "estado").toUpperCase());
		altaAlumno.setMunicipio(XEUtiles.getParam(request, "municipio").toUpperCase());
		altaAlumno.setCiudad(XEUtiles.getParam(request, "ciudad").toUpperCase());
		altaAlumno.setColonia(XEUtiles.getParam(request, "colonia").toUpperCase());
		altaAlumno.setCodpostal(XEUtiles.getParam(request, "codpostal"));

		/**Datos del Padre y Madre***/
		altaAlumno.setPadre(XEUtiles.getParam(request, "padre").toUpperCase());
		altaAlumno.setCellPadre(XEUtiles.getParam(request, "cellPadre"));
		altaAlumno.setProfesionP(XEUtiles.getParam(request, "profesionP").toUpperCase());
		altaAlumno.setEmailP(XEUtiles.getParam(request, "emailP"));
		altaAlumno.setMadre(XEUtiles.getParam(request, "madre").toUpperCase());
		altaAlumno.setCellMadre(XEUtiles.getParam(request, "cellMadre"));
		altaAlumno.setProfesionM(XEUtiles.getParam(request, "profesionM").toUpperCase());
		altaAlumno.setEmailM(XEUtiles.getParam(request, "emailM"));

		
		/**Documentos entregados**/
		altaAlumno.setBoletaOrig(XEUtiles.getParam(request, "boletaOrig"));
		altaAlumno.setBoletaCopy(XEUtiles.getParam(request, "boletaCopy"));
		altaAlumno.setActaNacimientoOrig(XEUtiles.getParam(request, "actaNacimientoOrig"));
		altaAlumno.setActaNacimientoCopy(XEUtiles.getParam(request, "actaNacimientoCopy"));
		altaAlumno.setCartillaVacOrig(XEUtiles.getParam(request, "cartillaVacOrig"));
		altaAlumno.setCartillaVacCopy(XEUtiles.getParam(request, "cartillaVacCopy"));
		altaAlumno.setFotosOrig(XEUtiles.getParam(request, "fotosOrig"));
		altaAlumno.setCertifPreescolarOrig(XEUtiles.getParam(request, "certifPreescolarOrig"));
		altaAlumno.setCertifPreescolarCopy(XEUtiles.getParam(request, "certifPreescolarCopy"));
		altaAlumno.setCertiPrimariaOrig(XEUtiles.getParam(request, "certiPrimariaOrig"));
		altaAlumno.setCertiPrimariaCopy(XEUtiles.getParam(request, "certiPrimariaCopy"));
		
		
		
		JSONObjResp = XE002RegistrarAlumno.InsertarDatosAlumno(altaAlumno);
		
		try 
		{
			JSONObjResp = (JSONObject) JSONObjResp.get("data");
		} 
		catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.err.println("XERegistrarAlumno." + ".Servlet(): resp:" + JSONObjResp);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjResp.toString());
		
	}

}
