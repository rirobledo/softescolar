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
<script type="text/javascript" src="../xejs/print.js"></script>

<!-- <script type="text/javascript" src="../jquery-datepicker/jquery.mobile.datepicker.js"></script> -->
<link rel="stylesheet" href="../jquery-datepicker/jquery.mobile.datepicker.css" />
<link rel="stylesheet" href="../jquery-datepicker/jquery.mobile.datepicker.theme.css" />


<script type="text/javascript" src="../xejs/registrarAlumno.js"></script>





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


	$.datepicker.setDefaults($.datepicker.regional['es']);
	$( "#fecnacimiento2" ).datepicker({
// 		changeMonth: true,
	  	changeYear: true
	});

	$("#btnImprimirReg").bind("click",function()
		{
		
		
		var options = { mode : "popup", popHt : "700", popWd : "900" };
				
		$('#idImprimirTicket').printArea(options);
		});
		
} );

</script>


</head>
<body onload="">
<div data-role="page" id="idRegAlumnosA1">
<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-btn-inline ui-icon-home ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	<h1 style="color: white; text-shadow: none;">REGISTRO DE ALUMNOS<img alt="" src="../images/COLEGIOTT.png" align="middle" width="14%" height="14%"  style="margin-top: -1em;"></h1>
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a>
</div><!-- Fin Header -->	
<div role="main" class="ui-content" style="width: 100%;">
	<div class="containerTb" style="margin: 0em auto">

		<div id="idCapturaDatosInscripcion" class="ui-body-a ui-body">
		<form id="validateForm" action="">
		<div class="ui-body ui-body-a ui-corner-all" >
		<h4 style="font-weight: bold;">Datos del Alumno</h4>
		<div style="background-color: #F6F6F6;">
		
			<br>
			
	<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="30%">
		<label for="nombre">Nombre(s) *</label>
		<input type="text" data-clear-btn="false" name="nombre"  id="nombre" value="" placeholder="" maxlength="100" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>

	<td width="25%">
		<label for="apellidoPat">Apellído Paterno *</label>
		<input type="text" data-clear-btn="false" name="apellidoPat"  id="apellidoPat" value="" placeholder="" maxlength="100" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>
	<td>
	<table style="border-collapse: separate; border-spacing:  .2em;">
	<tr>
	<td width="25%">
		<label for="libros">Apellído Materno</label>
		<input type="text" data-clear-btn="false" name="apellidoMat"  id="apellidoMat" value="" placeholder="" maxlength="100" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>
	<td width="20%" height="">
		<label style="margin-top: 1.0em;">Sexo *</label>
    <fieldset data-role="controlgroup" data-mini="true" style="background-color: #F6F6F6; margin-top: -2.8em;">
	
	    <select name="sexo" id="sexo" >
	        <option value="MASCULINO" >MASCULINO</option>
	        <option value="FEMENINO" >FEMENINO</option>
	
	    </select>
	    
	</fieldset>

	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr style="padding-top: -3em;">
	<td width="20%">
		<label for="fecnacimiento">Fecha de Nacimiento *<label>
<!-- 		<input type="text" data-clear-btn="false"  name="fecnacimiento"  id="fecnacimiento" value="" placeholder=""> -->
		<input type="text" data-role="date" name="fecnacimiento2" id="fecnacimiento2" >
	</td>
	<td width="20%">
		<label for="edad">Edad *<label>
		<input type="number" data-clear-btn="false"  name="edad"  id="edad" value="" placeholder="">
	</td>
	<td width="60%">
	<table style="border-collapse: separate; border-spacing:  .2em;">
	<tr>
	<td width="40%">
		<label for="curp">CURP *</label>
		<input type="text" data-clear-btn="false" name="curp"  id="curp" value="" placeholder="" maxlength="18" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>
 
	<td width="10%">
		<label for="grado">Grado *</label>
<!-- 		<input type="text" data-clear-btn="false" name="grado"  id="grado" value="" placeholder=""> -->
		
		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" style="margin-top: -1.5em;" >
	    <label for="nivelgrado">Grado *</label>
	    <select name="grado" id="grado">
			<option value="PRIMERO">PRIMERO</option>
	        <option value="SEGUNDO">SEGUNDO</option>
	        <option value="TERCERO">TERCERO</option>
			<option value="CUARTO">CUARTO</option>
			<option value="QUINTO">QUINTO</option>
			<option value="SEXTO">SEXTO</option>
