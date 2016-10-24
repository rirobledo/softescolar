package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import bean.XE001Consultas;
import bean.XEUtiles;

/**
 * Servlet implementation class XEDatosAlumnos
 */
@WebServlet("/XEConsultaRegistros")
public class XEConsultaRegistros extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XEConsultaRegistros() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String consulta = XEUtiles.getParam(request, "consulta").toUpperCase();
		String folio = XEUtiles.getParam(request, "folio").toUpperCase();
		String matricula = XEUtiles.getParam(request, "matricula").toUpperCase();
		
		JSONObject JSONObjListaRegistros = new JSONObject();
		JSONObject JSONObjResp = new JSONObject();
		
		System.err.println("XEConsultaRegistros." + "Parametros de entrada_ Consulta:" + consulta);
		System.err.println("XEConsultaRegistros." + "Parametros de entrada_ folio:" + folio);
		
		if(consulta.equals("REGISTROS"))
		{
		
			JSONObjListaRegistros = XE001Consultas.obtenerRegistros();
		}
		else
		{
			if(consulta.equals("DATOSFOLIOPAGOS"))
			{
			
				JSONObjListaRegistros = XE001Consultas.obtenerDatosFolioPago(folio);
			}
			else
			{
				if(consulta.equals("CONSULTAPAGOS"))
				{
				
					JSONObjListaRegistros = XE001Consultas.consultaDatosPagoAlumno(matricula);
				}
			}
		}

		String resp="";
		
		try 
		{
			System.err.println("XEConsultaRegistros." + "Parametros de entrada_ JSONObjListaRegistros:" + JSONObjListaRegistros);
			if((JSONObject) JSONObjListaRegistros.get("data") != null)
			{
			
				JSONObjResp = (JSONObject) JSONObjListaRegistros.get("data");
			}
		} 
		catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(JSONObjResp.optJSONArray("data") != null && JSONObjResp.optJSONArray("data").length() == 2)
		{
			JSONObject jsonObjTmp = new JSONObject();
			try 
			{
				jsonObjTmp = (JSONObject) JSONObjResp.optJSONArray("data").get(1);
				
				System.err.println("XEConsultaRegistros." + ".Servlet(): jsonObjTmp.matricula:" + jsonObjTmp.get("idFolioReg"));
				
				if(jsonObjTmp.get("idFolioReg").equals(""))
				{
					JSONObjResp.optJSONArray("data").remove(1);
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.err.println("XEConsultaRegistros." + ".Servlet(): JSONObjListaConsultaResp:" + JSONObjResp.toString());

		
		
//		System.err.println("XEConsultaRegistros." + ".Servlet(): resp:" + resp);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjResp.toString());
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String consulta = XEUtiles.getParam(request, "consulta").toUpperCase();
		String folio = XEUtiles.getParam(request, "folio").toUpperCase();
		String matricula = XEUtiles.getParam(request, "matricula").toUpperCase();
		
		JSONObject JSONObjListaRegistros = new JSONObject();
		JSONObject JSONObjResp = new JSONObject();
		
		System.err.println("XEConsultaRegistros." + "Parametros de entrada_ Consulta:" + consulta);
		System.err.println("XEConsultaRegistros." + "Parametros de entrada_ folio:" + folio);
		System.err.println("XEConsultaRegistros." + "Parametros de entrada_ matricula:" + matricula);
		
		if(consulta.equals("REGISTROS"))
		{
		
			JSONObjListaRegistros = XE001Consultas.obtenerRegistros();
		}
		else
		{
			if(consulta.equals("DATOSFOLIOPAGOS"))
			{
			
				JSONObjListaRegistros = XE001Consultas.obtenerDatosFolioPago(folio);
			}
			else
			{
				if(consulta.equals("CONSULTAPAGOS"))
				{
				
					JSONObjListaRegistros = XE001Consultas.consultaDatosPagoAlumno(matricula);
				}
			}
		}

		String resp="";
		
		try 
		{
			JSONObjResp = (JSONObject) JSONObjListaRegistros.get("data");
		} 
		catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println("XEConsultaRegistros." + ".Servlet(): JSONObjListaAlumnosResp:" + JSONObjResp.toString());

		
		
		System.err.println("XEConsultaRegistros." + ".Servlet(): resp:" + resp);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjResp.toString());
	}

}
