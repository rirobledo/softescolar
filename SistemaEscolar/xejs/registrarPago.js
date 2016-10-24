

/*Inicia proceso de carga de documento y declaracion de variables*/
 
//var contextPath = '/SistemaEscolar'; 


//var _urlAltaAlu = contextPath+'/servlet/XERegistrarAlumno?'; 
var _url = '../servlet/XERegistrarPago?';

var hiddenWindow = "";
/*
 *Metodos para validaciones
 */
//jQuery.validator.addMethod("pwdVal", function(value, element)
//{
//	return this.optional(element) || /(?=^[^\s]{8,128}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.test(value);
//});
//
//jQuery.validator.addMethod("rfcVal", function(value, element)
//{
//	return this.optional(element) || /^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$/.test(value);
//});
//
//jQuery.validator.addMethod("letrasVal", function(value, element)
//{
//	return this.optional(element) || /^[a-zA-Z. ]*$/.test(value);
//});
//
//jQuery.validator.addMethod("valueEquals", function(value, element, arg)
//{
//	return arg == value;
//});
//jQuery.validator.addMethod("valueDif", function(value, element, arg)
//{
//	return arg != value;
//});
//
//jQuery.validator.addMethod("numVal", function(value, element)
//{
//	return this.optional(element) || /^([0-9]){10}$/.test(value);
//});
//
//jQuery.validator.addMethod("cpVal", function(value, element)
//{
//	return this.optional(element) || /^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$/.test(value);
//});

//$(document).ready(function() {	
//
//	inicio();
////	});
////
////
////
////$(document).ready(function()
////{
//	/* $(function() { */
//
//	
//
//});



/*Funcion principal*/
function inicio()
{
//	alert('inicioZonas');
	/*Oculta div mensaje*/


//	$("#idBtnRegAlumno").click(function(e){
////		alert('idBtnRegAlumno');
//		AltaAlumno();
//    		
//    	
//	});
	
	
}




/*Funcion que indica si es numerico o no*/
function esNumerico(event)
{
 if(event.shiftKey)
 {
  event.preventDefault();
 }
 
 switch (event.keyCode) 
 { 
  /*Permite Ctrl + v*/
  case 86: if (event.ctrlKey) 
  { // detects ctrl + v 
   return ""; 
  }
  break; 
 }
  
 if (event.keyCode == 46 || event.keyCode == 8)    
 {
     //
 }
 else 
 {
  if (event.keyCode < 95) 
  {
   if (event.keyCode < 48 || event.keyCode > 57) 
   {
    event.preventDefault();
   }
  } 
  else 
  {
   if (event.keyCode < 96 || event.keyCode > 105) 
   {
    event.preventDefault();
   }
  }
 }

	
}





/*Funcion que muestra mensaje*/
function muestraMensaje(msj)
{
	
	$("#dialog-Mensaje").dialog({
	    autoOpen: false,
	    hide: "scale",
	    title: 'Alerta',
//	    position: "center",
	    position: {
            my: "center",
            at: "center",
            of: $("body"),
            within: $("body")
        },
	    draggable: false,
	    width : 400,
	    height : 170, 
	    resizable : false,
	    modal : true,
	    //dialogClass: 'myDialogClass',
	    show: 'scale',
	    open: function(event, ui )
	     {
	      //progressTimer = setTimeout( progress, 2000 );
	    	$(".ui-dialog-titlebar-close", ui.dialog | ui).show();
	    },
	 	close: function( event, ui ) {
	 		$( "#dialog-Mensaje" ).dialog( "close" );
	 		
	 	}
	});
	
	
	$( "#cat-mensaje" ).text(msj);
	$( "#dialog-Mensaje" ).dialog( "open" );
	
}


/*funcion que cierra mensaje*/
function cierraMensaje()
{
	
	var mensaje = $("#mensaje");
	mensaje.hide();
	mensaje.dialog();
	mensaje.dialog({ dialogClass: 'hide-close' });
	mensaje.dialog('close');
}




