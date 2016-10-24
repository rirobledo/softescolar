package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import bean.XE002RegistrarAlumno;
import bean.XE003RegistrarPago;
import bean.XEUtiles;
import bean.vo.XEAltaAlumno;
import bean.vo.XERegPago;

/**
 * Servlet implementation class XEDatosAlumnos
 */
@WebServlet("/XERegistrarPago")
public class XERegistrarPago extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XERegistrarPago() {
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
		
		XERegPago altaPago = new XERegPago();
		JSONObject JSONObjResp = new JSONObject();
		
		String mes = "";
		String inscripcion = "";
		String libros = "";
		String uniformes = "";
		String seguroEscolar = "";
		String credenciales = "";
		String copias = "";
		String colegiatura = "";
		String transporteEscolar = "";
		String usuarioAlta = "";
		String idAlumno = "";
		String nomAlumno = "";
		String resp = "";
		
		/**Datos del Pago**/
		altaPago.setIdAlumno(XEUtiles.getParam(request, "idAlumno").toUpperCase());
		altaPago.setNomAlumno(XEUtiles.getParam(request, "nomAlumno").toUpperCase());
		altaPago.setMes(XEUtiles.getParam(request, "mesPago").toUpperCase());
		altaPago.setInscripcion(XEUtiles.getParam(request, "inscripcion").toUpperCase());
		altaPago.setLibros(XEUtiles.getParam(request, "libros"));
		altaPago.setUniformes(XEUtiles.getParam(request, "uniformes"));
		altaPago.setSeguroEscolar(XEUtiles.getParam(request, "seguroescolar").toUpperCase());
		altaPago.setCredenciales(XEUtiles.getParam(request, "credenciales").toUpperCase());
		altaPago.setCopias(XEUtiles.getParam(request, "copias"));
		altaPago.setColegiatura(XEUtiles.getParam(request, "colegiatura").toUpperCase());
		altaPago.setTransporteEscolar(XEUtiles.getParam(request, "transporte"));
		altaPago.setUsuarioAlta(XEUtiles.getParam(request, "usuarioAlta", "99999"));
		
		

		
		
		JSONObjResp = XE003RegistrarPago.InsertarRegistroPago(altaPago);
		
		
		try 
		{
			JSONObjResp = (JSONObject) JSONObjResp.get("data");
		} 
		catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.err.println("XERegistrarPago." + ".Servlet(): resp:" + JSONObjResp);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjResp.toString());
		
	}

}
