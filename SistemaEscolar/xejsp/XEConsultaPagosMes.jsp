<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Pagos Por Mes</title>

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

<!-- DataTable -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" />

<link rel="stylesheet" href="../xecss/myjquerymobile.css" />
<script type="text/javascript" src="../xejs/login.js"></script>



<script type="text/javascript">

var spMes='';
  
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
 
   alert('XEPagos');
  window.open('../xejsp/XEDatosAlumnos.jsp', '_self');
}
</script>


</head>
<body>
<div data-role="page" id="idRegPagos">
<div data-role="header" style="overflow:hidden;background-color: #2595FF;">
	<a href="#mypanel" class="ui-btn ui-btn-inline ui-icon-bars ui-btn-icon-left" style="margin-left: 5%; margin-top: 1%; font-size: 1em">Menú</a>
	<h1 style="color: white;">REGISTRO DE PAGOS</h1>
	<a href="XEPrincipal.jsp" class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" title="Página Anterior" style="margin-right : 10%; margin-top: 1%;"></a>
</div><!-- Fin Header -->
<div role="main" class="ui-content" style="width: 100%;">
	<div class="containerTb">

		<div class="ui-body-a ui-body">
		
		  <div class="ui-body ui-body-a ui-corner-all" >
			<table>
			<tr>
			<td width="60%">
			<form class="ui-filterable">
				    <input id="autocomplete-input" data-type="search"
					placeholder="Buscar Por Nombre de Alumno...">
					
			</form>
			<ul id="autocomplete" data-role="listview" data-inset="true"
				data-filter="true" data-input="#autocomplete-input"></ul>
			</td>
			<td width="30%" >
			<form class="ui-filterable" style="margin-top: 1.8em;">
					
					<input id="autocomplete-input-2" data-type="search"
					placeholder="Buscar Por Matrícula...">
			</form>
			<ul id="autocomplete2" data-role="listview" data-inset="true"
				data-filter="true" data-input="#autocomplete-input-2"></ul>
			</td>
			<td width="10%">
			</td>
			</tr>
			</table>		      

		  </div>
	<div class="ui-body ui-body-a ui-corner-all" >
	<br>
	<h4 style="font-weight: bold;">Datos del Alumno</h4>
	<div style="background-color: #F6F6F6;">
	
	<table style=" margin-left: 4em;" width="100%">
	<tr>
	

	<td width="20%" ">
	
	
	<div class="ui-field-contain" style="background-color: #F6F6F6; width: 48%; " >
	<label for="idmatricula" style="width: 18%; text-align: left;">Matrícula:</label>
	 <input type="text" readonly="readonly" name="idmatricula" id="idmatricula" placeholder="Matrícula" value="" align="left" >
	

	</div>
	</td>
	<td width="30%">
	<div class="ui-field-contain" style="background-color: #F6F6F6; width: 80%;" align="left" >
	
	
	<label for="idgrado" style="width: 10%;text-align: left: ;">Grado:</label>
	
	<input type="text" readonly="readonly" name="idgrado" id="idgrado" placeholder="Grado" value=""  >
	  

	</div>
</td>
<td width="40%">

</td>
<td width="40%">

</td>
	</tr>
		<tr>
	
	
	<td width="60%" ">
<div class="ui-field-contain" style="background-color: #F6F6F6; width: 80%; height: 50%;" >
	  <label for="idnomalumno" style="width: 10%; text-align: left: ;">Nombre:</label>
	 <input type="text" readonly="readonly" name="idnomalumno" id="idnomalumno" placeholder="Nombre" value="" align="left" >

	</div>
	</td>
<td width="40%">

</td>
	</tr>
	
	</table>
	</div>
	<table width="100%" >
	<tr>
	<td width="100%">
	<br>
	<h4 style="font-weight: bold;">Seleccione el Mes</h4>
