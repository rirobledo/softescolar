package bean;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.PropertyResourceBundle;

import org.apache.log4j.Logger;

/**
 * @version 3.0.0 Ultima Actualizacion : 19/SEP/2007 
 * 
 * @author: Roberto Corona.<br>
 * Fecha de Creación:  4/04/2007.<br>
 * Compañía: ZENTRUM ZIZTEMAZ.<br>
 * <b>Descripción del programa:</b><br><br>
 *     
 *    Esta clase se encuentras los  valores que son propios para el Modulo WEB
 * en donde esta instalada esta clase. La informacion encontrada en esta clase
 * no cambia de valor continuamente, es por eso que se empotro en codigo y 
 * la informacion no proviene de un archivo de configuracion. Dentro de cada
 * proyecto o modulo WEB existira una clase con la informacion concerniente
 * al proyecto WEB en donde este alojada. Entre la informacion que se puede
 * encontrar aqui esta
 * 
 * 	1) El nombre del archivo de iniciacion del modulo Web 
 * 		(/zntsetup/init{nombreDeModulo}.properties)
 *  2)Nombre del archivo que tiene el mapa de acciones para MVC
 * 		(FILENAME_ACTIONS)
 * 	3)El nombre del modulo WEB o algun nombre con el que se le conozca.
 * 		(CONTEXTO)
 * 	4)Un metodo que retorna la instancia del ConnManager que se utiliza
 * 		en este modulo WEB.
 * 	5)Un metodo que retorna la instancia del LoggerAdapter Global o el
 * 		Generico utilizados para este modulo WEB.
 *  6)Metodo que retornan las propiedades encontradas en el archivo
 * 		de iniciacion del moduloWEB.
 *  7)Metodo que retornan los nombres de archivos de configuraciones
 * 		para el ConnManager.
 *------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: RCC01	<br>
 * Autor: Roberto Corona<br>
 * Fecha: 21/05/2007<br>
 * Descripción:<br><br>
 * 			
 * 			Se muestra el nombre de la llave en el aviso cuando se
 * quiere recuperar un valor con 'getProperty' y la instancia no encontro el archivo
 * de configuracion.
 * 
 ------------------------------------------------------------------<br>
 * MODIFICACIONES:<br>
 *------------------------------------------------------------------<br>
 * Clave: RCC05	<br>
 * Autor: Roberto Corona<br>
 * Fecha: 19/09/2007.<br>
 * Descripción:<br><br>
 *
 * 	 	-La lectura del archivo de configuracion inicial ya se encuentra
 * fuera del WAR y por lo tanto ya se buscara en el directorio que este especificado
 * en el archivo main.properties.
 * 
 * 		-Se agrega metodo para poder recuperar el nombre de este archivo
 * de inicio desde clases externas.
 * 
 *------------------------------------------------------------------<br>
 * 
 **/
public class ModuloWEB
{
    /**Seccion de valores CONSTANTES */
    //private static final String  HD               = "B_" + ModuloWEB.class.getName().substring(ModuloWEB.class.getName().lastIndexOf(".") + 1);
	private final static Logger logger = Logger.getLogger("PlantaOfertaVelocidadWebWL");
	private final static String MSERR 	= "MSERR."+ModuloWEB.class.getName()+".";
	private final static String MSAVI 	= "MSAVI."+ModuloWEB.class.getName()+".";

    /**&TMP Especificar el key path que se debe buscar en el 
     * main.properties*/
    /*KEY_PATH es Valor que debe existir en el archivo main.properties, el cual permite determinar el path 'externo' en donde se encuentran los archivos de propiedades*/
    private static final String  KEY_PATH         = "PlantaOfertaVelocidadesPath";

    /**&TMP Especificar el nombre del archivo de configuracion 
     * para el ConnManager utilizado en este proyecto.*/
    /*CONFIG_FILE Es el nombre del archivo de configuracion utilizado para configurar ConnPool (nativo de este proyecto WEB)*/
    private static final String  CONFIG_FILE      = "ConfigModulo.properties";
    
    /*CONFIG_FILE Es el nombre del archivo de configuracion utilizado para configurar Direccion de Google*/
    private static final String  CONFIG_FILE_MAP      = "ConfigMapa.properties";

    /**&TMP Especificar el nombre del archivo de configuracion 
     * para el ConnManager de Batch utilizado en este proyecto 
     * (en caso de aplicar).*/
    /*CONFIG_FILE Es el nombre del archivo de configuracion utilizado para configurar ConnPool para BATCH (nativo de este proyecto WEB)*/
    private static final String  CONFIGBATCH_FILE = "ConfigApisExternasPLBatch.properties";

