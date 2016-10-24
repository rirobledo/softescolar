package cl.psep.dao;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


/**
 * @author psep
 *
 */
public abstract class DataAccessDAO {
	
	/**
	 * @return instancia de conexión
	 */
	protected Connection getConnection(){
		Connection con = null;
		
        try {
            
            Context contextInitial	= new InitialContext();
     	    Context context			= (Context) contextInitial.lookup("java:comp/env");

     	    DataSource ds = (DataSource) context.lookup("jdbc/test");

     	    con = ds.getConnection();

        } catch (Exception e) {
        	e.printStackTrace();
        }
        
		return con;
	}

}