<!-- 	        <option value="PREPARATORIA">PREPARATORIA</option> -->
	    </select>
 
		</fieldset>
		
	</td>
	<td width="15%">
<!-- 		<label for="grado">Nivel Grado *</label> -->
<!-- 		<input type="text" data-clear-btn="false" name="grado"  id="grado" value="" placeholder=""> -->
		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" style="margin-top: 0.5em;" >
	    <label for="nivelgrado">Nivel Grado *</label>
	    <select name="nivelgrado" id="nivelgrado">
			<option value="PREESCOLAR">PREESCOLAR</option>
	        <option value="PRIMARIA">PRIMARIA</option>
	        <option value="SECUNDARIA">SECUNDARIA</option>
<!-- 	        <option value="PREPARATORIA">PREPARATORIA</option> -->
	    </select>
 
</fieldset>
	</td>
	
	<td width="20%">
		 <label for="cicloEscolar" style="margin-top: -1.2em;">Ciclo Escolar *</label>
		<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" style="margin-top: -0.5em;" >
	    <label for="cicloEscolar">Ciclo Escolar *</label>
	    <select name="cicloEscolar" id="cicloEscolar">
			<option value="2016-2017">2016-2017</option>
	        <option value="2017-2018">2017-2018</option>
	        <option value="2018-2019">2018-2019</option>
	    </select>
 
</fieldset>
	</td>
	<tr>
	</table>
	</td>
	</tr>

	</table>
			
			</div>
			</div>	
		  
	<div class="ui-body ui-body-a ui-corner-all" >
	<h4 style="font-weight: bold;">Domicilio</h4>
	<br>
<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
	<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="40%">
		<label for="calle">Calle *</label>
		<input type="text" data-clear-btn="false" name="calle"  id="calle" value="" placeholder="" maxlength="100" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>

	<td width="10%">
		<label for="numExterior">Número Exterior *</label>
		<input type="number" data-clear-btn="false" name="numExterior" pattern="[0-9]*"  id="numExterior" value="" placeholder="">
	</td>
	<td width="10%">
		<label for="numInterior">Número Interior</label>
		<input type="text" data-clear-btn="false" name="numInterior"  id="numInterior" value="" placeholder="" maxlength="5" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>
	<td width="20%">
		<label for="estado">Estado *</label>
		<input type="text" data-clear-btn="false" name="estado"  id="estado" value="" placeholder="" style="text-transform: uppercase;">
	</td>
	</tr>
	<tr width="100%">
	
	<table style="border-collapse: separate; border-spacing:  .2em;">
	<tr>
	<td width="20%">
		<label for="municipio">Município<label>
		<input type="text" data-clear-btn="false"  name="municipio"  id="municipio" value="" placeholder="" style="text-transform: uppercase;">
	</td>
	<td width="20%">
		<label for="ciudad">Ciudad *<label>
		<input type="text" data-clear-btn="false"  name="ciudad"  id="ciudad" value="" placeholder="" style="text-transform: uppercase;">
	</td>
	<td width="20%">
		<label for="colonia">Colonia *<label>
		<input type="text" data-clear-btn="false"  name="colonia"  id="colonia" value="" placeholder="" style="text-transform: uppercase;">
	</td>
	<td width="20%">
		<label for="codpostal">Código Postal<label>
		<input type="number" data-clear-btn="false"  name="codpostal"  id="codpostal" pattern="[0-9]*" maxlength="5" value="" placeholder="" style="text-transform: uppercase;">
	</td>
	</tr>
	</table>
	</tr>
	
	</table>
	<br>

	</div>
	
	</div>
	<br>
	<div class="ui-body ui-body-a ui-corner-all" >
	<h4 style="font-weight: bold;">Datos Padre / Madre</h4>
	<br>