<!-- 	<form style="background-color: #F6F6F6;height: 5em;"> -->
	<form >
	<div style="margin-left:3em;padding-top: .7em">
	<a href="#popupInscripcion" onclick="agregarInsc('Inscripción')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline ui-shadow" data-transition="pop" style="background-color: #FEC32E; border-color: #FEC32E; color: black; text-shadow: none;">Inscripción</a>
	<a href="#popupColegiatura" onclick="agregarMes('Enero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Enero</a>
	<a href="#popupColegiatura" onclick="agregarMes('Febrero')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Febrero</a>
	<a href="#popupColegiatura" onclick="agregarMes('Marzo')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Marzo</a>
	<a href="#popupColegiatura" onclick="agregarMes('Abril')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Abril</a>
	<a href="#popupColegiatura" onclick="agregarMes('Mayo')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Mayo</a>
	<a href="#popupColegiatura" onclick="agregarMes('Junio')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Junio</a>
	<a href="#popupColegiatura" onclick="agregarMes('Julio')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Julio</a>
	<a href="#popupColegiatura" onclick="agregarMes('Agosto')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Agosto</a>
	<a href="#popupColegiatura" onclick="agregarMes('Septiembre')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Septiembre</a>
	<a href="#popupColegiatura" onclick="agregarMes('Octubre')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Octubre</a>
	<a href="#popupColegiatura" onclick="agregarMes('Noviembre')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Noviembre</a>
	<a href="#popupColegiatura" onclick="agregarMes('Diciembre')" data-rel="popup" data-position-to="window" class="ui-btn ui-btn-inline " data-transition="pop">Diciembre</a>

</div>
	</form>
	
	<br>
	</td>

	</tr>
	</table>
	</div>
		<br>	
		
		
		
		
		
		</div>
	</div>

<div data-role="popup" id="popupColegiatura" style="width: 30em; height: 14em;" data-dismissible="false">
<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
 
<div data-role="controlgroup" >
<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; background-color: #2595FF; color: white;text-shadow: false; font-weight: normal; ">Concepto del Pago:  <spam id="spMes" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em; " ></spam> </h3>

	<table width="70%" align="center" >
	<tr width="100%">
	<td width="10%">
		<label for="colegiatura">Colegiatura:</label>
	</td>
	<td width="90%">
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="colegiatura"  id="colegiatura" value="" placeholder="Importe Colegiatura">
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="inscripcion">Transporte Escolar:</label>
	</td>
	<td width="10%">
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="trasporteescolar"  id="trasporteescolar" value="" placeholder="Transporte Escolar">
	</td>
	</tr>
	<tr>
	
	
	
	<tr>
	<td width="10%">
	
	<div >
	<a href="#" class="ui-btn ui-btn-inline custom-btn" style="top: 85%">Aceptar</a>
	</div>
	
	</td>
	</tr>
 
	</table>

</div>

</div><!-- Fin de Popup Colegiatura -->

<div data-role="popup" id="popupInscripcion" style="width: 30em; height: 25em;" data-dismissible="false">
<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
 
<div data-role="controlgroup" >
<h3 class="ui-bar ui-bar-a" style="margin-top: -1.7em; background-color: #2595FF; color: white;text-shadow: false; font-weight: normal; ">Concepto del Pago:  <spam id="spMes2" style="color:black; text-shadow:none; font-weight: bold; font-size:1.2em;" ></spam></h3>

	<table width="70%" align="center" >
	<tr width="100%">
	<td width="10%">
		<label for="colegiatura">Colegiatura:</label>
	</td>
	<td width="90%">
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="colegiatura"  id="colegiatura" value="" placeholder="Importe Colegiatura">
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="inscripcion">Inscripción:</label>
	</td>
	<td width="10%">
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="inscripcion"  id="inscripcion" value="" placeholder="Importe Inscripcion">
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="libros">Libros:</label>
	</td>
	<td width="10%">	
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="libros"  id="libros" value="" placeholder="Importe libros">
	</td>
	</tr>
	<tr>
	<td width="10%">
		<label for="uniformes">Uniformes:</label>
	</td>
	<td width="10%">	
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="uniformes"  id="uniformes" value="" placeholder="Importe Uniformes">
	</td>
	</tr>
	<tr>
	<td width="15%">
		<label for="seguroescolar">Seguro Escolar:</label>
	</td>
	<td width="10%">
		<input type="text" data-clear-btn="false" data-prefix="$ " data-thousands="," data-decimal="." name="seguroescolar"  id="seguroescolar" value="" placeholder="Importe Seguro Escolar">
	</td>
	</tr>
	
	<tr>
	<td align="center">
	<div>
	<a href="#" class="ui-btn ui-btn-inline custom-btn" style="top: 89%;" >Aceptar</a>
	</div>
	</td>
	</tr>
 
	</table>

</div>

</div><!-- Fin de Popup inscripcion -->




</div><!-- Fin Main -->
<div data-role="panel" id="mypanel" class="" data-display="overlay" data-dismissible="true"  style="border: 1px solid #f6f6f6; background-color: #336CA6;" >
    <!-- panel content goes here -->
    <a href="#idRegPagos" class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all" data-rel="close" ></a>
    
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
<div data-role="popup" id="popupCerrarSesion2" data-overlay-theme="b" data-theme="a" data-dismissible="false"  style="max-width:400px;">
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
</div><!-- Fin Page -->

</body>
</html>