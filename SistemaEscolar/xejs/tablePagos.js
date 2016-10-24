
function imprimirFolioTable() 
 { 
	$("#datoFolioPago").dataTable().fnDestroy();
 	$('#datoFolioPago').DataTable( { 
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
		"filter":false,
//		"serverSide": true,
//		"pagingType": "simple_numbers",
//		"sort": true,
		"info":false,
		"paginate": false,
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//		 "ajax": '../DataTables-1.10.12/examples/ajax/data/arrays_alumnos.txt',
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo2.txt",
		"ajax": {
			"url":"../servlet/XEConsultaRegistros?consulta=DATOSFOLIOPAGOS"+"&folio="+$('#spFolio').text(),
//			"data": "consulta=DATOSFOLIOPAGOS"+"&folio="+$('#spFolio').text(),
			"dataSrc":"data",
			"dataType": "json"
			
		},
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo.txt",
//		"deferRender": true,
		 
		"columns": 
 			[ 

 				
				{ "data": "mesPago" },
 				{ "data": "concepto" }, 
 				{ "data": "cantidad" },
 				{ "data": "fecha" }

 				

 				
 			],
 			
		
 			
 			
 			} ); 
 	} 

function consultaTablePagos() 
{ 
	
	$("#datosPagoAlumno").dataTable().fnDestroy();
	$('#datosPagoAlumno').DataTable( { 
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
//		"info":false,
//		"paginate": false,
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//		 "ajax": '../DataTables-1.10.12/examples/ajax/data/arrays_alumnos.txt',
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo2.txt",
		"ajax": {
			"url":"../servlet/XEConsultaRegistros?consulta=CONSULTAPAGOS"+"&folio="+$('#spFolio').text()+"&matricula="+$('#spMatricula2').text(),
//			"data": "consulta=DATOSFOLIOPAGOS"+"&folio="+$('#spFolio').text(),
			"dataSrc":"data",
			"dataType": "json"
			
		},
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo.txt",
//		"deferRender": true,
		"dom": "Bfrtip",
        "buttons": [
             "excel"
        ],
		"columns": 
			[ 
			    { "data": "idFolioReg" },
				{ "data": "mesPago" },
				{ "data": "concepto" }, 
				{ "data": "cantidad" },
				{ "data": "fecha" }

				
			],
			
	
			
			
			} ); 
	} 
