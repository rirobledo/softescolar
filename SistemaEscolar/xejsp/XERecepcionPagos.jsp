<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recepcion de Pagos</title>

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
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" />

<link rel="stylesheet" href="../DataTables-1.10.12/media/css/buttons.dataTables.min.css" />

<!-- DataTable -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.html5.min.js"></script>
<!-- <script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.flash.min.js"></script> -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jszip.min.js"></script>
<script type="text/javascript" src="../DataTables-1.10.12/media/js/buttons.print.min.js"></script>



<link rel="stylesheet" href="../xecss/myjquerymobile.css" />
<script type="text/javascript" src="../xejs/login.js" charset="UTF-8"></script>
<script type="text/javascript" src="../xejs/table.js" charset="UTF-8"></script>
<script type="text/javascript" src="../xejs/registrarPago.js" charset="UTF-8"></script>
<script type="text/javascript" src="../xejs/print.js"></script>
<script type="text/javascript" src="../xejs/tablePagos.js" charset="UTF-8"></script>

<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>

<!-- <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

<script type="text/javascript">


var spMes='';
  
$(function() {
    $('#colegiatura').maskMoney();
    $('#inscripcion').maskMoney();
    $('#libros').maskMoney();
    $('#uniformes').maskMoney();
    $('#seguroescolar').maskMoney();
    $('#transporteescolar').maskMoney();
    $('#credenciales').maskMoney();
    $('#transporte').maskMoney();
	$('#copias').maskMoney();

    
//     $( "#mypanel" ).panel( "open" );
    
    
  });

function mostrarAlumno(idAlumno,alumno)
{
 	$('#spMatricula').text(idAlumno);
 	$('#spAlumno').text(alumno);
 	$('#spMatricula2').text(idAlumno);
 	$('#spAlumno2').text(alumno);
 	$('#spMatricula3').text(idAlumno);
 	$('#spAlumno3').text(alumno);
}

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

	$( "#idSelAlumNuevoPag" ).collapsible( "expand" );
	var table = $('#example').DataTable();

	$('#example tbody').on( 'click', 'tr', function () 
	{

		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		if(table.row('.selected').data().matricula != '')
		{
		
			$('#idRegNuevoPag').removeClass('ui-state-disabled')
			$('#idConsPago').removeClass('ui-state-disabled')
			$( "#idCollapConsulta" ).collapsible( "collapse" );
		}
		mostrarAlumno(table.row('.selected').data().matricula, table.row('.selected').data().nombre)
	} );

	$('#button').click( function () {
		table.row('.selected').remove().draw( false );
	} );
	
// 	$("#btnImprimirPago").bind("click",function()
// 	{
// 		$("#idDatosPago").printArea();
// 	});
	
	$("#btnImprimirPago2").bind("click",function()
		{
		
		
		var options = { mode : "popup", popHt : "700", popWd : "900" };
				
		$('#idImprimirTicket').printArea(options);
		});
		
	$( "#idCollapConsulta" ).collapsible({
	  expand: function( event, ui ) {
	  
	  consultaTablePagos();
	  }
	});
	
} );
</script>


</head>
<body>
<div data-role="page" id="idRegPagos">
<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
	<a href="XEPrincipal.jsp" id ="idMenuPago" class="ui-btn ui-btn-b ui-btn-inline ui-icon-home ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	<h1 style="color: white; text-shadow: none;">REGISTRO DE PAGOS<img alt="" src="../images/COLEGIOTT.png" align="middle" width="14%" height="14%"  style="margin-top: -1em;"></h1>
	<a href="XEPrincipal.jsp" id="idRegresarPago" class="ui-btn ui-btn-b ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a>
</div><!-- Fin Header -->
<div role="main" class="ui-content" style="width: 100%;">
<h1 style="color: white; text-shadow: none;"> <img alt="" src="../images/softescolar2.png" align="right" width="10%" height="10%" style="margin-right: 3em; position: relative; margin-top: -0.5em;" ></h1>
	<div class="containerTb" style="margin-top: 0em;">

		<div class="ui-body-a ui-body" >
		
		<div id="idSelAlumNuevoPag" data-role="collapsible" data-theme="d" data-content-theme="d">
    	<h3 style="text-shadow: none;">DATOS DE ALUMNOS</h3>
		<div class="ui-body ui-body-a ui-corner-all" style="background-color: #F6F6F6;" id="idBusAlu">
		<h4 style="font-weight: bold;">Favor de Buscar y Seleccionar un Alumno</h4>

		  </div>
	<div class="ui-body ui-body-a ui-corner-all" id="idTableAlu" >
	
<!-- 	<br> -->
	<TABLE id=example class=display cellSpacing=0 width="100%"> 
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

		</div>
		
	<div id="idRegNuevoPag" class="ui-state-disabled" data-role="collapsibleset" data-corners="false" data-theme="d" data-content-theme="d" title="Clic para registrar un pago"  >
    
    <div data-role="collapsible" style="background-color: #F2F5FA;" id="idCollapRegi">
        <h3 style="text-shadow: none;">Registrar Nuevo Pago</h3>

	<div id="idDatosPago" data-role="controlgroup" class="print">
	<br>
	<h3 class="ui-bar ui-bar-c" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">Alumno:  <spam id="spMatricula" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> - <spam id="spAlumno" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> </h3>
	
	

	<table width="100%" align="center" align="center" style="margin-left: 10%;">
	<tr>
	<td width="50%" style="margin-left: 10%;">
	
	<table width="80%" style="margin-left: 10%;">
	<tr>
	<td width="14%" align="left">
