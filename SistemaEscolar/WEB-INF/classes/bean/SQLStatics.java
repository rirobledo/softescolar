package bean;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.log4j.Logger;
/**
 * @version 2.0.0.3 Ultima Actualizacion : 05-OCT-2007
 *  
 * @author: Roberto Corona.<br>
 * Fecha de Creación:  10/04/2007.<br>
 * Compañía: ZENTRUM ZIZTEMAZ.<br>
 * <b>Descripción del programa:</b><br><br>
 *     
 * 	 Encapsula metodos para simplificar consultas SQL utilizando sentencias preparadas.
 * 	 (PreparedStatements).
 * 
 * 	Se recomienda instanciar esta clase cuando se van a realizar diferentes consultas o actualizaciones
 *  sobre una misma sentencia utilizando diferentes parametros.Ver metodos:
 * 	openSentencia(),setParam(),runPreparedQuery(),runPreparedUpdate() y closeSentencia(). 
 * 
 * Para consultas o actualizaciones
 *  aisladas se recomienda utilizar los metodos estaticos.
 * 
 *------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: RCC01	<br>
 * Autor: Roberto Corona<br>
 * Fecha: 10/05/2007<br>
 * Descripción:<br><br>
 * 
 * 			Cerrar ResultSet dentro de un finally.
 *------------------------------------------------------------------<br> 
 ------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: RCC02	<br>
 * Autor: Roberto Corona<br>
 * Fecha: (25/05/2007)<br>
 * Descripción:<br><br>
 * 	Modificaciones necesarias para que el OptimalAdvisor detecte correctamente el 'casting' de tipo de objetos.
 ------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: RCC010	<br>
 * Autor: Roberto Corona<br>
 * Fecha: 5/10/2007.<br>
 * Descripción:<br><br>
 * 	
 * 	Cerrar preparedstatement en finally.
 *------------------------------------------------------------------<br>
 *
 * 
 * ------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: GRG01	<br>
 * Autor: Gabriel Romero<br>
 * Fecha: (28/01/2011)<br>
 * Descripción:<br><br>
 * 
 *          Se añadio la clase Logger para visualizar el resultado de los tiempos de ejecucion   
 * 	
 ------------------------------------------------------------------<br>
* MODIFICACIONES:<br>
*------------------------------------------------------------------<br>
* Clave: JCH01	<br>
* Autor: Javier Coria Hernandez<br>
* Fecha: (14/12/2011)<br>
* Descripción:<br><br>
*   Se retiro el Logger para medir los tiempos, se dejo solo con los Logs 	
*------------------------------------------------------------------<br>
 *
 * 
 **/
public class SQLStatics
{ 
    //private final static String  MSERR                    = new StringBuffer(0).append("plantaHSI.MSERR").append("_B_SQLSTATICS.").toString();
    //private static final String  HD                       = "B_" + SQLStatics.class.getName().substring(SQLStatics.class.getName().lastIndexOf(".") + 1);
    //private static LoggerAdapter _log                     = ModuloWEB.getLoggerGlobal();
	private final static Logger logger = Logger.getLogger("ApisExternasPlanta");
	private final static String MSINF 	= "MSINF."+SQLStatics.class.getName()+".";
	private final static String MSERR 	= "MSERR."+SQLStatics.class.getName()+".";

    /**Seccion de valores CONSTANTES */
    public static final String   VERSION                  = "Version 2.0(Ultima Mod.10-ABR-2007)";
    /********************************************************************************************************
     DECLARACION DE NOMBRE DE FUNCIONES SOPORTADAS.*********************************************************/
    /** Concatena la primer columna de cada registro encontrado**/
    public static final String   FUNCTION_CONCATENAR_COLS = "@concatenarColumnas";
    /********************************************************************************************************
     
     
     /**Seccion de VARIABLES */
    private PreparedStatement    _Pst                     = null;
    private String               _Sentencia               = null;


    /**
     * Constructor 
     */
    public SQLStatics()
    {
        super();
    }


    /**************************************************************************************************************
     * 					INICIO DE SECCION DE METODOS UTILIZADOS CUANDO SE INSTANCIA LA CLASE.
     * *************************************************************************************************************
     **************************************************************************************************************/
    /**
     * Preparar un objeto PreparedStatement para ejecutar la sentencia
     * indicada en el parametro. 
     */
    public boolean openSentencia(Connection con, String sentencia)
    {
        closeSentencia();
        this._Pst = getPStatement(con, sentencia, null);
        if (this._Pst != null)
        {
            this._Sentencia = sentencia;
        }
        return this._Pst != null;
    }


    /**
     * Una vez que la sentencia ha sido preparada, este metodo es utilizado para
     * definir los valores de los parametros. 
     */
    public boolean setParam(int i, Object valor)
    {
        boolean bResp = false;
        try
        {
            this._Pst.setString(i, valor.toString());
            bResp = true;
        }
        catch (Exception e)
        {
            StringBuffer msg = new StringBuffer();
            if (this._Pst != null)
            {
                msg.append("ERROR al asignar valor [" + valor + "] al parametro #" + i + ". en sentencia [" + this._Sentencia + "].Mensaje de evento 'Exception' : " + e.toString());
                msg.append("\nEL OBJETO PREPARADO (PreparedStatement) SERA DESHABILITADO(CERRADO).");
                String sentenciaTmp = this._Sentencia; //Preservar la sentencia.
                closeSentencia();
                this._Sentencia = sentenciaTmp;
            }
            else
            {
                msg.append("Objeto 'PreparedStatement' NULO.");
            }
            //_log.logErr(HD, ".setParam()_ ", msg);
            logger.error(MSERR + ".setParam()_ "+msg);
        }
        return bResp;
    }