function AltaPago(){
	
	//alert('Entrando ValidaZonas');
//	alert();
	bandMsg = false;
	banFocus = false;
	
	
//	alert($( "#mesPago" ).val());
		if( $( "#mesPago" ).val() == '')
		{
			$('input[name$="mesPago"]').css("border","1px solid red");
			$('input[name$="mesPago"]').focus();
			bandMsg = true;
			banFocus = true;
			$('#spRespPago').text("Aviso!. Favor de Seleccionar un Mes.");
			
			$("#idhMsgRespPago").css("display", "block");
			
			
			setTimeout(function(){
				
				$('#idhMsgRespPago').css("display", "none");
				$('#spRespPago').text("");
				
			}, 5000);
		}
		else
		{
			if( $( "#yearPago" ).val() == '')
			{
				$('input[name$="yearPago"]').css("border","1px solid red");
				$('input[name$="yearPago"]').focus();
				bandMsg = true;
				banFocus = true;
				$('#spRespPago').text("Aviso!. Favor de Seleccionar un Año.");
				
				$("#idhMsgRespPago").css("display", "block");
				
				
				setTimeout(function(){
					
					$('#idhMsgRespPago').css("display", "none");
					$('#spRespPago').text("");
					
				}, 5000);
			}
			else
			{
			
			
				$('input[name$="yearPago"]').css({"border":"1px solid #dddddd","box-shadow":"0 0 1px #dddddd"});
				
				if($( "#inscripcion" ).val() =='' && $( "#libros" ).val() =='' && $( "#uniformes" ).val() =='' && $( "#seguroescolar" ).val() =='' && $( "#credenciales" ).val() =='' && $( "#copias" ).val() =='' && $( "#colegiatura" ).val() =='' && $( "#transporte" ).val() =='')
				{
	//				$('input[name$="apellidoPat"]').css("border","1px solid red");
	//				
	//				if(banFocus == false)
	//				{
	//					$('input[name$="apellidoPat"]').focus();
	//					banFocus = true;
	//				}
					
					$('#spRespPago').text("Aviso!. Favor de escribir un Importe.");
					
					$("#idhMsgRespPago").css("display", "block");
					
					
					setTimeout(function(){
						
						$('#idhMsgRespPago').css("display", "none");
						$('#spRespPago').text("");
						
					}, 5000);
					
					
					
					bandMsg = true;
				
				}
				else
				{
					
				}
			}
			
		}
		
		
		

	
	
	if(bandMsg == false)
	{
		
				
		var filtro = "inscripcion="+$( "#inscripcion" ).val();
		filtro = filtro + "&libros="+$( "#libros" ).val();
		filtro = filtro + "&uniformes="+$( "#uniformes" ).val();
		filtro = filtro + "&seguroescolar="+$( "#seguroescolar" ).val() ;
		filtro = filtro + "&credenciales="+$( "#credenciales" ).val() 
		filtro = filtro + "&copias="+$( "#copias" ).val() ;
		filtro = filtro + "&colegiatura="+$( "#colegiatura" ).val() ;
		filtro = filtro + "&transporte="+$( "#transporte" ).val() ;
		filtro = filtro + "&idAlumno="+$( "#spMatricula" ).text();
		filtro = filtro + "&nomAlumno="+$( "#spAlumno" ).text();
		filtro = filtro + "&mesPago="+$( "#mesPago" ).val()+" "+$( "#yearPago" ).val();
		
//		filtro = filtro + "&usuarioAlta="+$( "#usuarioAlta" ).val() ;
		
		
	
		
	//	muestraProgressBarZonas();
		
	//	alert();
		
		$.post(_url, filtro,function(data, status){
			
//			alert(data.resp);
			
			$('#spRespPago').text("Aviso!. Datos Agregados con \u00C9xito.");
			$('#spRespPagoFolio').text("Favor de Imprimir el Recibo. FOLIO:"+data.resp);
			$('#spFolio').text(data.resp);
			
			$("#inscripcion").attr("disabled", "disabled");
			$("#libros").attr("disabled", "disabled");
			$("#seguroescolar").attr("disabled", "disabled");
			$("#credenciales").attr("disabled", "disabled");
			$("#copias").attr("disabled", "disabled");
			$("#colegiatura").attr("disabled", "disabled");
			$("#transporte").attr("disabled", "disabled");
			$("#uniformes").attr("disabled", "disabled");
			
			$("#idMenuPago").attr("disabled", "disabled");
			$("#idRegresarPago").attr("disabled", "disabled");
			
			$("#idhMsgRespPago").css("display", "block");
			$("#idhMsgRespFolio").css("display", "block");
			$("#btnImprimirPago").css("display", "block");
			$("#btnAltaPago").css("display", "none");
			
			$("#idMenuPago").css("display", "none");
			$("#idRegresarPago").css("display", "none");
			
			
			$("#idCollapInfo").css("display", "block");
			$("#idCollapRegi").css("display", "none");
			
			$( "#idCollapInfo" ).collapsible( "expand" );
			$( "#idCollapConsulta" ).css("display", "none");
			$( "#idBusAlu" ).css("display", "none");
			$( "#idTableAlu" ).css("display", "none");
		
			
			imprimirFolioTable();
			
//			 window.open('../xejsp/XERegAlumnosA2.jsp?folio='+data.idFolioReg+'&nombreAlum='+data.nombreAlumno+'&grado='+data.grado+'&fechaRegistro='+data.fechaHrRegistro, '_self');
			
			
		});
	
	}

}





