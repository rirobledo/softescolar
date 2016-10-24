<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Control Escolar</title>
<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="../xecss/demo.css"/>
<link rel="stylesheet" href="../xecss/style4.css"/>
<link rel="stylesheet" href="../xecss/style2_1.css"/>
<!-- <link href="../jquery_1.12.0/jquery-ui.css" rel="stylesheet"> -->
<script src="../jquery_1.12.0/external/jquery/jquery.js"></script>
 <script src="../jquery_1.12.0/jquery-ui.js"></script>
 <link rel="stylesheet" href="../xecss/style.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/my-jquery.mobile-1.4.5.css" />
<script src="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>

<script type="text/javascript" src="../xejs/jquery.maskMoney.min.js"></script>

<!-- DataTable -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" />


<link rel="stylesheet" href="../xecss/myjquerymobile.css" />
<script type="text/javascript" src="../xejs/login.js"></script>

<script type="text/javascript" src="../xejs/registrarAlumno.js"></script>

<script type="text/javascript">


 
 function refreshPage() {
 
//    alert('XEPrincipal');
  window.open('../xejsp/XEDatosAlumnos.jsp', '_self');
}

function refreshPageReg() {
 
//    alert('XEPagos');
  window.open('../xejsp/XERegAlumnosCT.jsp', '_self');
}

function refreshPagePagos() {
 
//    alert('XEPagos');
  window.open('../xejsp/XERecepcionPagos.jsp', '_self');
}

function refreshPageConsultaPagos() {
 
//    alert('XEPagos');
  window.open('../xejsp/XEConsultaPagos.jsp', '_self');
}

function refreshPageRegAlta() {
 
//    alert('XEPagos');
  window.open('../xejsp/XERegAlumnosA1.jsp', '_self');
}

</script>

</head>

<body>
<div data-role="page" id="idMenuRegAlumno" style="background-color: #f6f6f6;">

<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-btn-inline ui-icon-home ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	
	<h1 style="color: white; text-shadow: none;">PAGOS<img alt="" src="../images/COLEGIOTT.png" align="middle" width="14%" height="14%"  style="margin-top: -1em;"></h1>
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a>
</div><!-- Fin Header -->	
	
	 


<div role="main" class="ui-content" style="background-color: #f6f6f6;">
<h1 style="color: white; text-shadow: none;"> <img alt="" src="../images/softescolar2.png" align="right" width="10%" height="10%" style="margin-right: 3em; position: relative;" ></h1>
<div class="containerTb3">
<div class="content">        
     <ul class="ca-menu">
     				<li onclick="refreshPagePagos()">
                        <a href="">
                            <span class="ca-icon" id="heart">&#97;</span>
                            <div class="ca-content">
                                <h2 class="ca-main">Registrar Pago</h2>
                                <h3 class="ca-sub">Registro de Pagos</h3>
                            </div>
                        </a>
                    </li>
                     <li onclick="refreshPageConsultaPagos()">
                        <a  href="">
                            <span class="ca-icon">&#185;</span>
                            <div class="ca-content">
                                <h2 class="ca-main">Consulta de Pagos</h2>
                                <h3 class="ca-sub">Consulta</h3>
                            </div>
                        </a>
                    </li>
                    
                </ul>
  </div><!-- content -->
  </div>
 <div data-role="panel" id="mypanel" class="" data-display="overlay" data-dismissible="true"  style="border: 1px solid #f6f6f6; background-color: #336CA6;" >
    <!-- panel content goes here -->
    <a href="#idRegPagos" class="ui-btn ui-btn-b ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" ></a>
    
<ul class="ca-menu-2" style="margin-left: -.5em;">
					<li>
                        <a href="XEPrincipal.jsp">
                            <span class="ca-icon-2" id="heart">&#60;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Inicio</h3>
                            </div>
                        </a>
                    </li>
     				<li onclick="refreshPagePagos()">
                        <a href="">
                            <span class="ca-icon-2" id="heart">$</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Recepción de Pagos</h3>
                            </div>
                        </a>
                    </li>
                   <li onclick="">
                        <a  href="">
                            <span class="ca-icon-2">&#97;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Registro de Alumnos</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">F</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Alumnos</h3>
                            </div>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">H</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Colaboradores</h3>
                            </div>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">K</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Nómina</h3>
                            </div>
                        </a>
                    </li>
					<li>
                        <a href="#">
                            <span class="ca-icon-2">&#85;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Usuario</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">&#51;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Calificaciones</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">&#117;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Reportes</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="ca-icon-2">&#92;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Otros</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#popupCerrarSesion3" data-rel="popup" data-position-to="window" data-transition="pop">
                            <span class="ca-icon-2">&#88;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Cerrar Sesión</h3>
                            </div>
                        </a>
                    </li>
                </ul>
</div><!-- /panel -->       
  
<div data-role="popup" id="popupCerrarSesion" data-overlay-theme="b" data-theme="a" data-dismissible="false" style="max-width:400px;">
<div data-role="controlgroup" >    
<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; background-color: #2595FF; color: white;text-shadow: false; font-weight: normal; ">Mensaje</h3>
    <div role="main" class="ui-content">
        <h3 class="ui-title" style="text-align: center;">¿Desea Cerrar la Sesión?</h3>
    <p></p>
        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-a" data-rel="back">Cancel</a>
        <a href="XELogin.jsp" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-a"  data-transition="none">Aceptar</a>
    </div>
</div>     
</div>
</div>

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 <a href="http://www.softescolar.com" target="_blank" >SoftEscolar.com</a></p>
<p>&nbsp;</p>
</div><!-- /footer -->

</div> <!-- Fin Page -->
</body>
</html>