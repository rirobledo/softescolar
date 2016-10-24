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
import bean.XEUtiles;


/**
 * Servlet implementation class XEDatosAlumnos
 */
@WebServlet("/XEConsultaLogin")
public class XEConsultaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XEConsultaLogin() {
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
		String email = XEUtiles.getParam(request, "email");
		String password = XEUtiles.getParam(request, "password");
		String resp = "";
		JSONObject JSONObjResp = new JSONObject();
		
		System.err.println("XEConsultaLogin." + "Parametros de entrada_ email:" + email);
		System.err.println("XEConsultaLogin." + "Parametros de entrada_ password:" + password);
		
		
		resp = XE001Consultas.getLogin(email, password);
		
				
		try {			
			
			JSONObjResp.accumulate("resp", resp);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.err.println("XEConsultaLogin." + "Parametros de salida JSONObjResp:" + JSONObjResp);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(JSONObjResp.toString());
		
	}

}
