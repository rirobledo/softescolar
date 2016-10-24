package bean;

import java.sql.SQLException;

import dao.TestDAO;

/**
 * @author psep
 *
 */
public class TestBean {
	
	private TestDAO testDAO;
	
	/**
	 * @return instancia única de TestDAO
	 */
	private TestDAO getTestDAO(){
		if(testDAO == null)
			testDAO = new TestDAO();
		
		return testDAO;
	}
	
	/**
	 * @return mensaje de prueba de conexión
	 */
	public String pruebaConexion(){
		String prueba = "Error de conexión";

		try {
			if(this.getTestDAO().pruebaConexion())
				prueba = "Conexión sin problemas";
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return prueba;	
	}

}
