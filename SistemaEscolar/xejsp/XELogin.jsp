
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Iniciar Sesion</title>
<!-- <link rel="stylesheet" href="../xecss/demo.css"/> -->
<!-- <link rel="stylesheet" href="../xecss/style1.css"/> -->
<!-- <link href="../jquery_1.12.0/jquery-ui.css" rel="stylesheet"> -->
<link rel="shortcut icon" href="../images/favicon.ico">
<link rel="stylesheet" href="../xecss/demo.css"/>
<link rel="stylesheet" href="../xecss/style4.css"/>
<link rel="stylesheet" href="../xecss/style2_1.css"/>



<script src="../jquery_1.12.0/external/jquery/jquery.js" charset="UTF-8"></script>
 <script src="../jquery_1.12.0/jquery-ui.js" charset="UTF-8"></script>

 <link rel="stylesheet" href="../xecss/style.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.css" />
<link rel="stylesheet"	href="../jquery.mobile-1.4.5/my-jquery.mobile-1.4.5.css" />
<script src="../jquery.mobile-1.4.5/jquery.mobile-1.4.5.js" charset="UTF-8"></script>

<!-- DataTable -->
<script type="text/javascript" src="../DataTables-1.10.12/media/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="../DataTables-1.10.12/media/css/jquery.dataTables.css" />

<!-- <link rel="stylesheet" href="../xecss/myjquerymobile.css" /> -->
 <script type="text/javascript" src="../xejs/login.js" charset="UTF-8"></script>


</head>

<body>
<div data-role="page" id="idLoginIni" >
<div data-role="header" data-position="fixed" data-position="fixed" style="overflow:hidden;background-color: #2595FF;">
	
	<h1 style="color: white; text-shadow: none;">SISTEMA ESCOLAR <img alt="" src="../images/COLEGIOTT.png" align="middle" width="14%" height="14%"  style="margin-top: -1em;"></h1>
	
	
</div><!-- Fin Header -->

<div role="main" class="ui-content">

<div data-role="login" id="idLogin">

<div class="container">

	<div class="main" style="margin-top: -10px">
	<img alt="" src="../images/softescolar.png" align="middle" width="60%" height="60%" style="margin-left: 4.2em;">

		
		<form>
        <div style="padding:10px 10px; margin-top: -3em;">
            <h1>Inicio de Sesión</h1>
            <label for="user" class="ui-hidden-accessible">Usuario:</label>
            <input type="text" name="user" id="user" value="test@hotmail.com" placeholder="Usuario" data-theme="a">
            <label for="password" class="ui-hidden-accessible">Contraseña:</label>
            <input type="password" name="password" id="password" value="12345" placeholder="Contraseña" data-theme="a">
            <button type="button" id="login2" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-btn-icon-left ui-icon-check" onclick="inicioSesion();">Iniciar</button>
<!-- 			<a href="" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b"  data-transition="flow" onclick="inicioSesion();">Aceptar</a> -->
        </div>
    </form>
<!-- 		<div> -->
<!-- 	<a href="#XEPrincipal.jsp" class="ui-btn ui-btn-inline custom-btn" style="top: 89%;" >Aceptar</a> -->
<!-- 	</div> -->
		
		<h3 class="ui-bar ui-bar-a" id="idhMsgRespLogin" style="color: black;text-shadow: false; font-weight: normal; display: none;"><p id="spRespLogin" style="color:black; text-shadow:none; font-weight: bold; font-size:1.0em; " ></p></h3>

	</div>
</div>
</div>
</div>

<div data-role="footer" data-position="fixed" data-tap-toggle="false" class="jqm-footer">
<!--     <p>jQuery Mobile Demos version <span class="jqm-version"></span></p> -->
   <p align="right" style="margin-right: 5em; font-size: 12px;">Copyright 2016 <a href="http://www.softescolar.com" target="_blank" >SoftEscolar.com</a></p>
<p>&nbsp;</p>
</div><!-- /footer -->

</div>
</body>
</html>