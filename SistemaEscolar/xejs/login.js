var $ = jQuery;
var _url = '../servlet/XEConsultaLogin?';
$(document).ready(function()
{
	$("#login").click(function()
	{
		var email = $("#user").val();
		var password = $("#password").val();

		// Checking for blank fields.
		if( email =='' || password =='')
		{
			$('input[type="text"],input[type="password"]').css("border","2px solid red");
			$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
			alert("Please fill all fields...!!!!!!");
		}
		else
		{
//			$.post("login.php",{ email1: email, password1:password},function(data) 
//			{
//				if(data=='Invalid Email.......') 
//				{
//					$('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
//					$('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
//					alert(data);
//				}
//				else 
//					if(data=='Email or Password is wrong...!!!!')
//					{
//						$('input[type="text"],input[type="password"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
//						alert(data);
//					} else 
//						if(data=='Successfully Logged in...')
//						{
//							$("form")[0].reset();
//							$('input[type="text"],input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
//							alert(data);
//						} 
//						else
//						{
//							alert(data);
//						}
//			});
			
//			 alert();
		      window.open('../xejsp/XEPrincipal.jsp', '_self');
		      return false;
		}
	});
	
	$("#login3").click(function()
	{
		var email = $("#user").val();
		var password = $("#password").val();

		// Checking for blank fields.
		if( email =='' || password =='')
		{
			$('input[type="text"],input[type="password"]').css("border","2px solid red");
			$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
			alert("Please fill all fields...!!!!!!");
		}
		else
		{
			
			var filtro = "email="+email;
			filtro = filtro + "&password="+password;
			
			
			$.post(_url, filtro,function(data, status){
				
				alert(data);
				 //window.open('../xejsp/XEPrincipal.jsp', '_self');
			});
			
			

//				      window.open('../xejsp/XEPrincipal.jsp', '_self');
//				      return false;
		}
	});
	
	
	
	
});



function inicioSesion()
{
	var email = $("#user").val();
	var password = $("#password").val();

	// Checking for blank fields.
	if( email =='' || password =='')
	{
//		$('input[type="text"],input[type="password"]').css("border","2px solid red");
//		$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
//		alert("Please fill all fields...!!!!!!");
		
		if( email =='')
		{
			$('input[type="text"]').css("border","2px solid red");
			$('input[type="text"]').css("box-shadow","0 0 3px red");
		}
		else
		{
			$('input[type="text"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		if(password =='')
		{
			$('input[type="password"]').css("border","2px solid red");
			$('input[type="password"]').css("box-shadow","0 0 3px red");
		}
		else
		{
			$('input[type="password"]').css({"border":"1px solid #00F5FF","box-shadow":"0 0 3px #00F5FF"});
		}
		
	}
	else
	{
		
		var filtro = "email="+email;
		filtro = filtro + "&password="+password;
		
		
		$.post(_url, filtro,function(data, status)
		{

//			var obj = jQuery.parseJSON( data );

			
			if(data.resp == 'OK')
			{
				window.open('../xejsp/XEPrincipal.jsp', '_self');
			}
			else
			{
			
				$('#spRespLogin').text("Aviso!. Usuario o Contraseña No Encontrado.");
				
				$("#idhMsgRespLogin").css("display", "block");
				
				
				setTimeout(function(){
					
					$('#idhMsgRespLogin').css("display", "none");
					$('#spRespLogin').text("");
					
				}, 5000);
				
			}
			
			 //window.open('../xejsp/XEPrincipal.jsp', '_self');
		});
		
//		$.post("login.php",{ email1: email, password1:password},function(data) 
//		{
//			if(data=='Invalid Email.......') 
//			{
//				$('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
//				$('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
//				alert(data);
//			}
//			else 
//				if(data=='Email or Password is wrong...!!!!')
//				{
//					$('input[type="text"],input[type="password"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
//					alert(data);
//				} else 
//					if(data=='Successfully Logged in...')
//					{
//						$("form")[0].reset();
//						$('input[type="text"],input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
//						alert(data);
//					} 
//					else
//					{
//						alert(data);
//					}
//		});
		
		 
//	      window.open('../xejsp/XEPrincipal.jsp', '_self');

//	      $("#login2").attr("href", "../xejsp/XEPrincipal.jsp");
//	      return false;
	}
	
}

function agregarMes(mes)
{
 	$('#spMes').text(mes);
}

function agregarInsc(mes)
{
 	$('#spMes2').text(mes);
}