    /**
     * Ejecuta el query previamente preparado
     * y coloca el resultado en el objeto 'contenedor'.
     */
    public final boolean runPreparedQuery(Object contenedor, boolean trimString ) 
    {
        String resp = null;
        boolean bResp = true;
        resp = exeQuery(this._Pst, contenedor, trimString, "" ); /**&HTMP GRG01 */
        if (!resp.equals("OK"))
        {
            bResp = false;
            //_log.logErr(HD, ".runPreparedQuery()_ Problemas con sentencia [", this._Sentencia, "]. Detalle del problema :", resp);
            logger.error(MSERR + ".runPreparedQuery()_ Problemas con sentencia ["+this._Sentencia+"]. Detalle del problema :"+resp);
        }
        return bResp;
    }


    /**
     * Ejecuta el query de ACTUALIZACION (insert,update,delete) previamente preparado. Retorna un mensaje
     * concatenado, ya sea <br>
     * "OK:{n}" Donde 'n' es el numero de registros actualizados. <br>
     * ERROR:{mensaje} : En donde 'mensaje' describe el problema encontrado. <br>
     * {cadena vacia}	: Retornara cadena vacia cuando no se encuentre el registro que se quiere actualizar.
     */
    public final String runPreparedUpdate()
    {
        String resp = null;
        resp = exeUpdate(this._Pst, this._Sentencia);
        if (!resp.startsWith("OK"))
        {
            if (resp.startsWith("ERROR"))
            {
                //_log.logErr(HD, ".runPreparedUpdate()_ Problemas con sentencia de actualizacion [", this._Sentencia, "].Detalle del problema : ", resp);
                logger.error(MSERR + ".runPreparedUpdate()_ Problemas con sentencia de actualizacion ["+
                		this._Sentencia+"].Detalle del problema : "+resp);
            }
        }
        return resp;
    }


    /**
     * Metodo utilizado para saber si el objeto 'PreparedStatement' esta bien preparado y listo
     * para ejecutarse.
     */
    public final boolean isValido()
    {
        return this._Pst != null;
    }


    /**
     * Cerrar la sentencia Preparada. 
     */
    public void closeSentencia()
    {
        try
        {
            if (this._Pst != null)
            {
                this._Pst.close();
            }
        }
        catch (Exception ex)
        {
            //_log.logErr(HD, ".closeSentencia()_ Erro:", ex);
        	logger.error(MSERR + ".closeSentencia()_ Erro:"+ex);
        }
        this._Pst = null;
        this._Sentencia = null;
    }