<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="20%">
		<label for="padre">Nombre del Padre o Tutor *</label>
		<input type="text" data-clear-btn="false" name="padre"  id="padre" value="" placeholder="" maxlength="250" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>

	<td width="20%">
		<label for="cellPadre">Teléfono Celular *</label>
		<input type="number" data-clear-btn="false" name="cellPadre" pattern="[0-9]*"  maxlength="10" id="cellPadre" value="" placeholder="">
	</td>
	<td width="20%">
		<label for="profesionP">Profesión</label>
		<input type="text" data-clear-btn="false" name="profesionP"  id="profesionP" value="" placeholder="" maxlength="150" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>
	<td width="20%">
		<label for="emailP">Email Padre</label>
		<input type="email" data-clear-btn="false" name="emailP"  id="emailP" value="" placeholder="">
	</td>
	</tr>
	
	<tr>
	<td width="20%">
		<label for="madre">Nombre de la Madre *</label>
		<input type="text" data-clear-btn="false" name="madre"  id="madre" value="" placeholder="" maxlength="250" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>

	<td width="20%">
		<label for="cellMadre">Teléfono Celular *</label>
		<input type="number" data-clear-btn="false" name="cellMadre" pattern="[0-9]*" maxlength="10"  id="cellMadre" value="" placeholder="" >
	</td>
	<td width="20%">
		<label for="profesionM">Profesión</label>
		<input type="text" data-clear-btn="false" name="profesionM"  id="profesionM" value="" placeholder="" maxlength="150" onkeypress="return valida(3,event);" style="text-transform: uppercase;">
	</td>	
	<td width="20%">
		<label for="emailM">Email Madre</label>
		<input type="text" data-clear-btn="false" name="emailM"  id="emailM" value="" placeholder="">
	</td>
	</tr>
	
	</table>
	<br>

	</div>
	</div>
<br>
	<div class="ui-body ui-body-a ui-corner-all" >
	<h4 style="font-weight: bold;">Documentación Entregada</h4>
	<br>
<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
<table width="70%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="30%">
		<label>Boleta o Constancia de Grado Anterior</label>
	
	</td>

	<td width="10%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="boletaGdoAnteriorOrig" id="boletaGdoAnteriorOrig">Original
	    </label>
	</td>
	<td width="10%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="boletaGdoAnteriorCopy" id="boletaGdoAnteriorCopy">Copia
	    </label>
	</td>
	<td></td>
	
	</tr>
	
	<tr width="100%">
	<td width="30%">
		<label>Acta de Nacimiento</label>
	
	</td>

	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="actaNacimientoOrig" id="actaNacimientoOrig">Original
	    </label>
	</td>
	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="actaNacimientoCopy" id="actaNacimientoCopy">Copia
	    </label>
	</td>
	<td></td>
	</tr>
	
	<tr width="100%">
	<td width="30%">
		<label>Cartilla de Vacunación</label>
	
	</td>

	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="cartillaVacOrig" id="cartillaVacOrig">Original
	    </label>
	</td>
	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="cartillaVacCopy" id="cartillaVacCopy">Copia
	    </label>
	</td>
	<td></td>
	</tr>
	
	<tr width="100%">
	<td width="30%">
		<label>6 Fotos Tamaño Infantil</label>
	
	</td>

	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="fotosOrig" id="fotosOrig">Original
	    </label>
	</td>
	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="checkbox-0 ">Copia
	    </label>
	</td>
	<td></td>
	</tr>
	<tr width="100%">
	<td width="30%">
		<label>Certificado de Preescolar</label>
	
	</td>

	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="certifPreescolarOrig" id="certifPreescolarOrig">Original
	    </label>
	</td>
	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="certiPreescolarCopy" id="certifPreescolarCopy">Copia
	    </label>
	</td>
	<td></td>
	</tr>
	<tr width="100%">
	<td width="30%">
		<label>Certificado de Primaria</label>
	
	</td>

	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="certiPrimariaOrig" id="certiPrimariaOrig" style="background-color: #E1E1E1">Original
	    </label>
	</td>
	<td width="20%">
		<label style="background-color: #E1E1E1;color: black;border-color: #F1F1F1;text-shadow: none;">
	        <input type="checkbox" name="certiPrimariaCopy" id="certiPrimariaCopy" style="background-color: #E1E1E1">Copia
	    </label>
	</td>
	<td></td>
	</tr>
	
	</table>
	<br>

	</div>


	
	</div>
	
	</form>
	<div class="ui-body ui-body-a ui-corner-all" >
	<form >
	<div style="margin-left:3em;padding-top: .7em">	
	<a href="XEPrincipal.jsp" onclick=""  class="ui-btn ui-btn-b ui-btn-inline " >Cancelar Registro</a>
<!-- 	<a href="" onclick="AltaAlumno()" type="" id="idBtnRegAlumno" class="ui-btn ui-btn-inline ui-shadow" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Continuar Registro</a> -->
	<a href="" onclick="AltaAlumno()" type="" id="idBtnRegAlumno" class="ui-btn ui-btn-inline ui-shadow" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Continuar Registro</a>
<!-- 	<a href="#popupColegiatura" onclick="agregarMes('Febrero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Eliminar Datos de Alumno</a> -->
	