    /**&TMP Especificar el nombre del archivo de configuracion 
     * INICIAL de este proyecto Web.*/
    //RCC05
    private static final String  FILEANEM_INIT    = "zntconfig/initApisExternasPlanta.properties";

    /**&TMP Especificar el nombre del archivo donde se 
     * encuentra el mapa de acciones para este proyecto Web.*/
    //private static final String  FILENAME_ACTIONS = "/zntsetup/PlantaDomicilios.actionmap"; 
    /**TMP_RRV01  SE COLOCÓ PARA USARSE EN WEBLOGIC***/  
    private static final String  FILENAME_ACTIONS = "zntconfig/ApisExternasPlanta.actionmap";     //PLA01

    /**&TMP Especificar el nombre contexto que aparecera 
     * como cabecera en los mensajes arrojados a consola 
     * por medio del objeto LoggerAdapter. NOTA: Aqui se acostumbra colocar el mismo nombre 
     * del contexto del modulo WEB(es solo informativo)*/
    public static final String   CONTEXTO         = "PlantaOfertaVelocidadWL";
    public static final String   ID_MSG_ERR       = "_MSERR_";
    public static final String   ID_MSG_INF       = "_MSINF_";
    public static final String   ID_MSG_AVI       = "_MSAVI_";
    public static final String   ID_MSG_OTR       = "_MSOTR_";
    private static final String  MSG_HD_ERR       = CONTEXTO + ID_MSG_ERR;
    private static final String  MSG_HD_INF       = CONTEXTO + ID_MSG_INF;
    private static final String  MSG_HD_AVI       = CONTEXTO + ID_MSG_INF;
    private static final String  MSG_HD_OTR       = CONTEXTO + ID_MSG_OTR;
    //private static LoggerAdapter _log             = LoggerAdapter.getGenerico(CONTEXTO);
    private static ModuloWEB     _instance        = null;

    private boolean              isArchivoPropsOK = false;
    private HashMap<String, String>              hmProperties     = new HashMap<String, String>();
    //  RCC05
    private String               fullFileName     = null;


    /**
     * Constructor
     */
    private ModuloWEB()
    {
        this.fullFileName = getInitFileName();
    }


    /**
     * Retorna una instancia singleton de esta clase.
     * @return
     */
    private synchronized static ModuloWEB instance()
    {
        if (_instance == null)
        {
            _instance = new ModuloWEB();
            _instance.loadProperties();//RCC05
        }
        return _instance;
    }

    /**
     * Retorna una instancia singleton de esta clase.
     * @return
     */
    private synchronized static ModuloWEB initInstance()
    {
        if (_instance == null)
        {
            _instance = new ModuloWEB();
        }
        return _instance;
    }

    
    /**
     * Metodo que vuelve a cargar el archivo de propiedades.
     *
     */
    public synchronized static void reloadInstance()
    {
        _instance = null;
    }


    /*RCC05 (cambio forma de recuperar propiedades, ahora el archivo se busca
     fuera del WAR.*/
    /**
     * Carga todos los valores encontrados en el archivo de propiedades
     * perteneciente a este modulo, el cual se encuentra dentro
     * del directorio llamado /zntsetup y debera llamarse:<br>
     * <b>{nombre de modulo}.properties</b>. 
     */
    private void loadProperties()
    {
        this.isArchivoPropsOK = false;
        InputStream is = null;
        String path = null;
        String pathKey = getKeyPath();

        path = MainProperties.getProperty(pathKey);
        if (path != null)
        {
            this.fullFileName = path + getInitFileName();

            /**Intentar buscar directamente en el Sistema De Archivos*/
            try
            {
                is = new FileInputStream(this.fullFileName);
            }
            catch (FileNotFoundException e1)
            {
                is = null;
            }
            if (is != null)
            {
                /*Cargar todas las propiedades encontradas*/
                try
                {
                    String key = null;
                    PropertyResourceBundle props = new PropertyResourceBundle(is);
                    Enumeration<String> en = props.getKeys();

                    this.hmProperties.clear();
                    while (en.hasMoreElements())
                    {
                        key = en.nextElement().toString();
                        this.hmProperties.put(key, props.getString(key).trim());
                    }
                    this.isArchivoPropsOK = true;
                }
                catch (Exception e)
                {
                    //_log.logErr(HD, ".loadProperties()_ Error al leer contenido de archivo (", this.fullFileName, ")." + e.toString());
                	logger.error(MSERR + ".loadProperties()_ Error al leer contenido de archivo ("+this.fullFileName+")." + e.toString());
                }
                finally
                {
                    try
                    {
                        if (is != null)
                        {
                            is.close();
                        }
                    }
                    catch (Exception ex)
                    {
                        is = null;
                    }
                    finally
                    {
                        is = null;
                    }
                }
            }
            else
            {
                //_log.logAvi(HD, ".loadProperties()_ archivo de propiedades (", this.fullFileName, ") no encontrado.");
                logger.error(MSERR + ".loadProperties()_ archivo de propiedades ("+
                		this.fullFileName+") no encontrado.");
            }

        }
        else
        {
            //_log.logErr(HD, ".loadProperties()_ No se encontro el path key (", pathKey, ") para poder determinar el path completo del archivo de configuracion inicial (", getInitFileName(), ").");
            logger.error(MSERR + ".loadProperties()_ No se encontro el path key ("+pathKey+
            		") para poder determinar el path completo del archivo de configuracion inicial ("+
            		getInitFileName()+").");
        }
    }