    /**************************************************************************************************************
     * 					INICIO DE SECCION DE METODOS ESTATICOS UTILIZADOS
     * 					PARA ***CONSULTAS****
     **************************************************************************************************************
     **************************************************************************************************************/

    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>0 parametros</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings)
    {
        return doQueryMain(con, sentencia, contenedor, trimStrings, null);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>1 parametro</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings, String par0)
    {
        String arr[] = new String[1];
        arr [0] = par0;
        return doQueryMain(con, sentencia, contenedor, trimStrings, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>2 parametros</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings, String par0, String par1)
    {
        String arr[] = new String[2];
        arr [0] = par0;
        arr [1] = par1;
        return doQueryMain(con, sentencia, contenedor, trimStrings, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>3 parametros</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings, String par0, String par1, String par2)
    {
        String arr[] = new String[3];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;
        return doQueryMain(con, sentencia, contenedor, trimStrings, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>4 parametros</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings, String par0, String par1, String par2, String par3)
    {
        String arr[] = new String[4];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;
        arr [3] = par3;
        return doQueryMain(con, sentencia, contenedor, trimStrings, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doQueryMain(Connection con,String sentencia,Object contenedor,boolean trimStrings,String arrParms[])</b><br>
     * utilizando <b>5 parametros</b>. 
     * El cual ejecuta la sentencia SQL  y coloca el resultado en el parametro 'contenedor'
     */
    public static final boolean doQuery(Connection con, String sentencia, Object contenedor, boolean trimStrings, String par0, String par1, String par2, String par3, String par4)
    {
        String arr[] = new String[5];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;
        arr [3] = par3;
        arr [4] = par4;
        return doQueryMain(con, sentencia, contenedor, trimStrings, arr);
    }


    /**
     * Ejecuta la sentencia SQL y coloca el resultado en el objeto 'contenedor'(NO DEBE SER NULO).<br>
     * El tipo de objeto 'contenedor' es el que ayudara a determinar lo que nos interesa de la consulta
     * y como deseamos el resultado. A continuacion se muestran los tipos y su correspondiente salida:<br> 
     * <b>Vector</b>		--->	Arreglo(vector de vectores). <br>
     * <b>ArrayList</b>		--->	Arreglo(ArrayList de ArrayList's).<br>
     * <b>StringBuffert</b>	--->	El contenido de la columna 0/fila 0.<br>
     * <b>Hashtablet</b>	--->	El primer registro de la consulta(utilizando el nombre del campo como llave).<br>   
     * <b>Hashmap</b>		--->	El primer registro de la consulta(utilizando el nombre del campo como llave).<br>
     * El objeto 'listaDeParametros' puede ser de cualquiera de los siguientes tipos:<br>
     * 	<b>Object[]</b><br>
     *  <b>String[]</b><br>
     *  <b>java.util.List</b><br>
     * @return
     * 		"OK" en caso de exito o mensaje de error (en caso de error SQL)
     */
    public static final boolean doQueryMain(Connection con, String sentencia, Object contenedor, boolean trimStrings, Object listaDeParametros) 
    {

        PreparedStatement pst = null;
        boolean bResp = true;

        try
        //RCC10
        {
            pst = getPStatement(con, sentencia, listaDeParametros);
            if (pst != null)
            {
                String resp = null;
                resp = exeQuery(pst, contenedor, trimStrings, sentencia); 

                if (!resp.equals("OK"))
                {
                    bResp = false;
                    //_log.logErr(HD, ".doQueryMain()_ Problemas con sentencia [", sentencia, "]. Parametros=", arrToString(listaDeParametros), ". Detalle del problema : ", resp);
                	logger.error(MSERR + ".doQueryMain()_ Problemas con sentencia ["+sentencia+
                		"]. Parametros="+arrToString(listaDeParametros)+". Detalle del problema : "+resp);
                }
            }
            else
            {
                bResp = false;
            }
        }
        catch (Exception e)
        {
            //_log.logErr(HD, ".doQueryMain()_ Exception=", e);
        	logger.error(MSERR + ".doQueryMain()_ Exception="+e);
            bResp = false;
        }
        finally
        //RCC10
        {
            try
            {
                if (pst != null)
                {
                    pst.close();
                }
            }
            catch (Exception ex)
            {
                //_log.logErr(HD, ".doQueryMain()_ Error:", ex);
            	logger.error(MSERR + ".doQueryMain()_ Error:"+ex);
            }
            finally
            {
                pst = null;
            }
        }

        return bResp;
    }


    /**
     * Ejecuta la sentencia SQL y coloca el resultado en el objeto 'contenedor'(NO DEBE SER NULO).<br>
     * El tipo de objeto 'contenedor' es el que ayudara a determinar lo que nos interesa de la consulta
     * y como deseamos el resultado. A continuacion se muestran los tipos y su correspondiente salida:<br> 
     * <b>Vector</b>		--->	Arreglo(vector de vectores). <br>
     * <b>ArrayList</b>		--->	Arreglo(ArrayList de ArrayList's).<br>
     * <b>StringBuffert</b>	--->	El contenido de la columna 0/fila 0.<br>
     * <b>Hashtablet</b>	--->	El primer registro de la consulta(utilizando el nombre del campo como llave).<br>   
     * <b>Hashmap</b>		--->	El primer registro de la consulta(utilizando el nombre del campo como llave).<br>
     * El objeto 'listaDeParametros' puede ser de cualquiera de los siguientes tipos:<br>
     * 	<b>Object[]</b><br>
     *  <b>String[]</b><br>
     *  <b>java.util.List</b><br>
     * @return
     * 		"OK" en caso de exito o mensaje de error (en caso de error SQL)
     */
    public static final boolean doQueryMain(Connection con, String sentencia, Object contenedor, boolean trimStrings, Object listaDeParametros, boolean arregloMaps)
    {
        PreparedStatement pst = null;
        boolean bResp = true;

        try
        //RCC10
        {
            pst = getPStatement(con, sentencia, listaDeParametros);
            if (pst != null)
            {
                String resp = null;
                resp = exeQuery(pst, contenedor, trimStrings, arregloMaps, sentencia);
                if (!resp.equals("OK"))
                {
                    bResp = false;
                    //_log.logErr(MSERR,".doQueryMain()_ Problemas con sentencia [",sentencia, "]. Parametros="+listaDeParametros+". Detalle del problema : "+resp);
                	logger.error(MSERR + ".doQueryMain()_ Problemas con sentencia ["+sentencia+
                		"]. Parametros="+listaDeParametros+". Detalle del problema : "+resp);
                }
            }
            else
            {
                bResp = false;
            }
        }
        catch (Exception e)
        {
            //_log.logErr(MSERR,".doQueryMain()_ "+e);
        	logger.error(MSERR + ".doQueryMain()_ "+e);
            e.printStackTrace();
            bResp = false;
        }
        finally
        //RCC10
        {
            try
            {
                if (pst != null)
                {
                    pst.close();
                }
            }
            catch (Exception ex)
            {
                //_log.logErr(MSERR,".doQueryMain()_ "+ex);
            	logger.error(MSERR + ".doQueryMain()_ "+ex);
                ex.printStackTrace();
            }
            finally
            {
                pst = null;
            }
        }
        return bResp;
    }


    /**
     * 
     * Ejecuta la sentencia preparada 'pst', la cual debio haber sido ya inicializada y configurada
     * con los parametros necesarios. El resultado final lo vuelca dentro del objeto contenedor. 
     */
    private static final String exeQuery(PreparedStatement pst, Object contenedor, boolean trimStrings, boolean arregloMaps, String sentenciaSQL)
    {
        ResultSet rs = null;
        ResultSetMetaData md = null;
        String resp = "OK";
        try
        {
            
         // GRG01
            
            //_log.logInf(HD,".exeQuery()_ sentenciaSQL: ",sentenciaSQL);
        	logger.info(MSERR + ".exeQuery()_ sentenciaSQL: "+sentenciaSQL);
            
            rs = pst.executeQuery();

            if (contenedor instanceof StringBuffer)
            {
                StringBuffer sbContenedor = (StringBuffer) contenedor;//RCC02

                readResultSet(rs, sbContenedor, trimStrings);
            }
            else
            {
                md = rs.getMetaData();
                if (contenedor instanceof ArrayList)
                {
                    ArrayList<Serializable> arrContenedor = (ArrayList<Serializable>) contenedor;//RCC02
                    if (arregloMaps)
                    {
                        readResultSet2(rs, arrContenedor, trimStrings, md);
                    }
                    else
                    {
                        readResultSet(rs, arrContenedor, trimStrings, md);
                    }
                }
                else
                {
                    if (contenedor instanceof Vector)
                    {
                        Vector<Serializable> vContenedor = (Vector<Serializable>) contenedor;//RCC02

                        readResultSet(rs, vContenedor, trimStrings, md);
                    }
                    else if (contenedor instanceof Map)
                    {
                        Map<String, String> mContenedor = (Map<String, String>) contenedor;//RCC02

                        readResultSet(rs, mContenedor, trimStrings, md);
                    }
                    else
                    {
                        resp = "Tipo de CONTENEDOR no soportado { " + contenedor.getClass().getName() + "} para colocar resultado de consulta.";
                    }
                }
            }
        }
        catch (Exception e)
        {
            if (pst != null)
            {
                e.printStackTrace();
                resp = e.toString();
            }
            else
            {
                resp = "Object PreparedStatement NULO.";
            }
        }
        finally
        //RCC02
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
            }
            catch (Exception ex)
            {
                //_log.logErr(MSERR,".exeQuery()_ ", ex);
            	logger.error(MSERR + ".exeQuery()_ "+ex);
                ex.printStackTrace();
            }
            finally
            {
                rs = null;
            }
        }
        return resp;
    }


    /**
     * CRB01: Se crea metodo para regresar rs como arreglo de HashMaps
     */
    private static final void readResultSet2(ResultSet rs, ArrayList<Serializable> arrDataOut, boolean trimStrings, ResultSetMetaData md) throws Exception
    {
        HashMap<String, String> hmDatos = null;
        int cols = 0;
        int i = 0;

        try
        {

            if (!(rs == null))
            {
                hmDatos = new HashMap<String, String>();
                cols = md.getColumnCount();

                while (rs.next())
                {
                    for (i = 1; i < cols + 1; i++)
                    {
                        hmDatos.put(md.getColumnName(i).toString().toLowerCase().replaceAll("ñ", "n"), trimStrings ? trim(rs.getString(i)) : noNulos(rs.getString(i)));
                    }
                    arrDataOut.add((Serializable) hmDatos.clone());
                    hmDatos.clear();
                }
            }

        }
        catch (Exception ex)
        {
            //_log.logErr(MSERR,".closeSentencia()_ ",ex);
        	logger.error(MSERR + ".closeSentencia()_ "+ex);
            ex.printStackTrace();
        }
    }


    /**
     * 
     * Ejecuta la sentencia preparada 'pst', la cual debio haber sido ya inicializada y configurada
     * con los parametros necesarios. El resultado final lo vuelca dentro del objeto contenedor. 
     */
    private static final String exeQuery(PreparedStatement pst, Object contenedor, boolean trimStrings, String sentenciaSQL) /**&HTMP GRG01*/ 
    {
        ResultSet rs = null;
        ResultSetMetaData md = null;
        String resp = "OK";
        try
        {
            // GRG01
            
            
         //   _log.logInf(HD,".exeQuery()_ sentenciaSQL", sentenciaSQL);

            rs = pst.executeQuery();

            if (contenedor instanceof StringBuffer)
            {
                StringBuffer sbContenedor = (StringBuffer) contenedor;//RCC02

                readResultSet(rs, sbContenedor, trimStrings);
            }
            else
            {
                md = rs.getMetaData();
                if (contenedor instanceof ArrayList)
                {
                    ArrayList<Serializable> arrContenedor = (ArrayList<Serializable>) contenedor;//RCC02

                    readResultSet(rs, arrContenedor, trimStrings, md);
                }
                else
                {
                    if (contenedor instanceof Vector)
                    {
                        Vector<Serializable> vContenedor = (Vector<Serializable>) contenedor;//RCC02

                        readResultSet(rs, vContenedor, trimStrings, md);
                    }
                    else if (contenedor instanceof Map)
                    {
                        Map<String, String> mContenedor = (Map<String, String>) contenedor;//RCC02

                        readResultSet(rs, mContenedor, trimStrings, md);
                    }
                    else
                    {
                        resp = "Tipo de CONTENEDOR no soportado {" + contenedor.getClass().getName() + "} para colocar resultado de consulta.";
                    }
                }
            }
        }
        catch (Exception e)
        {
            if (pst != null)
            {
                e.printStackTrace();
                resp = e.toString();
            }
            else
            {
                resp = "Object PreparedStatement NULO.";
            }
        }
        finally
        //RCC02
        {
            try
            {
                if (rs != null)
                {
                    rs.close();
                }
            }
            catch (Exception ex)
            {
                //_log.logErr(HD, ".exeQuery()_ Error:", ex);
            	logger.error(MSERR + ".exeQuery()_ Error:"+ex);
            }
            finally
            {
                rs = null;
            }
        }
        return resp;
    }


    /**************************************************************************************************************
     * 					INICIO DE SECCION DE METODOS ESTATICOS UTILIZADOS
     * 					PARA ***ACTUALIZACIONES (INSERT/DELETE/UPDATE)****
     **************************************************************************************************************
     **************************************************************************************************************/

    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>0 parametros</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia)
    {
        return doUpdateMain(con, sentencia, null);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>1 parametro</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia, String par0)
    {
        String arr[] = new String[1];
        arr [0] = par0;

        return doUpdateMain(con, sentencia, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>2 parametro</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia, String par0, String par1)
    {
        String arr[] = new String[2];
        arr [0] = par0;
        arr [1] = par1;

        return doUpdateMain(con, sentencia, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>3 parametro</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia, String par0, String par1, String par2)
    {
        String arr[] = new String[3];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;

        return doUpdateMain(con, sentencia, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>4 parametro</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia, String par0, String par1, String par2, String par3)
    {
        String arr[] = new String[4];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;
        arr [3] = par3;

        return doUpdateMain(con, sentencia, arr);
    }


    /**
     * Invoca el metodo:<br>
     * <b>doUpdateMain(Connection con,String sentencia,String arrParms[])</b><br>
     * utilizando <b>5 parametro</b>. 
     * El cual ejecuta la sentencia de actualizacion SQL(insert/update/delete).
     */
    public static final String doUpdate(Connection con, String sentencia, String par0, String par1, String par2, String par3, String par4)
    {
        String arr[] = new String[5];
        arr [0] = par0;
        arr [1] = par1;
        arr [2] = par2;
        arr [3] = par3;
        arr [4] = par4;

        return doUpdateMain(con, sentencia, arr);
    }


    /**
     * Ejecuta la sentencia SQL (sentencias de actualizacion solamente UPDATE,INSERT,DELETE)
     * utilizando los parametros contenidos en el objeto llamado 'listadoDeParametros'. 
     * El objeto 'listaDeParametros' puede ser de cualquiera de los siguientes tipos:<br>
     * 	<b>Object[]</b><br>
     *  <b>String[]</b><br>
     *  <b>java.util.List</b><br>
     * @return Una cadena en el sig. formato:<br>
     * <b>OK:{n}</b>  			Donde n es el numero de registros (insertados,borrados o actualizados)<br>
     * <b>ERROR:{mensaje}</b>	Donde 'mensaje' sera el mensaje de error producido en caso de error.<br>
     * <b>{cadena vacia}</b>	En caso de que el resultado sea 0 Registros actualizados.
     */
    public static final String doUpdateMain(Connection con, String sentencia, Object listadoDeParametros)
    {
        
        PreparedStatement pst = null;
        String resp = "";

        pst = getPStatement(con, sentencia, listadoDeParametros);
        if (pst != null)
        {
            /**&HTMP GRG01 */
            resp = exeUpdate(pst, sentencia);
            
            if (resp.startsWith("ERROR"))
            {
                //_log.logErr(HD, ".doUpdateMain()_ Problemas con sentencia de actualzacion [", sentencia, "]. Parametros=", arrToString(listadoDeParametros), ". Detalle del problema : ", resp);
            	logger.error(MSERR + ".doUpdateMain()_ Problemas con sentencia de actualzacion ["+sentencia+
            		"]. Parametros="+arrToString(listadoDeParametros)+". Detalle del problema : "+resp);
            }
        }
        else
        {
            resp = "ERROR:Al preparar objeto 'PreparedStatement'.";
        }
        try
        {
            if (pst != null)
            {
                pst.close();
            }
        }
        catch (Exception ex)
        {
            //_log.logErr(HD, ".doUpdateMain()_ Error:", ex);
        	logger.error(MSERR + ".doUpdateMain()_ Error:"+ex);
        }
        finally
        {
            pst = null;
        }
        

        return resp;
    }


    /**
     * 
     * Ejecuta la sentencia preparada 'pst', la cual debio haber sido ya inicializada y configurada
     * con los parametros necesarios. Este metodo es utilizado solamente para sentencias SQL
     * del tipo INSERT,UPDATE,DELETE.@return Una cadena en el sig. formato:<br>
     * <b>OK:{n}</b>  			Donde n es el numero de registros (insertados,borrados o actualizados)<br>
     * <b>ERROR:{mensaje}</b>	Donde 'mensaje' sera el mensaje de error producido en caso de error.<br>
     * <b>{cadena vacia}</b>	En caso de que el resultado sea 0 Registros.
     */
    private static final String exeUpdate(PreparedStatement pst, String sentenciaSQL)
    {
        StringBuffer resp = new StringBuffer();
        int n = -1;
        try
        {
            //_log.logInf(HD,".exeUpdate()_ sentenciaSQL: ",sentenciaSQL);
        	logger.info(MSINF + ".exeUpdate()_ sentenciaSQL: "+sentenciaSQL);

            n = pst.executeUpdate();

            if (n > 0)
            {
                resp.append("OK:" + n);
            }
            if (n < 0)
            {
                resp.append("ERROR_Wrng:" + pst.getWarnings());
            }
        }
        catch (Exception e)
        {
            if (pst != null)
            {
                e.printStackTrace();
                resp.append("ERROR:" + e.toString());
            }
            else
            {
                resp.append("ERROR:Object PreparedStatement NULO.");
            }
        }
        return resp.toString();
    }


    /**
     * Vuelca cada registro del ResultSet en un vector, y agrega cada uno de estos 
     * registros (vectores) en el vector de salida 'vDataOut'. 
     */
    private static final void readResultSet(ResultSet rs, Vector<Serializable> vDataOut, boolean trimStrings, ResultSetMetaData md) throws Exception
    {
        if (rs.next())
        {
            Vector<String> vRow = null;
            int nColumnas;
            int i;
            String contenido = null;
            nColumnas = md.getColumnCount();
            if (nColumnas == 1)
            { //Si la sentencia se compone de una sola columna,formar un Vector de UNA dimension.
                do
                {
                    contenido = rs.getString(1);
                    vDataOut.add(contenido == null ? "" : (trimStrings ? contenido.trim() : contenido));
                }
                while (rs.next());
            }
            else
            //Si la sentencia se compone de mas de una columna,formar un Vector de Vectores.
            {
                do
                {
                    vRow = new Vector<String>(nColumnas);
                    for (i = 1; i <= nColumnas; i++)//inicio ciclo
                    {
                        contenido = rs.getString(i);
                        vRow.add(contenido == null ? "" : (trimStrings ? contenido.trim() : contenido));
                    }//fin ciclo
                    vDataOut.add(vRow);
                }
                while (rs.next());
            }
        }
    }


    /**
     * Vuelca cada registro del ResultSet en un ArrayList, y coloca cada uno de estos en 
     * el ArrayList de salida 'arrDataOut'. 
     */
    private static final void readResultSet(ResultSet rs, ArrayList<Serializable> arrDataOut, boolean trimStrings, ResultSetMetaData md) throws Exception
    {
        if (rs.next())
        {
            ArrayList<String> arrRow = null;
            int nColumnas;
            int i;
            String contenido = null;
            nColumnas = md.getColumnCount();
            if (nColumnas == 1) //Si la sentencia se compone de una sola columna,formar un Arreglo de UNA dimension.
            {
                do
                {
                    contenido = rs.getString(1);
                    arrDataOut.add(contenido == null ? "" : (trimStrings ? contenido.trim() : contenido));
                }
                while (rs.next());
            }
            else
            {
                do
                {
                    arrRow = new ArrayList<String>(nColumnas);
                    for (i = 1; i <= nColumnas; i++)
                    {
                        contenido = rs.getString(i);
                        if (contenido == null)
                        {
                            contenido = "";
                        }
                        else if (trimStrings)
                        {
                            contenido = contenido.trim();
                        }
                        arrRow.add(contenido);
                    }
                    arrDataOut.add(arrRow);
                }
                while (rs.next());
            }
        }
    }


    /**
     * Vuelca el PRIMER REGISTRO del ResultSet en el parametro llamado 'mapDataOut', donde cada
     * 'llave' sera el nombre de la columna recuperada. 
     */
    private static final void readResultSet(ResultSet rs, Map<String, String> mapDataOut, boolean trimStrings, ResultSetMetaData md) throws Exception
    {
        if (rs.next())
        {
            int nColumnas;
            int i;
            String contenido = null;
            String colName = null;
            nColumnas = md.getColumnCount();
            for (i = 1; i <= nColumnas; i++)
            {
                colName = md.getColumnName(i);
                contenido = rs.getString(i);
                if (contenido == null)
                {
                    contenido = "";
                }
                else if (trimStrings)
                {
                    contenido = contenido.trim();
                }
                mapDataOut.put(colName, contenido);
            }
        }
    }


    /**
     * Agrega LA PRIMER COLUMNA DEL PRIMER REGISTRO del ResultSet en el parametro de
     * tipo StringBuffer,el parametro "sbDataOut" podria venirr con un nombre de funcion 
     * (nombres de funcion comienzan con '@') y en este caso
     * es necesario ejecutar la funcion, borrarla el nombre y colocar el resultado en el parametro de
     * salida 'sbDataOut'.
     */
    private static final void readResultSet(ResultSet rs, StringBuffer sbDataOut, boolean trimStrings) throws Exception
    {
        if (rs.next())
        {
            String contenido = null;
            if (sbDataOut.length() > 0 && sbDataOut.toString().startsWith("@"))
            {
                //Viene especificada una "FUNCION"
                String funcion = sbDataOut.toString();
                sbDataOut.delete(0, sbDataOut.length()); //Remover el nombre de la funcion.
                if (funcion.equalsIgnoreCase(FUNCTION_CONCATENAR_COLS))
                {
                    //Es necesario concatenar la primer colummna de cada registro encontrado.
                    do
                    {
                        contenido = rs.getString(1);
                        if (contenido == null)
                        {
                            contenido = "";
                        }
                        else if (trimStrings)
                        {
                            contenido = contenido.trim();
                        }
                        sbDataOut.append(contenido + "\n");
                    }
                    while (rs.next());
                    sbDataOut.deleteCharAt(sbDataOut.length() - 1);
                }
                else
                {
                    //_log.logErr(HD, ".readResultSet()_ (CONTENEDOR TIPO STRINGBUFFER)_ En el parametro tipo 'StringBuffer' se especifico una funcion no soportada '" + funcion + "'. Se realizara la funcion por default, colocar solo la primer columna del primer registro");
                	logger.error(MSERR + ".readResultSet()_ (CONTENEDOR TIPO STRINGBUFFER)_ En el parametro tipo 'StringBuffer' se especifico una funcion no soportada '" + 
                			funcion + "'. Se realizara la funcion por default, colocar solo la primer columna del primer registro");
                    contenido = rs.getString(1);
                    if (contenido == null)
                    {
                        contenido = "";
                    }
                    else if (trimStrings)
                    {
                        contenido = contenido.trim();
                    }
                    sbDataOut.append(contenido);
                }
            }
            else
            {
                contenido = rs.getString(1);
                if (contenido == null)
                {
                    contenido = "";
                }
                else if (trimStrings)
                {
                    contenido = contenido.trim();
                }
                sbDataOut.append(contenido);
            }
        }
        else
        {
            //En caso de que se haya especificado un nombre de funcion en el parametro de salida 'sbDataOut'
            //sera necesario removerlo para que no se confunda con el resultado, el cual es vacio.
            if (sbDataOut.length() > 0)
            {
                if (sbDataOut.toString().startsWith("@"))
                {
                    sbDataOut.delete(0, sbDataOut.length()); //Remover el nombre de la funcion.
                }
            }
        }
    }


    /**
     * Retorna una sentencia preparada (java.sql.PreparedStatement)
     * utilizando los parametros contenidos en el objeto 'listadoDeparametros', este objeto puede ser
     * cualquiera de los siguientes tipos:<br>
     * <b>Object[]</b><br>
     * <b>String[]</b>
     * <b>java.util.List</b>
     */
    public static final PreparedStatement getPStatement(Connection con, String sentencia, Object listadoDeParametros)
    {
        PreparedStatement pst = null;
        String conResp = null;
        conResp = isConexionOK(con);
        if (conResp.equals("OK"))
        {
            try
            {
                pst = con.prepareStatement(sentencia);
            }
            catch (Exception e)
            {
                //_log.logErr(HD, ".getPStatement()_ Error al preparar sentencia [" + sentencia + "].Detalle:" + e.toString());
            	logger.error(MSERR + ".getPStatement()_ Error al preparar sentencia [" + sentencia + "].Detalle:" + e.toString());
                e.printStackTrace();
            }
            if (pst != null && listadoDeParametros != null)
            {
                //Asignar parametros a la sentencia preparada.
                if ((listadoDeParametros instanceof Object[]) || (listadoDeParametros instanceof String[]))
                {
                    Object arrParms[] = (Object[]) listadoDeParametros;
                    int i = 0;
                    int size = arrParms.length;
                    try
                    {
                        for (i = 0; i < size; i++)
                        {
                            pst.setString(i + 1, arrParms [i].toString());
                        }
                    }
                    catch (Exception e)
                    {
                        //_log.logErr(HD, ".getPStatement((parametros de tipo " + listadoDeParametros.getClass().getName() + ")1_ Error al asignar valor [" + arrParms [i] + "] al parametro # " + (i + 1) + "/" + size + " en sentencia [" + sentencia + "].Detalle=" + e.toString() + ".Objeto PreparedStatement sera cerrado.");
                    	logger.error(MSERR + ".getPStatement((parametros de tipo " + listadoDeParametros.getClass().getName() + 
                    			")1_ Error al asignar valor [" + arrParms [i] + "] al parametro # " + (i + 1) + "/" + size + " en sentencia [" + 
                    			sentencia + "].Detalle=" + e.toString() + ".Objeto PreparedStatement sera cerrado.");
                        e.printStackTrace();
                        try
                        {
                            if (pst != null)
                            {
                                pst.close();
                            }
                        }
                        catch (Exception ex)
                        {
                            //_log.logErr(HD, ".getPStatement()_ Error:", ex);
                        	logger.error(MSERR + ".getPStatement()_ Error:"+ex);
                        }
                        pst = null;
                    }
                }
                else
                {
                    if (listadoDeParametros instanceof List)
                    {
                        List<?> lista = (List<?>) listadoDeParametros;
                        int size = lista.size();
                        int i = 0;
                        try
                        {
                            for (i = 0; i < size; i++)
                            {
                                pst.setString(i + 1, lista.get(i).toString());
                            }
                        }
                        catch (Exception e)
                        {
                            //_log.logErr(HD, ".getPStatement(parametros tipo java.util.List)1_ Error al asignar valor [" + lista.get(i) + "] al parametro # " + (i + 1) + "/" + size + " en sentencia [" + sentencia + "].Detalle=" + e.toString() + ".Objeto PreparedStatement sera cerrado.");
                        	logger.error(MSERR + ".getPStatement(parametros tipo java.util.List)1_ Error al asignar valor [" + lista.get(i) + 
                        		"] al parametro # " + (i + 1) + "/" + size + " en sentencia [" + sentencia + "].Detalle=" + e.toString() + 
                        		".Objeto PreparedStatement sera cerrado.");
                            e.printStackTrace();
                            try
                            {
                                if (pst != null)
                                {
                                    pst.close();
                                }
                            }
                            catch (Exception ex)
                            {
                                //_log.logErr(HD, ".getPStatement()_ Error:", ex);
                                logger.error(MSERR + ".getPStatement()_ Error:"+ex);
                            }
                            pst = null;
                        }
                    }
                    else
                    {
                        //_log.logErr(HD, ".getPStatement()_ Objeto de listado de parametros de tipo NO SOPORTADO (" + listadoDeParametros.getClass().getName() + ")");
                        logger.error(MSERR + ".getPStatement()_ Objeto de listado de parametros de tipo NO SOPORTADO (" + 
                        		listadoDeParametros.getClass().getName() + ")");
                    }
                }
            }
        }
        else
        {
            //_log.logErr(HD, ".getPStatement()_ No se preparo sentencia [", sentencia, "].Problemas en conexion: ", conResp);
            logger.error(MSERR + ".getPStatement()_ No se preparo sentencia ["+sentencia+"].Problemas en conexion: "+conResp);
        }
        return pst;
    }


    /**
     * Verifica que la conexion este lista para utilizarse. Retorna la cadena "OK" en caso
     * exitoso, en caso contrario retorna el mensaje de error.
     */
    public static final String isConexionOK(Connection con)
    {
        String resp = "OK";
        if (con != null)
        {
            try
            {
                if (con.isClosed())
                {
                    resp = "LA CONEXION ESTA CERRADA.";
                }
            }
            catch (Exception e)
            {
                resp = "ERROR AL EVALUAR 'con.isClosed()'. CONEXION INVALIDA.";
                e.printStackTrace();
            }
        }
        else
        {
            resp = "LA CONEXION ES NULA.";
        }
        return resp;
    }


    /**
     * Retorna la representacion del arreglo (Object[] o String[]) en un objeto de tipo String, en cualquier
     * otro caso retorna 'instancia.toString()'
     */
    public static final String arrToString(Object instancia)
    {
        StringBuffer cadena = new StringBuffer();
        if (instancia != null)
        {
            if ((instancia instanceof Object[]) || (instancia instanceof String[]))
            {
                Object arr[] = (Object[]) instancia;
                int size = arr.length;
                int i;
                cadena.append("[ ");
                for (i = 0; i < size; i++)
                {
                    cadena.append(arr [i] + ",");
                }
                cadena.deleteCharAt(cadena.length() - 1);
                cadena.append("]");
            }
            else
            {
                cadena.append(instancia.toString());
            }
        }
        else
        {
            cadena.append("null");
        }
        return cadena.toString();
    }


    /*Funcioncita para validar nulos y quita espacios*/
    public static String noNulos(Object string)
    {
        return string == null ? "" : string.toString();
    }


    /*Funcioncita para validar nulos y quita espacios*/
    public static String trim(Object string)
    {
        return string == null ? "" : string.toString().trim();
    }


    /**********************************************************************************************/
    /**                 	METODO MAIN PARA REALIZAR PRUEBAS DE LA CLASE (CLASE SELF-TESTING)	
     /**********************************************************************************************/
    public static void main(String[] args)
    {
        //		JDBC beanCon = new JDBC();
        //		Connection con = beanCon.getConnection();
        //		
        //		//Diferentes tipos de CONTENEDORES soportados.
        //		Vector 			v=new Vector();
        //		ArrayList 		arr=new ArrayList();
        //		Hashtable 		ht=new Hashtable();
        //		HashMap 		hm=new HashMap();
        //		StringBuffer 	dato=new StringBuffer(FUNCTION_CONCATENAR_COLS); //Utilizado cuando solo se esta interesado en un dato.
        //		
        //			/* ************************PRUEBAS DE METODOS ESTATICOS DE CONSULTA  ***************/
        //		String qry="SELECT COCOD  FROM "+beanCon.getDDS()+".SVCOIC WHERE COCOD=?";
        //		boolean bResp=SQLStatics.doQuery(con,qry,dato,true,"800");
        //		
        //		_log.logInf(HD, ".main()_ QUERY="+qry);
        //		_log.logInf(HD, ".main()_ Status de Ejecucion: "+bResp);
        //		_log.logInf(HD, ".main()_ Vector ="+v);
        //		_log.logInf(HD, ".main()_ ArrayL ="+arr);
        //		_log.logInf(HD, ".main()_ HashT  ="+ht);
        //		_log.logInf(HD, ".main()_ HashM  ="+hm);
        //		_log.logInf(HD, ".main()_ SBuffer="+dato);
        //		
        //		/* ************************PRUEBAS DE METODOS ESTATICOS DE ACTUALIZACION  ***************/
        //		//String qryU="INSERT INTO "+beanCon.getDDS()+".TR10 (T10TÑ) VALUES(?)";
        ////		String qryU="UPDATE "+beanCon.getDB2()+".TRRREG SET TRRETFRE=? WHERE TRRETNQJ=?";
        ////												//               0                 1         
        //		//String res=SQLStatics.doUpdate(con,qryU,"11/05/95","1");
        //	
        //		
        //		/*************************PRUEBAS DE LA CLASE COMO OBJETO  **************
        //		 * Forma de uso:
        //		 * 	
        //		 * */
        //		SQLStatics beanSQL=new SQLStatics();
        //		
        //
        //		/************************************************************************************
        //		 *  Ejemplo de Sentencia de CONSULTA Utilizando la INSTANCIA de esta clase.
        //		************************************************************************************/
        //		
        ////		SQLStatics beanSQL=new SQLStatics();
        //		String qryUpdate="";
        ////		if (beanSQL.openSentencia(con,qryUpd))
        ////		{
        ////			boolean assignOK=true;
        ////			//ArrayList contenedor=new ArrayList();
        ////			//Integer contenedor=new Integer(2);
        ////			Vector contenedor=new Vector();
        ////			//HashMap contenedor=new HashMap();
        ////			
        ////			assignOK&=beanSQL.setParam(1,"ACN");
        ////			assignOK&=beanSQL.setParam(2,"800");
        ////			if (assignOK)
        ////				beanSQL.runPreparedQuery(contenedor,true);
        ////			//contenedor.clear();
        ////			
        ////			//Ejemplo para ejecutar una segunda consulta cambiando solamente el segundo parametro.
        ////			assignOK=true;
        ////			assignOK&=beanSQL.setParam(2,"MEX");
        ////			if (assignOK)
        ////				beanSQL.runPreparedQuery(contenedor,true);
        ////			//contenedor.clear();
        ////
        ////			 
        ////			beanSQL.closeSentencia();  /** Importante Cerrar la sentencia cuando ya no se utilizara*/
        ////		}
        //
        //
        //		/************************************************************************************
        //		 *  Ejemplo de Sentencia de ACTUALIZACION Utilizando la INSTANCIA de esta clase.
        //		 ************************************************************************************/
        ////		String qryUpd="UPDATE "+beanCon.getDDS()+".TR10 SET T10DSD=? WHERE T10TÑ=?";
        ////		if (beanSQL.openSentencia(con,qryUpd))
        ////		{
        ////			boolean assignOK=true;
        ////			String arrValores[]={"1","2","3","4"};
        ////			int size=arrValores.length;
        ////		
        ////			beanSQL.setParam(2,"926355");
        ////			for (int i=0;i<size;i++)
        ////			{
        ////				assignOK&=beanSQL.setParam(1,arrValores[i]);
        ////				if (assignOK)
        ////				{
        //						beanSQL.runPreparedUpdate();
        //					}
        ////				else
        ////				{
        //						break;
        //					}
        ////			}
        ////			beanSQL.closeSentencia();  /** Importante Cerrar la sentencia cuando ya no se utilizara*/
        ////		}
        //		String arr[]=new String[1];
        //		arr[0]="800";
        //		ArrayList arr = new ArrayList();
        //		//StringBuffer desc=new StringBuffer();
        //		SQLStatics.doQuery(con, "SELECT WFASRTIPIT,WFASRITEM,WFASRRANGI,WFASRRANGF,WFASRPNTIN,WFASRPNTEX,WFASRTIEMP,WFASRUNTMP,WFASRPTINR,WFASRPTEXR,WFASRTIMPR,WFASRUTMPR FROM SJRMWF0002.WFRASGTRR where  WFASRTIPIT=?", arr, true, "FA");
        //		beanCon.close();
    }
}