<!-- 		<label for="mesPago">Pago del Mes:</label> -->
		<p>Mes / Año:</p>
	</td>
	<td width="20%" >
		
		
		<div class="ui-field-contain" style="width: 95%;" >
    	
	    <select name="mesPago" id="mesPago" data-mini="true" data-theme="a" >
			<option value=""></option>
	        <option value="ENERO">ENERO</option>
	        <option value="FEBRERO">FEBRERO</option>
	        <option value="MARZO">MARZO</option>
	        <option value="ABRIL">ABRIL</option>
	        <option value="MAYO">MAYO</option>
	        <option value="JUNIO">JUNIO</option>
	        <option value="JULIO">JULIO</option>
	        <option value="AGOSTO">AGOSTO</option>
	        <option value="SEPTIEMBRE">SEPTIEMBRE</option>
	        <option value="OCTUBRE">OCTUBRE</option>
	        <option value="NOVIEMBRE">NOVIEMBRE</option>
	        <option value="DICIEMBRE">DICIEMBRE</option>
	    </select>
		</div>
		

	</td>
		<td width="40%" >

		<div class="ui-field-contain" style="width: 40%;" >
    	
	    <select name="yearPago" id="yearPago" data-mini="true" data-theme="a" placeholder="Año">
			<option value=""></option>
	        <option value="2016">2016</option>
	        <option value="2017">2017</option>
	        <option value="2018">2018</option>
	    </select>
		</div>
	
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr width="100%" style="margin-left: 10%;">
	<td width="50%" style="margin-left: 10%;">
	<table width="100%" align="center" style="margin-left: 10%;" >
	
	<tr>
	<td width="15%">
		<label for="inscripcion">Inscripción:</label>
	</td>
	<td width="10%">
	<table>
	<tr>
	<td>
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="inscripcion"  id="inscripcion" value="" placeholder="Importe Inscripción">
	</td>
	</tr>
	</table>
		
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="libros">Libros:</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="libros"  id="libros" value="" placeholder="Importe libros">
		</td>
		</tr>
		</table>	
		
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="uniformes">Uniformes:</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="uniformes"  id="uniformes" value="" placeholder="Importe Uniformes">
		</td>
		</tr>
		</table>	
		
	</td>
	</tr>
	<tr>
	<td width="15%">
		<label for="seguroescolar">Seguro Escolar:</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="seguroescolar"  id="seguroescolar" value="" placeholder="Importe Seguro Escolar">
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr>
	<td width="15%">
		<label for="credenciales">Credenciales:</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="credenciales"  id="credenciales" value="" placeholder="Importe Credenciales">
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr>
	<td width="15%">
		<label for="copias">Copias e Impresoras:</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="copias"  id="copias" value="" placeholder="Importe Copias e Impresoras">
		</td>
		</tr>
		</table>
		
	</td>
	<tr width="100%">
	<td width="15%">
		
	</td>
	<td width="50%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
		<tr width="100%">
	<td width="15%">
		
	</td>
	<td width="90%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	</tr>
	<tr>
	<td align="center">
	<div>
	
	</div>
	</td>
	</tr>
 
	</table>
	</td>
	
	<td width="50%">
	<table width="100%" align="center" style="margin-left: 0%;">
	<tr width="100%">
	<td width="10%">
		<label for="colegiatura">Colegiatura:</label>
	</td>
	<td width="50%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="colegiatura"  id="colegiatura" value="" placeholder="Importe Colegiatura">
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr width="100%">
	<td width="10%">
		<label for="transporte">Transporte Escolar:</label>
	</td>
	<td width="90%">
		<table>
		<tr>
		<td>
			<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="transporte"  id="transporte" value="" placeholder="Importe Transporte">
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr height="100%">
	<td width="10%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr height="100%">
	<td width="10%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>	
		
	</td>
	</tr>
	<tr height="100%">
	<td width="10%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>	
		
	</td>
	</tr>
	<tr height="100%">
	<td width="15%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr height="100%">
	<td width="15%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr height="100%">
	<td width="15%">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
	<tr height="100%">
	<td align="center">
		<label for="">&nbsp;</label>
	</td>
	<td width="10%">
		<table>
		<tr>
		<td>
			
		</td>
		</tr>
		</table>
		
	</td>
	</tr>
 
	</table>
	</td>
	
	</tr>
	</table>

	

