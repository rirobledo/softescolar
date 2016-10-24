package cl.psep.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDAO extends DataAccessDAO{
	
	/**
	 * @return boolean
	 * @throws SQLException
	 * 
	 * Prueba de conexión devolviendo un boolean
	 */
	public Boolean pruebaConexion() throws SQLException{
		boolean resultado	= false;
		Connection con		= null;
		
		try{
			con = getConnection();
			
			if(con != null)
				resultado = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null)
				con.close();
		}
		
		return resultado;
	}

}