/*Funcion para mostrar progressbar de Pantalla de domicilios*/
function muestraProgressBarZonas() 
{

	
	
	$("#progressbarZonas").dialog({
	    autoOpen: false,
	    hide: "scale",
	    title: '',
	    closeText: "hide",
	    dialogClass: "no-close",
//	    position: "center",
//	    position: {
//	        my: "center",
//	        at: "center",
//	        of: $("body"),
//	        within: $("body")
//	    },
	    draggable: false,
	    width : 400,
	    height : 170, 
	    resizable : false,
	    modal : true,
	    //dialogClass: 'myDialogClass',
	    show: 'scale',
	    open: function(event, ui )
	     {
	      //progressTimer = setTimeout( progress, 2000 );
	    	$(".ui-dialog-titlebar-close").hide();
	    },
	 	close: function( event, ui ) {
	 		$( "#progressbarZonas" ).dialog( "close" );
	 		
	 	}
	});


	 $( "#progressbarZonas" ).dialog( "open" );
	
	

 


 
 
}


/*Funcion para validar caracteres*/
function valida(x, evt)
{
	evt = (evt) ? evt : event;
	var key = (document.all) ? evt.keyCode : evt.which;

	if(key==13)
	{
		//buscaDomicilio();
	
	}

	if (key==39) // ' comilla simple
	{
		return false;
	}
	else if(key==59) // ; punto y coma
	{
		return false;
	}
	else if(key==46) // . Punto
	{
		return true;
	}
	else if(key==58) // : dos puntos
	{
		return false;
	}
	//else if(key==95){return false;} // _ guion bajo
	else if(key==0)// tabulador
	{
		return true;
	}   
	else if(key==9)
	{
		return true;
	}
	else if(key==8)
	{	
		return true;
	}
	else if(x == 1)//numeros
	{
		return esDigito(key); 
	} 
	else if(x == 2)//letras
	{
		return esCaracter(key); 
	} 
	else if(x == 3)//alfanumerico
	{
		return esAlfaNumerico(key); 
	} 
	else if(x == 4)//descripcion
	{
		return esDescripcion(key); 
	} 
	else if(x == 5)//letras y espacios
	{
		return esNombre(key);
	}
	else if(x == 6)//>
	{
		return noEsNada(key);
	}
	else if(x == 7)//numeros
	{
		return esRango(key);
	}
}

function esDigito(key) 
{ 
	return ( (key > 47 && key < 58) || key == 8 || key == 9 || key == 32); 
}

function esCaracter(key)
{
	 return ( (key >= 97 && key <= 122) || (key >= 65 && key <= 90) ||key == 241 || key == 209 || key == 8|| key == 32 || key == 45); 
}

function esAlfaNumerico(key)
{ 
	return (esDigito(key) || esCaracter(key));
}

function esDescripcion(key)
{
	 return (esAlfaNumerico(key) || key==40 || key==41 || key == 32 || (key >= 44 && key <= 46) ||key == 58 || key == 59 || key == 95  || key == 45) || key==44; 
}

function esNombre(key)
{
	return (esCaracter(key) || key == 32);
}

function noEsNada(key)
{
	return ('');
}

function esRango(key)
{
	 return (esDigito(key) || (key >= 44 && key <= 45) ||key == 0); 
}

