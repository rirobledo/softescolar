

/*Inicia proceso de carga de documento y declaracion de variables*/
 
//var contextPath = '/SistemaEscolar'; 


//var _urlAltaAlu = contextPath+'/servlet/XERegistrarAlumno?'; 
var _urlAltaAlu = '../servlet/XERegistrarAlumno?';

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




function AltaAlumno(){
	
	//alert('Entrando ValidaZonas');
//	alert();
	bandMsg = false;
	banFocus = false;
		if( $( "#nombre" ).val() =='')
		{
			$('input[name$="nombre"]').css("border","1px solid red");
			$('input[name$="nombre"]').focus();
			bandMsg = true;
			banFocus = true;
			
		}
		else
		{
			$('input[name$="nombre"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#apellidoPat" ).val() =='')
		{
			$('input[name$="apellidoPat"]').css("border","1px solid red");
			
			if(banFocus == false)
			{
				$('input[name$="apellidoPat"]').focus();
				banFocus = true;
			}
			
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="apellidoPat"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#sexo" ).val() =='')
		{
			$('input[name$="sexo"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="sexo"]').focus();
				banFocus = true;
			}
			bandMsg = false;
		
		}
		else
		{
			$('input[name$="sexo"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#fecnacimiento2" ).val() =='')
		{
			$('input[name$="fecnacimiento2"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="fecnacimiento2"]').focus();
				banFocus = true;
			}
			bandMsg = false;
		
		}
		else
		{
			$('input[name$="fecnacimiento2"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#edad" ).val() =='')
		{
			$('input[name$="edad"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="edad"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="edad"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#curp" ).val() =='')
		{
			$('input[name$="curp"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="curp"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="curp"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#grado" ).val() =='')
		{
			$('input[name$="grado"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="grado"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="grado"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#nivelgrado" ).val() =='')
		{
			$('input[name$="nivelgrado"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="nivelgrado"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="nivelgrado"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#cicloEscolar" ).val() =='')
		{
			$('input[name$="cicloEscolar"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="cicloEscolar"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="cicloEscolar"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#calle" ).val() =='')
		{
			$('input[name$="calle"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="calle"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="calle"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#numExterior" ).val() =='')
		{
			$('input[name$="numExterior"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="numExterior"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="numExterior"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}

		if($( "#estado" ).val() =='')
		{
			$('input[name$="estado"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="estado"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="estado"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#municipio" ).val() =='')
		{
			$('input[name$="municipio"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="municipio"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="municipio"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#ciudad" ).val() =='')
		{
			$('input[name$="ciudad"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="ciudad"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="ciudad"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#colonia" ).val() =='')
		{
			$('input[name$="colonia"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="colonia"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="colonia"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#codpostal" ).val() =='')
		{
			$('input[name$="codpostal"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="codpostal"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="codpostal"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#padre" ).val() =='')
		{
			$('input[name$="padre"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="padre"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="padre"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#cellPadre" ).val() =='')
		{
			$('input[name$="cellPadre"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="cellPadre"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="cellPadre"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#madre" ).val() =='')
		{
			$('input[name$="madre"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="madre"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="madre"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
		if($( "#cellMadre" ).val() =='')
		{
			$('input[name$="cellMadre"]').css("border","1px solid red");
			if(banFocus == false)
			{
				$('input[name$="cellMadre"]').focus();
				banFocus = true;
			}
			bandMsg = true;
		
		}
		else
		{
			$('input[name$="cellMadre"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		

		
		if($('#boletaGdoAnteriorOrig').prop('checked'))
		{
			
			$('#boletaGdoAnteriorOrig').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		else
		{
			
			if(banFocus == false)
			{
				$('#boletaGdoAnteriorOrig').focus();
				banFocus = true;
			}
//			$('#boletaGdoAnteriorOrig').css("border","1px solid red");
			$('input[name$="boletaGdoAnteriorOrig"]').css("border","1px solid red");
			bandMsg = true;
			
		}
		
		if($( "#boletaGdoAnteriorCopy" ).prop('checked'))
		{
			$( "#boletaGdoAnteriorCopy" ).css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		
		}
		else
		{
			
			
			if(banFocus == false)
			{
				$('#boletaGdoAnteriorCopy').focus();
				banFocus = true;
			}
//			$('#boletaGdoAnteriorCopy').css("border","1px solid red");
			bandMsg = true;

		}
	
	
	if(bandMsg == false)
	{
		var filtro = "nombre="+$( "#nombre" ).val();
		filtro = filtro + "&apellidoPat="+$( "#apellidoPat" ).val();
		filtro = filtro + "&apellidoMat="+$( "#apellidoMat" ).val() ;
		filtro = filtro + "&sexo="+$( "#sexo" ).val() 
		filtro = filtro + "&fecnacimiento="+$( "#fecnacimiento2" ).val() ;
		filtro = filtro + "&edad="+$( "#edad" ).val() ;
		filtro = filtro + "&curp="+$( "#curp" ).val() ;
		filtro = filtro + "&grado="+$( "#grado" ).val()+" "+$( "#nivelgrado" ).val();
		filtro = filtro + "&cicloEscolar="+$( "#cicloEscolar" ).val();
	
		/**Datos del Domicilio*///
		filtro = filtro + "&calle="+$( "#calle" ).val() ;
		filtro = filtro + "&numExterior="+$( "#numExterior" ).val() ;
		filtro = filtro + "&numInterior="+$( "#numInterior" ).val() ;
		filtro = filtro + "&estado="+$( "#estado" ).val() ;
		filtro = filtro + "&municipio="+$( "#municipio" ).val() ;
		filtro = filtro + "&ciudad="+$( "#ciudad" ).val() ;
		filtro = filtro + "&colonia="+$( "#colonia" ).val() ;
		filtro = filtro + "&codpostal="+$( "#codpostal" ).val() ;
		
		var domicilio = $( "#calle" ).val()+" "+$( "#numExterior" ).val()+" ";
		if($( "#numInterior" ).val().lengh > 0)
		{
			domicilio = domicilio + " INT "+ $( "#numInterior" ).val()+" ";
		}

		domicilio = domicilio + $( "#municipio" ).val()+" "+$( "#ciudad" ).val();
		domicilio = domicilio + $( "#colonia" ).val()+" "+$( "#codpostal" ).val()+" "+$( "#estado" ).val();
						
						
		/**Datos del Padre y Madre***/
		filtro = filtro + "&padre="+$( "#padre" ).val() ;
		filtro = filtro + "&cellPadre="+$( "#cellPadre" ).val() ;
		filtro = filtro + "&profesionP="+$( "#profesionP" ).val() ;
		filtro = filtro + "&emailP="+$( "#emailP" ).val() ;
		filtro = filtro + "&madre="+$( "#madre" ).val() ;
		filtro = filtro + "&cellMadre="+$( "#cellMadre" ).val() ;
		filtro = filtro + "&profesionM="+$( "#profesionM" ).val() ;
		filtro = filtro + "&emailM="+$( "#emailM" ).val() ;
		
		/**Documentos Entregados**/
		filtro = filtro + "&boletaOrig="+$( "#boletaGdoAnteriorOrig" ).val() ;
		filtro = filtro + "&boletaCopy="+$( "#boletaGdoAnteriorCopy" ).val() ;
		filtro = filtro + "&actaNacimientoOrig="+$( "#actaNacimientoOrig" ).val() ;
		filtro = filtro + "&actaNacimientoCopy="+$( "#actaNacimientoCopy" ).val() ;
		filtro = filtro + "&cartillaVacOrig="+$( "#cartillaVacOrig" ).val() ;
		filtro = filtro + "&cartillaVacCopy="+$( "#cartillaVacCopy" ).val() ;
		filtro = filtro + "&fotosOrig="+$( "#fotosOrig" ).val() ;
		filtro = filtro + "&certifPreescolarOrig="+$( "#certifPreescolarOrig" ).val() ;
		filtro = filtro + "&certifPreescolarCopy="+$( "#certifPreescolarCopy" ).val() ;
		filtro = filtro + "&certiPrimariaOrig="+$( "#certiPrimariaOrig" ).val() ;
		filtro = filtro + "&certiPrimariaCopy="+$( "#certiPrimariaCopy" ).val() ;
		
	
		
	//	muestraProgressBarZonas();
		
	//	alert();
		
		$.post(_urlAltaAlu, filtro,function(data, status){
			
			
			$( "#folioReg" ).text(data.idFolioReg);
			$( "#ciudadReg" ).text($( "#ciudad" ).val());
			$( "#fechaInscripcionReg" ).text(data.fechaHrRegistro);
			$( "#nombreReg" ).text(data.nombreAlumno);
			$( "#sexoReg" ).text($( "#sexo" ).val());
			$( "#gradoReg" ).text($( "#grado" ).val()+" "+$( "#nivelgrado" ).val());
			$( "#fecnacimientoReg" ).val($( "#fecnacimiento2" ).val());
			$( "#edadReg" ).text($( "#edad" ).val());
			$( "#curpReg" ).text($( "#curp" ).val());
			$( "#domicilioReg" ).text(domicilio);
			
			$( "#padreReg" ).text($( "#padre" ).val());
			$( "#cellpadreReg" ).text($( "#cellPadre" ).val());
			$( "#profesionpadreReg" ).text($( "#profesionP" ).val());
			$( "#emailpadreReg" ).text($( "#emailP" ).val());
			$( "#madreReg" ).text($( "#madre" ).val());
			
			$( "#cellmadreReg" ).text($( "#cellMadre" ).val());
			$( "#profesionmadreReg" ).text($( "#profesionM" ).val());
			$( "#emailmadreReg" ).text($( "#emailM" ).val());
			
			
			
			
			if($( "#boletaGdoAnteriorOrig" ).val() != '')
			{
				$( "#boletaOriginal" ).text("X");
			}
			
			if($( "#boletaGdoAnteriorCopy" ).val() != '')
			{
				$( "#boletaCopia" ).text("X");
			}
			
			if($( "#actaNacimientoOrig" ).val() != '')
			{
				$( "#actaOriginal" ).text("X");
			}
			
			if($( "#actaNacimientoCopy" ).val() != '')
			{
				$( "#actaCopia" ).text("X");
			}
			
			if($( "#cartillaVacOrig" ).val() != '')
			{
				$( "#cartillaOriginal" ).text("X");
			}
			
			if($( "#cartillaVacCopy" ).val() != '')
			{
				$( "#cartillaCopia" ).text("X");
			}
			
			if($( "#fotosOrig" ).val() != '')
			{
				$( "#fotosOriginal" ).text("X");
			}
			
			if($( "#certifPreescolarOrig" ).val() != '')
			{
				$( "#certiPreescolarOriginal" ).text("X");
			}
			if($( "#certifPreescolarCopy" ).val() != '')
			{
				$( "#certiPreescolarCopia" ).text("X");
			}
			
			if($( "#certiPrimariaOrig" ).val() != '')
			{
				$( "#certiPrimariaOriginal" ).text("X");
			}
			if($( "#certiPrimariaCopy" ).val() != '')
			{
				$( "#certiPrimariaCopia" ).text("X");
			}
			
			
			
			$( "#costoInscripcion" ).text("1000");
			$( "#costoColegiatura" ).text("1000");
			
			$( "#idCollapInfoRegistro" ).collapsible( "expand" );
			$("#idCollapInfoRegistro").css("display", "block");
			$("#idCapturaDatosInscripcion").css("display", "none");
	
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

