<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recepción de Pagos</title>

<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="../xecss/demo.css"/>
<link rel="stylesheet" href="../xecss/style2_1.css"/>
<link rel="stylesheet" href="../xecss/style4.css"/>
<script src="../jquery_1.12.0/external/jquery/jquery.js"></script>
<script src="../jquery_1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="../xecss/style.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/my-jquery.mobile-1.4.5.css" />
<script src="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>

<script type="text/javascript" src="../xejs/jquery.maskMoney.min.js"></script>

<link rel="stylesheet" href="../xecss/myjquerymobile.css" />
<script type="text/javascript" src="../xejs/login.js"></script>
<!-- DataTable -->

<!-- <script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script> -->
<!-- <link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" /> -->

<script type="text/javascript" src="../xejs/registrarAlumno.js"></script>

<!-- <script type="text/javascript" src="../jquery-datepicker/jquery.mobile.datepicker.js"></script> -->
<link rel="stylesheet" href="../jquery-datepicker/jquery.mobile.datepicker.css" />
<link rel="stylesheet" href="../jquery-datepicker/jquery.mobile.datepicker.theme.css" />

<!-- Java imports -->
<%@ page import="bean.XEUtiles"%>
<%@ page import="java.util.HashMap"%>

<%
	// Java 
	response.setHeader("Cache-Control", "no-Cache");
	response.setHeader("Pragma", "No-cache");

	String folio = "", nombreAlum = "", grado = "", fechaRegistro = "";
	
	folio = XEUtiles.getParam(request, "folio");
	nombreAlum = XEUtiles.getParam(request, "nombreAlum");
	grado = XEUtiles.getParam(request, "grado");
	fechaRegistro = XEUtiles.getParam(request, "fechaRegistro");
	
	
%>



<script type="text/javascript">

var spMes='';

 $.datepicker.regional['es'] = {
 closeText: 'Cerrar',
 prevText: '<Ant',
 nextText: 'Sig>',
 currentText: 'Hoy',
 monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
 monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
 dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
 weekHeader: 'Sm',
 dateFormat: 'dd/mm/yy',
 firstDay: 1,
 isRTL: false,
 showMonthAfterYear: false,
 yearSuffix: ''
 };
 
 
$(function () {
$("#fecha").datepicker();
});
 
$(function() {
    $('#colegiatura').maskMoney();
    $('#inscripcion').maskMoney();
    $('#libros').maskMoney();
    $('#uniformes').maskMoney();
    $('#seguroescolar').maskMoney();
    $('#transporteescolar').maskMoney();

 
   
    
  });
  
    
	 
function agregarMes(mes)
{
 	$('#spMes').text(mes);
}

function agregarInsc(mes)
{
 	$('#spMes2').text(mes);
}

function refreshPage() {
 
//    alert('XEPagos');
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

$(document).ready(function() {
// 	var table = $('#example').DataTable();

// 	$('#example tbody').on( 'click', 'tr', function () {
// 		if ( $(this).hasClass('selected') ) {
// 			$(this).removeClass('selected');
// 		}
// 		else {
// 			table.$('tr.selected').removeClass('selected');
// 			$(this).addClass('selected');
// 		}
// 	} );

// 	$('#button').click( function () {
// 		table.row('.selected').remove().draw( false );
// 	} );

	
	$( "#fecnacimiento2" ).datepicker({
// 		changeMonth: true,
	  	changeYear: true
	});
	
		
} );

</script>


</head>
<body onload="">
<div data-role="page" id="idRegAlumnosA2">
<div data-role="header" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
<!-- 	<a href="#mypanel" class="ui-btn ui-btn-inline ui-icon-bars ui-btn-icon-left" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a> -->
	<h1 style="color: white; ">FOLIO DE REGISTRO</h1>
<!-- 	<a href="XEPrincipal.jsp" class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a> -->
</div><!-- Fin Header -->
<div role="main" class="ui-content" style="width: 100%;">
	<div class="containerTb" style="margin: 0em auto">

		<div class="ui-body-a ui-body">
		<div class="ui-body ui-body-a ui-corner-all" >
		<h4 style="font-weight: bold;">Datos del Folio</h4>
		<div style="background-color: #F6F6F6;">
		
			<br>
			
		<table width="90%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="25%">
	<table width="20%">
	<tr>
	<td>
		<label for="folioReg">Folio:</label>
		<input type="text" readonly="readonly" data-clear-btn="false" name="folioReg"  id="folioReg" value="<%=folio %>" placeholder="" style="border-left :none;">
	</td>
	</tr>
	</table>
	</td>
	
	
	</tr>
	<tr style="padding-top: -3em;">
	<td width="30%">
	<table width="60%">
	<tr>
	<td>
		<label for="nombre">Nombre de Alumno:</label>
		<input type="text" readonly="readonly" data-clear-btn="false" name="nombre"  id="nombre" value="<%=nombreAlum %>" placeholder="">
	</td>
	</tr>
	</table>
	</td>
	

	
	
	<tr>
	<td width="10%">
	<table width="40%">
	<tr>
	<td>
		<label for="grado">Grado:</label>
		<input type="text" readonly="readonly" data-clear-btn="false" name="grado"  id="grado" value="<%=grado %>" placeholder="">
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td width="10%">
	<table width="40%">
	<tr>
	<td>
		<label for="fechaReg">Fecha Registro:</label>
		<input type="text" readonly="readonly" data-clear-btn="false" name="fechaReg"  id="fechaReg" value="<%=fechaRegistro %>" placeholder="">
	</tr>
	</table>
	</td>
	</tr>
	</table>
			
			</div>
			</div>	
		  
	
	<br>
	<div class="ui-body ui-body-a ui-corner-all" >
<!-- 	<h4 style="font-weight: bold;">Datos Padre / Madre</h4> -->
	
<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	

	
	
<!-- 	<div class="ui-body ui-body-a ui-corner-all" > -->
	<form >
<!-- 	<div style="margin-left:3em;padding-top: .7em">	 -->
	<a href="XEPrincipal.jsp" onclick=""  class="ui-btn ui-btn-inline " >Finalizar</a>
	<a href="" onclick="" id="idBtnImprimir" class="ui-btn ui-btn-inline ui-shadow" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Imprimir</a>
<!-- 	<a href="#popupColegiatura" onclick="agregarMes('Febrero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Eliminar Datos de Alumno</a> -->
	

<!-- </div> -->
	</form>

<!-- 		  </div> -->
			
		</div>
	</div>


</div><!-- Fin Main -->

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 Sistema Escolar</p>
</div><!-- /footer -->

</div><!-- Fin Page -->

</body>
</html>