</div>
	<br>
	<table width="100%" align="center" >
	<tr height="2em" >
	<td width="100%" height="100%" align="center">
	<h3 class="ui-bar ui-bar-a" id="idhMsgRespPago" style="color: black;text-shadow: false; font-weight: normal; display: none;"><p id="spRespPago" style="color:black; text-shadow:none; font-weight: bold; font-size:1.0em; " ></p></h3>
	<h3 class="ui-bar ui-bar-a" id="idhMsgRespFolio" style="color: black;text-shadow: false; font-weight: normal; display: none;"><p id="spRespPagoFolio" style="color:black; text-shadow:none; font-weight: bold; font-size:1.0em; " ></p></h3>
	
	
	</td>
	</tr>
	<tr height="2em">
	<td height="100%" >
	
	<a href="" id="btnAltaPago" onclick="AltaPago();" class="ui-btn ui-btn-inline custom-btn" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none; margin-top: 2%;" >Registrar Pago</a>
    
	</td>
	<td height="100%">
	
<!-- 	<a href="" id="btnImprimirPago" onclick="" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display: none;" >Imprimir Recibo</a> -->
    
	</td>
	</tr>
	</table>
	<br>
 </div>
	<br>
	
	<div data-role="collapsible" id="idCollapInfo" style="display: none;" >
    	<h3 style="text-shadow: none;">INFORMACION SOBRE EL PAGO</h3>
		<div id="idImprimirTicket" class="print">
    	
		<div data-role="controlgroup" >
		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: bold; text-align: center; ">RECIBO DE PAGO</h3>
		<br>
		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">FOLIO: <spam id="spFolio" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam></h3>
		<br>
		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">ESCUELA: COLEGIO CORAZONES MAGICOS</h3>
		</div>
		<div data-role="controlgroup" >
		<br>
		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">ALUMNO:  <spam id="spMatricula2" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> - <spam id="spAlumno2" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam></h3>
<!-- 		<br> -->
<!-- 		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">CONCEPTOS:</h3> -->
		</div>
		<br>
		
		<div class="ui-body ui-body-a ui-corner-all">
	
		<!-- 	<br> -->
			<TABLE id="datoFolioPago" class="display nowrap" cellSpacing=0 width="100%"> 
				<THEAD> 
					<TR> 
						<TH>Mes</TH>
						<TH>Concepto</TH>
						<TH>Cantidad</TH>
						<TH>Fecha</TH>
					</TR>
				</THEAD> 
			</TABLE>

	</div>
		</div>
		<br>
	<a href="" id="btnImprimirPago2" onclick="" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display:block;" >Imprimir Recibo</a>
	<a href="" id="btnImprimirFinalizar" onclick="refreshPagePagos()" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display:block; margin-left: 10%" >&nbsp;&nbsp;Terminar &nbsp; &nbsp;</a>	
	<br>	
	<br>
    </div>
<br>
	
	<div data-role="collapsible" id="idCollapConsulta2" title="Clic para consultar pagos" style="display: none;">
    	<h3 style="text-shadow: none;">Consultar Pagos</h3>
    	<div data-role="controlgroup" >
		<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; color: black;text-shadow: false; font-weight: normal; ">Alumno:  <spam id="spMatricula3" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> - <spam id="spAlumno3" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> </h3>
		</div>
		<div class="ui-body ui-body-a ui-corner-all">
	
		<!-- 	<br> -->
			<TABLE id="datosPagoAlumno2" class="display" cellSpacing=0 width="100%"> 
				<THEAD> 
					<TR> 
						<TH>Alumno</TH>
						<TH>Mes</TH>
						<TH>Concepto</TH>
						<TH>Cantidad</TH>
						<TH>Fecha</TH>
					</TR>
				</THEAD> 
			</TABLE>

	</div>
    </div>

	</div>	
		
		
		
		</div>
		

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


</div><!-- Fin Main -->

<!-- <div data-role="popup" id="popupCerrarSesion2" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:700px; width: 400px;"> -->
<!-- <div data-role="controlgroup" >     -->
<!-- <h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; background-color: #2595FF; color: white;text-shadow: false; font-weight: normal; ">Mensaje</h3> -->
<!--     <div role="main" class="ui-content"> -->
<!--         <h3 class="ui-title" style="text-align: center;">¿Desea Cerrar la Sesión?</h3> -->
<!-- 	<br> -->
<!-- 	<div>	 -->
<!-- 		<table align="center" style="border-collapse: separate; border-spacing:  .2em;"> -->
<!-- 		<tr align="center"> -->
<!-- 		<td> -->
<!-- 		<a href="#" class="ui-btn ui-btn-a ui-btn-inline " data-transition="none" data-rel="back" style="border: 1px solid #dddddd;">Cancelar</a> -->
		
<!-- 		</td> -->
<!-- 		<td> -->
<!-- 		<a href="XELogin.jsp" class="ui-btn ui-btn-a ui-btn-inline " data-transition="none">Aceptar</a> -->
<!-- 		</td> -->
<!-- 		</tr> -->
<!-- 		</table> -->
<!--        </div>  -->
		
<!--     </div> -->
<!-- </div>      -->
<!-- </div> -->

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 <a href="http://www.softescolar.com" target="_blank" >SoftEscolar.com</a></p>
<p>&nbsp;</p>
</div><!-- /footer -->
</div><!-- Fin Page -->

</body>
</html>