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

<script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" />
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/buttons.dataTables.min.css" />

<script type="text/javascript" src="../DataTables-1.10.12/media/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.html5.min.js"></script>
<!-- <script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.flash.min.js"></script> -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jszip.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.print.min.js"></script>
<script type="text/javascript" src="../xejs/table.js"></script>

<script type="text/javascript" src="../xejs/registrarAlumno.js"></script>






<script type="text/javascript">

var spMes='';

 
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
	var table = $('#exampleAlum').DataTable();

	$('#exampleAlum tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		if(table.row('.selected').data().matricula != '')
		{
		
			$('#idCollapDatosAlumnos').removeClass('ui-state-disabled')
			
			$( "#idCollapDatosAlumnos" ).collapsible( "expand" );
		}
		
	} );

	$('#button').click( function () {
		table.row('.selected').remove().draw( false );
	} );
} );

</script>


</head>
<body onload="">
<div data-role="page" id="idDatosAlumnos">

<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
<!-- 	<a href="#mypanel" class="ui-btn ui-btn-b ui-btn-inline ui-icon-bars ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a> -->
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-btn-inline ui-icon-home ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	<h1 style="color: white; text-shadow: none;">INFORMACION DE ALUMNOS<img alt="" src="../images/COLEGIOTT.png" align="middle" width="14%" height="14%"  style="margin-top: -1em;"></h1>
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a>
</div><!-- Fin Header -->
<div role="main" class="ui-content" style="width: 100%;">
<h1 style="color: white; text-shadow: none;"> <img alt="" src="../images/softescolar2.png" align="right" width="10%" height="10%" style="margin-right: 3em; position: relative; margin-top: -0.5em;" ></h1>
	<div class="containerTb" style="margin: 2em auto">

		<div class="ui-body-a ui-body">
		<div class="ui-body ui-body-a ui-corner-all" >
			<h4 style="font-weight: bold;">Favor de Buscar y Seleccionar un Alumno</h4>

		</div>	
	<div class="ui-body ui-body-a ui-corner-all" >
	<TABLE id="exampleAlum" class="display nowrap" cellSpacing=0 width="100%"> 
		<THEAD> 
			<TR> 
				<TH>Nombre</TH> 
				<TH>Matrícula</TH> 
				<TH>Grado</TH> 
				<TH>Domicilio</TH> 
				<TH>Estatus</TH> 
				<TH>Fecha Nacimiento</TH>
				<TH>Fecha Registro</TH>
			</TR>
		</THEAD> 

		
	</TABLE>
	
	</div>
<!-- 	<div class="ui-body ui-body-a ui-corner-all" > -->
<!-- 	<form > -->
<!-- 	<div style="margin-left:3em;padding-top: .7em"> -->
<!-- 	<a href="XERegAlumnosA1.jsp" onclick="" class="ui-btn ui-btn-inline ui-shadow"  style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Registrar Alumno Nuevo</a> -->
<!-- 	<a href="" onclick="agregarMes('Enero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Modificar Datos de Alumno</a> -->
<!-- 	<a href="#popupColegiatura" onclick="agregarMes('Febrero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Eliminar Datos de Alumno</a> -->
	

<!-- </div> -->
<!-- 	</form> -->

<!-- 	</div> -->
	<div data-role="collapsible" id="idCollapDatosAlumnos"  data-theme="d" class="ui-state-disabled">
    	<h3 style="text-shadow: none;">DATOS GENERALES DEL ALUMNO</h3>
	
		
		<!-- INICIA DE CONSULTA DE DATOS -->
		<div class="ui-body ui-body-a ui-corner-all">
		<br>
<table width="80%" align="left" cellspacing="0" cellpadding="0.1em" style="border-collapse: separate; border-spacing:  .2em;">
	<tr width="100%">
	<td width="30%">
		<label style="font-weight: bold;">¿Desea Actualizar Datos Generales del Alumno?</label>
	
	</td>

	<td width="10%">
		<label style="color: black;border-color: #F1F1F1;text-shadow: none;">
	       <input type="checkbox" name="boletaGdoAnteriorOrig" id="actualizaDatosGen" style="margin-top: -1.0em;">SI
	    </label>
	</td>
	<td width="10%">
		
	</td>
	<td></td>
	
	</tr>
	
	
	</table>
	<br>

	</div>
			
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
	<a href="" onclick=""  class="ui-btn ui-btn-a ui-btn-inline " >Actualizar Registro</a>
<!-- 	<a href="" onclick="AltaAlumno()" type="" id="idBtnRegAlumno" class="ui-btn ui-btn-inline ui-shadow" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Continuar Registro</a> -->
<!-- 	<a href="" onclick="AltaAlumno()" type="" id="idBtnRegAlumno" class="ui-btn ui-btn-inline ui-shadow" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Continuar Registro</a> -->
<!-- 	<a href="#popupColegiatura" onclick="agregarMes('Febrero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Eliminar Datos de Alumno</a> -->
	

</div>
	</form>

		  </div>
			

		
		<!-- FIN DE CONSULTA DE DATOS -->
		
		
	
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
     				<li onclick="refreshPagePagos()">
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
<div data-role="popup" id="popupCerrarSesion3" data-overlay-theme="b" data-theme="a" data-dismissible="false"  style="max-width:400px;">
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

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 <a href="http://www.softescolar.com" target="_blank" >SoftEscolar.com</a></p>
<p>&nbsp;</p>
</div><!-- /footer -->

</div><!-- Fin Page -->

</body>
</html>