</div>
	</form>

		  </div>
			
		</div>


	<div data-role="collapsible" id="idCollapInfoRegistro" style="display: none;" >
    	<h3 style="text-shadow: none;">FICHA DE INSCRIPCION DE ALUMNO</h3>
		<div id="idImprimirTicket" class="print">
		<h4 style="font-weight: bold;">FICHA DE INSCRIPCION DE ALUMNO</h4>
		<br>
		<br>
    	<div class="ui-body ui-body-a ui-corner-all" >
		
		<div style="background-color: #F6F6F6;">
		
			<br>

			
	<table width="100%" align="left" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="100%">
	<table width="100%" style="border-collapse: separate; border-spacing:  .2em;">
	<tr>
	<td width="20%;">
		<label style="font-weight: bold; font-size: .8em;">Nombre del Plantel:</label>
	</td>
	<td>
		<label id="nomColegioReg" style="text-decoration: underline; font-size: .8em;">COLEGIO CORAZONES MAGICOS</label>
	</td>
	<td>
		<label style="font-weight: bold; font-size: .8em;">Folio:</label>
	</td>
	<td>
		<label id="folioReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	</tr>
	<tr>
	<td width="20%;">
		<label style="font-weight: bold; font-size: .8em;">Ciudad:</label>
	</td>
	<td>
		<label id="ciudadReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	</tr>
	<tr>
	<td width="25%;">
		<label style="font-weight: bold; font-size: .8em;">Fecha de Inscripción:</label>
	</td>
	<td>
		<label id="fechaInscripcionReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	</tr>
	
	
	</table>
	</td>
	</tr>
	</table>
	</div>


<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
	
	<br>
			
	<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	
	<td width="100%">
	<table width="100%">
	<tr width="100%">
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Nombre(s):</label>
	</td>
	<td width="20%">
		<label  id="nombreReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	<td width="5%">
		<label style="font-weight: bold; font-size: .8em;">Sexo:</label>
	</td>
	<td width="10%">
		<label  id="sexoReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	<td width="5%">
		<label style="font-weight: bold; font-size: .8em;">Grado:</label>
	</td>
	<td width="20%">
		<label  id="gradoReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td width="100%">
	<table width="100%" style="border-collapse: separate; border-spacing:  .2em;">
		
	<tr>
	<td width="30%">
		<label style="font-weight: bold; font-size: .8em;">Fecha de Nacimiento:</label>
	</td>
	<td width="15%">
		<label id="fecnacimientoReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
		
	
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Edad:<label>
	</td>
	<td >
		<label id="edadReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
	<td width="10%">
	
		<label style="font-weight: bold;">CURP:</label>
	</td>
	<td width="15%">
		<label id="curpReg" style="text-decoration: underline; font-size: .8em;"></label>
	</td>
    </tr>
    </table>
    </td>
    </tr>
 
	</table>
	</div>
	</div>	
		  
	<div class="ui-body ui-body-a ui-corner-all" >

	<div style="background-color: #F6F6F6;">

	<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Domicilio:</label>
		
	</td>

	<td width="60%">
		<label id="domicilioReg" style="font-size: .8em;"></label>
		
	</td>

	</tr>

	
	</table>
	

	</div>
	
	</div>
	<br>
	<div class="ui-body ui-body-a ui-corner-all" >
<!-- 	<h4 style="font-weight: bold;">Datos Tutores</h4> -->

<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="15%">
		<label style="font-weight: bold; font-size: .8em;">Nombre del Padre o Tutor:</label>
		
	</td>
	<td width="20%">
		<label id="padreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>

	<td width="8%">
		<label style="font-weight: bold; font-size: .8em;">Teléfono Celular:</label>
		
	</td>
	<td width="8%">
		<label id="cellpadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Profesión:</label>
		
	</td>
	<td width="15%">
		<label id="profesionpadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Email Padre:</label>
		
	</td>
	<td width="15%">
		<label id="emailpadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	</tr>
	
		<tr width="100%">
	<td width="15%">
		<label style="font-weight: bold; font-size: .8em;">Nombre de la Madre:</label>
		
	</td>
	<td width="20%">
		<label id="madreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>

	<td width="8%">
		<label style="font-weight: bold; font-size: .8em;">Teléfono Celular:</label>
		
	</td>
	<td width="8%">
		<label id="cellmadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Profesión:</label>
		
	</td>
	<td width="15%">
		<label id="profesionmadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	<td width="10%">
		<label style="font-weight: bold; font-size: .8em;">Email Madre:</label>
		
	</td>
	<td width="15%">
		<label id="emailmadreReg" style="text-decoration: underline; font-size: .8em;"></label>
		
	</td>
	</tr>
	
	</table>
	<br>

	</div>
	</div>
