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

/**
 * Servlet implementation class XEDatosAlumnos
 */
@WebServlet("/XEDatosAlumnos")
public class XEDatosAlumnos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XEDatosAlumnos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		JSONObject JSONObjListaAlumnos = new JSONObject();
		JSONObject JSONObjListaAlumnosResp = new JSONObject();
		JSONObjListaAlumnos = XE001Consultas.obtenerAlumnos();

				
		
		
		try 
		{
			JSONObjListaAlumnosResp = (JSONObject) JSONObjListaAlumnos.get("data");
			
		} 
		catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(JSONObjListaAlumnosResp.optJSONArray("data") != null && JSONObjListaAlumnosResp.optJSONArray("data").length() == 2)
		{
			JSONObject jsonObjTmp = new JSONObject();
			try 
			{
				jsonObjTmp = (JSONObject) JSONObjListaAlumnosResp.optJSONArray("data").get(1);
				
				System.err.println("XEDatosAlumnos." + ".Servlet(): jsonObjTmp.matricula:" + jsonObjTmp.get("matricula"));
				
				if(jsonObjTmp.get("matricula").equals(""))
				{
					JSONObjListaAlumnosResp.optJSONArray("data").remove(1);
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.err.println("XEDatosAlumnos." + ".Servlet(): JSONObjListaAlumnosResp:" + JSONObjListaAlumnosResp.toString());

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjListaAlumnosResp.toString());
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
