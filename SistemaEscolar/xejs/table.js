
 $(document).ready(function() 
 { 
	 $("#example").dataTable().fnDestroy();
 	$('#example').DataTable( { 
 		"language":	 {
		    "sProcessing":     "Procesando...",
		    "sLengthMenu":     "Mostrar _MENU_ registros",
		    "sZeroRecords":    "No se encontraron resultados",
		    "sEmptyTable":     "Ning\u00FAn dato disponible en esta tabla",
		    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
		    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
		    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		    "sInfoPostFix":    "",
		    "sSearch":         "Buscar:",
		    "sUrl":            "",
		    "sInfoThousands":  ",",
		    "sLoadingRecords": "Cargando...",
		    "oPaginate": {
		        "sFirst":    "Primero",
		        "sLast":     "Último",
		        "sNext":     "Siguiente",
		        "sPrevious": "Anterior"
		    },
		    "oAria": {
		        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
		        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
		    }
		},
		"processing": true, 
		"filter":true,
//		"serverSide": true,
//		"pagingType": "simple_numbers",
//		"sort": true,
		"paginate": true,
		"lengthChange": true,
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//		 "ajax": '../DataTables-1.10.12/examples/ajax/data/arrays_alumnos.txt',
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo2.txt",
		"ajax": {
			"url":"../servlet/XEDatosAlumnos?",
//			"data": "consulta=registros",
			"dataSrc":"data",
			"dataType": "json",
			
			
		},
		"scrollX": "100%",
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo.txt",
//		"deferRender": true,
		"info":true,
//		"dom": "Bfrtip",
//        "buttons": [
//            "excelHtml5"
//        ],
        
		"columns": 
 			[ 
 				
 				{ "data": "nombre" }, 
 				{ "data": "matricula" }, 
 				{ "data": "grado" }, 
 				{ "data": "domicilio" }, 
 				{ "data": "estatus" },
 				{ "data": "fechaNacimiento" },
 				{ "data": "fechaHrRegistro" }
 				
 			]
 			
 			} ); 
 	
	 $("#exampleAlum").dataTable().fnDestroy();
	 	$('#exampleAlum').DataTable( { 
	 		"language":	 {
			    "sProcessing":     "Procesando...",
			    "sLengthMenu":     "Mostrar _MENU_ registros",
			    "sZeroRecords":    "No se encontraron resultados",
			    "sEmptyTable":     "Ning\u00FAn dato disponible en esta tabla",
			    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
			    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
			    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
			    "sInfoPostFix":    "",
			    "sSearch":         "Buscar:",
			    "sUrl":            "",
			    "sInfoThousands":  ",",
			    "sLoadingRecords": "Cargando...",
			    "oPaginate": {
			        "sFirst":    "Primero",
			        "sLast":     "Último",
			        "sNext":     "Siguiente",
			        "sPrevious": "Anterior"
			    },
			    "oAria": {
			        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
			        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
			    }
			},
			"processing": true, 
			"filter":true,
//			"serverSide": true,
//			"pagingType": "simple_numbers",
//			"sort": true,
			"paginate": true,
			"lengthChange": true,
//			"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//			 "ajax": '../DataTables-1.10.12/examples/ajax/data/arrays_alumnos.txt',
//			"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo2.txt",
			"ajax": {
				"url":"../servlet/XEDatosAlumnos?",
//				"data": "consulta=registros",
				"dataSrc":"data",
				"dataType": "json",
				
				
			},
			"scrollX": "100%",
//			"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo.txt",
//			"deferRender": true,
			"info":true,
			"dom": "Bfrtip",
	        "buttons": [
	            "excelHtml5"
	        ],
	        
			"columns": 
	 			[ 
	 				
	 				{ "data": "nombre" }, 
	 				{ "data": "matricula" }, 
	 				{ "data": "grado" }, 
	 				{ "data": "domicilio" }, 
	 				{ "data": "estatus" },
	 				{ "data": "fechaNacimiento" },
	 				{ "data": "fechaHrRegistro" }
	 				
	 			]
	 			
	 			} );
 	
 	
 	} );