<br>
	<div class="ui-body ui-body-a ui-corner-all" >
<!-- 	<h4 style="font-weight: bold;">Documentación Entregada</h4> -->
	<label id="emailmadreReg" style="text-decoration: underline; font-size: .8em;">Documentación Entregada</label>
	<br>
<!-- 	<h4 style="font-weight: bold;">Datos del Alumno</h4> -->
	<div style="background-color: #F6F6F6;">
	<table width="100%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em; margin-left: 5%; ">
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- Boleta o Constancia de Grado Anterior</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="boletaOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="boletaCopia"></span> )</label>
	</td>
	<td></td>
	
	</tr>
	
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- Acta de Nacimiento</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="actaOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="actaCopia"></span> )</label>
	</td>
	<td></td>
	</tr>
	
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- Cartilla de Vacunación</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="cartillaOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="cartillaCopia"></span> )</label>
	</td>
	<td></td>
	</tr>
	
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- 6 Fotos Tamaño Infantil</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="fotosOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="fotosCopia"></span> )</label>
	</td>
	<td></td>
	</tr>
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- Certificado de Preescolar</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="certiPreescolarOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="certiPreescolarCopia"></span> )</label>
	</td>
	<td></td>
	</tr>
	<tr width="100%">
	<td width="35%">
		<label style="font-weight: bold; font-size: .8em;">- Certificado de Primaria</label>
	
	</td>

	<td width="20%">
	<label style="font-weight: bold; font-size: .8em;">Original( <span id="certiPrimariaOriginal"></span> )</label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">Copia( <span id="certiPrimariaCopia"></span> )</label>
	</td>
	<td></td>
	</tr>
	
	</table>
	<br>

	</div>
	

	
	</div>
	
<table width="80%" align="center" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em; margin-left: 5%; ">
	<tr width="100%">
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">- COSTO DE INSCRIPCION:</label>
	
	</td>

	<td width="10%">
	<label id="costoInscripcion" style="text-decoration:underline; font-size: .8em;"><span id="costoInscripcion"></span></label>
		
	</td>
	<td width="20%">
		<label style="font-weight: bold; font-size: .8em;">- COSTO DE COLEGIATURA:</label>
	
	</td>

	<td width="10%">
	<label id="costoColegiatura" style="text-decoration:underline; font-size: .8em;"><span id="costoColegiatura"></span></label>
		
	</td>
	
	</tr>
	
	</table>

		
	<br>
	<br>
	<br>
		<label id="costoColegiatura" style="text-decoration:overline; ; font-size: .8em; margin-left: 40%;">FIRMA DEL PADRE O TUTOR</label>

		</div>
		<br>
	<a href="" id="btnImprimirReg" onclick="" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display:block;" >Imprimir Recibo</a>
	<a href="" id="btnImprimirFinReg" onclick="refreshPageRegAlta()" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display:block; margin-left: 10%" >&nbsp;&nbsp;Terminar &nbsp; &nbsp;</a>	
	<br>	
	<br>
    </div>
	</div>
</div><!-- Fin Main -->

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
     				<li>
                        <a href="">
                            <span class="ca-icon-2" id="heart">$</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Recepción de Pagos</h3>
                            </div>
                        </a>
                    </li>
                     <li onclick="">
                        <a  href="XERegAlumnoMenu.jsp">
                            <span class="ca-icon-2">&#97;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Registro de Alumnos</h3>
                            </div>
                        </a>
                    </li>
                    <li onclick="refreshPage()">
                        <a href="">
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
                        <a href="#popupCerrarSesion2" data-rel="popup" data-position-to="window" data-transition="pop">
                            <span class="ca-icon-2">&#88;</span>
                            <div class="ca-content-2">
                                <h3 class="ca-sub-2">Cerrar Sesión</h3>
                            </div>
                        </a>
                    </li>
                </ul>
</div><!-- /panel -->

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 <a href="http://www.softescolar.com" target="_blank" >SoftEscolar.com</a></p>
<p>&nbsp;</p>
</div><!-- /footer -->

</div><!-- Fin Page -->

</body>
</html>