    /**
     * Retorna el valor de la llave especificada utilizando
     * los valores del archivo de propiedades (/zntsetup/*.properties)
     * del modulo. 
     */
    public static String getProperty(String key)
    {
        return getProperty(key, "");
    }


    /**
     * Retorna el valor de la llave especificada utilizando
     * los valores del archivo de propiedades (/zntsetup/*.properties)
     * del modulo actual. Se retorna el parametro 'defValue' en caso de que
     * no se encuentre la propiedad o tenga contenido vacio. 
     */
    public static String getProperty(String key, String defValue)
    {
        String prop = null;
        ModuloWEB instancia = instance(); //Pedir la instancia singleton actual.

        if (instancia.isArchivoPropsOK)
        {
            String value = (String) instancia.hmProperties.get(key);

            if (value == null)
            {
                prop = defValue;
                //_log.logAvi(HD, ".getProperty(key=" + key + ") Key no existente en archivo de configuracion inicial (", instancia.fullFileName, ") cuando fueron cargadas a memoria la ultima vez.Se retorna valor por default especificado '" + defValue + "'. (ver metodo reload para recargar configuracion)");
                logger.warn(MSAVI + ".getProperty(key=" + key + 
                		") Key no existente en archivo de configuracion inicial ("+instancia.fullFileName+
                		") cuando fueron cargadas a memoria la ultima vez.Se retorna valor por default especificado '" + 
                		defValue + "'. (ver metodo reload para recargar configuracion)");
            }
            else
            {
                if (value.length() == 0)
                {
                    prop = defValue;
                }
                else
                {
                    prop = value;
                }
            }
        }
        else
        {
            prop = defValue;
            //_log.logErr(HD, ".getProperty(key=" + key + ")_ No se recupero informacion (previamente) del archivo de propiedades (", instancia.fullFileName, "). Colocarlo  y recargar instancia (reaload()). Ver mensajes anteriores para determinar error.");//RCC02
            logger.warn(MSAVI + ".getProperty(key=" + key + 
            	")_ No se recupero informacion (previamente) del archivo de propiedades ("+instancia.fullFileName+
            	"). Colocarlo  y recargar instancia (reaload()). Ver mensajes anteriores para determinar error.");
        }
        return prop;
    }
    
    
    public static String getInitProperty(String key, String defValue)
    {
        String prop = null;
        ModuloWEB instancia = initInstance(); //Pedir la instancia singleton actual.

        if (instancia.isArchivoPropsOK)
        {
            String value = (String) instancia.hmProperties.get(key);

            if (value == null)
            {
                prop = defValue;
                //_log.logAvi(HD, ".getInitProperty(key=" + key + ") Key no existente en propiedades (", FILEANEM_INIT, ") cuando fueron cargadas a memoria la ultima vez.Se retorna valor por default especificado '" + defValue + "'");
                logger.warn(MSAVI + ".getInitProperty(key=" + key + ") Key no existente en propiedades ("+FILEANEM_INIT+
                	") cuando fueron cargadas a memoria la ultima vez.Se retorna valor por default especificado '" + defValue + "'");
                
            }
            else
            {
                if (value.length() == 0)
                {
                    prop = defValue;
                }
                else
                {
                    prop = value;
                }
            }
        }
        else
        {
            prop = defValue;
            //_log.logErr(HD, ".getInitProperty(key=" + key + ")_ Al inicializar esta clase no se encontro archivo de propiedades (", FILENAME_ACTIONS, "). Colocar archivo {" + FILEANEM_INIT + "} y recargar instancia (reaload())");//RCC02
            logger.error(MSERR + ".getInitProperty(key=" + key + ") Key no existente en propiedades ("+FILEANEM_INIT+
                	") cuando fueron cargadas a memoria la ultima vez.Se retorna valor por default especificado '" + defValue + "'");
        }
        return prop;
    }



