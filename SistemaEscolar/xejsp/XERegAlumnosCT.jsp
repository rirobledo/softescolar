<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta Registro de Alumnos</title>

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

<script type="text/javascript" src="../xejs/registros.js"></script>

<script type="text/javascript" src="../xejs/registrarAlumno.js"></script>

<script type="text/javascript" src="../xejs/print.js"></script>






<script type="text/javascript">

var spMes='';

//  $(document).ready(function() 
//  { 
//  	$('#example').DataTable( { 
//  		"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt", 
//  		"columns": 
//  			[ 
//  				{ "data": "name" }, 
//  				{ "data": "position" }, 
//  				{ "data": "office" }, 
//  				{ "data": "extn" }, 
//  				{ "data": "start_date" }, 
//  				{ "data": "salary" } 
//  			] 
 			
 			
 			
//  			} ); 
//  	} );
 
$(function() {
    $('#colegiatura').maskMoney();
    $('#inscripcion').maskMoney();
    $('#libros').maskMoney();
    $('#uniformes').maskMoney();
    $('#seguroescolar').maskMoney();
    $('#transporteescolar').maskMoney();

    
//     $( "#mypanel" ).panel( "open" );
    
    
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

/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
             '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
             '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
        '</tr>'+
    '</table>';
}

$(document).ready(function() {

	var table = $('#folioregistro').DataTable();
	
	$('#folioregistro tbody').on( 'click', 'tr', function () {
		

		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		
		
		if(table.row('.selected').data().idFolioReg != '')
		{
		
			$('#idCollapConsInfoRegistro').removeClass('ui-state-disabled')
			$("#idCollapConsInfoRegistro").css("display", "block");
			$( "#idCollapConsInfoRegistro" ).collapsible( "expand" );
			
// 			$('#idRegNuevoPag').removeClass('ui-state-disabled')
// 			$('#idConsPago').removeClass('ui-state-disabled')
// 			$( "#idCollapConsulta" ).collapsible( "collapse" );
		}
// 		mostrarAlumno(table.row('.selected').data().matricula, table.row('.selected').data().nombre)
	} );


	$("#btnImprimirReg").bind("click",function()
		{
		
		
		var options = { mode : "popup", popHt : "700", popWd : "900" };
				
		$('#idImprimirTicket').printArea(options);
		});

// 	$( "#idCollapConsIngreso" ).collapsible( "expand" );

// 	var table = $('#example').DataTable( {
//         "ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//         "columns": [
//             {
//                 "className":      'details-control',
//                 "orderable":      false,
//                 "data":           null,
//                 "defaultContent": ''
//             },
//             { "data": "name" },
//             { "data": "position" },
//             { "data": "office" },
//             { "data": "salary" }
//         ],
//         "order": [[1, 'asc']]
//     } );
     
//     // Add event listener for opening and closing details
//     $('#example tbody').on('click', 'td.details-control', function () {
//         var tr = $(this).closest('tr');
//         var row = table.row( tr );
 
//         if ( row.child.isShown() ) {
//             // This row is already open - close it
//             row.child.hide();
//             tr.removeClass('shown');
//         }
//         else {
//             // Open this row
//             row.child( format(row.data()) ).show();
//             tr.addClass('shown');
//         }
//     } );
} );

</script>


</head>
<body onload="">
<div data-role="page" id="idConsNvoIngreso">


<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
	<a href="XEPrincipal.jsp" class="ui-btn ui-btn-b ui-btn-inline ui-icon-home ui-btn-icon-left" data-theme="b" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	<h1 style="color: white; text-shadow: none;">CONSULTA DE SOLICITUDES NUEVO INGRESO</h1>
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
	<TABLE id=folioregistro class=display cellSpacing=0 width="100%"> 
		<THEAD> 
			<TR> 
				<TH>Folio</TH> 
				<TH>Nombre</TH> 
				<TH>Grado</TH> 
				<TH>Fecha Registro</TH>
			</TR>
		</THEAD> 
		
	</TABLE>
	
	</div>
	<br>
	
 <div data-role="collapsible" id="idCollapConsInfoRegistro" class="ui-state-disabled" data-theme="d" style="display: block;" >
    	<h3 style="text-shadow: none;">DETALLE DE INSCRIPCION DE ALUMNO</h3>
		<div id="idImprimirTicket" class="print">
		<h4 style="font-weight: bold;">FICHA DE INSCRIPCION DE ALUMNO (RE-IMPRESION)</h4>
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
	<a href="XEPrincipal.jsp" id="btnImprimirFinReg" onclick="" class="ui-btn ui-btn-a ui-btn-inline custom-btn" style=" text-shadow: none; margin-top: 2%; display:block; margin-left: 10%" >&nbsp;&nbsp;Terminar &nbsp; &nbsp;</a>	
	<br>	
	<br>
    </div>

		  
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