    /**
     * Retorna una instancia del ConnManager utilizado dentro de el proyecto WEB
     * en donde este alojada esta clase.
     * @return
     */
    /*
    public static final IConnManager getConnMngrInstance()
    {
        return ConnManagerPLDomicilios.instance();
    }
    */


    /**
     * Retorna una instancia del objeto Logger configurado como 'Global'
     * en el archivo de configuraciones (/zntsetup/init*.properties))utilizado
     * para este modulo WEB. El verbose de este grupo depende del valor 
     * especificado (verboseGrp_Global=true/false) en el archivo de configuraciones 
     * @return LoggerAdapter
     */
    /*
    public static LoggerAdapter getLoggerGlobal()
    {
        return LoggerPLDomicilios.getInstanceGrpGlobal();
    }
    */


    /**
     * Retorna una instancia del objeto Logger generico utilizado
     * para este modulo WEB. Con este objeto Logger siempre
     * se muestran los mensajes informativos. Este logger se utiliza
     * para clases que se utilizan para pruebas.
     * @return
     */
    /*
    public static LoggerAdapter getLoggerGenerico()
    {
        return LoggerAdapter.getGenerico(getNombreDeContexto());
    }
    */


    /**
     * Retorna la cabecera utilizada para mensajes INFORMATIVOS.
     * @return
     */
    public static String getHeaderMsgINF()
    {
        return MSG_HD_INF;
    }


    /**
     * Retorna la cabecera utilizada para mensajes OTROS.
     * @return
     */
    public static String getHeaderMsgOTR()
    {
        return MSG_HD_OTR;
    }


    /**
     * Retorna la cabecera utilizada para mensajes de AVISOS.
     * @return
     */
    public static String getHeaderMsgAVI()
    {
        return MSG_HD_AVI;
    }


    /**
     * Retorna la cabecera utilizada para mensajes de ERROR.
     * @return
     */
    public static String getHeaderMsgERR()
    {
        return MSG_HD_ERR;
    }


    /**
     * Retorna el nombre del archivo donde se encuentran las acciones
     * que se ejecutan en el modelo MVC del proyecto WEB donde esta
     * alojada esta clase.
     * para este modulo WEB.
     * @return
     */
    public static String getActionsMapFileName()
    {
        return FILENAME_ACTIONS;
    }


    /**
     * Retorna el nombre del contexto del modulo WEB actual.
     * @return
     */
    public static String getNombreDeContexto()
    {
        return CONTEXTO;
    }


    /**
     * Retorna una cadena con los valores configurados actualmente.
     * @return
     */
    public static String getPropertiesToString()
    {
        return instance().hmProperties.toString();
    }


    /**
     * Retorna el ID de path que se utiliza en el archivo /zntwasconfig/main.properties 
     * para determianar el 'path externo' (externo al proyecto) en donde se encuentran
     * los archivos de propiedades.
     * @return
     */
    public static String getKeyPath()
    {
        return KEY_PATH;
    }


    /**
     * Retorna el nombre del archivo de propiedades para configurar 
     * el ConnManager considerado como el default de este proyecto WEB.
     * @return
     */
    public static String getConfigFileName()
    {
        return CONFIG_FILE;
    }
    
    public static String getConfigFilenameMap()
    {
        return CONFIG_FILE_MAP;
    }


    //RCC05
    /**
     * Retorna el nombre del archivo de inicio (properties) que contiene
     * todos los valores necesarios para configurar esta aplicacion.
     * @return
     */
    public static String getInitFileName()
    {
        return FILEANEM_INIT;
    }


    /**
     * Retorna el nombre del archivo de propiedades para configurar 
     * el ConnManager utilizado en BATCH,considerado como el 
     * default de este proyecto WEB.
     * @return
     */
    public static String getConfigBatchFileName()
    {
        return CONFIGBATCH_FILE;
    }


    /**********************************************************************************************/
    /**                 	METODO MAIN PARA REALIZAR PRUEBAS DE LA CLASE (CLASE SELF-TESTING)	
     /**********************************************************************************************/
    public static void main(String[] args)
    {
        System.out.println("timeOutRPG=" + getProperty("timeOutRPG"));
    }
}

