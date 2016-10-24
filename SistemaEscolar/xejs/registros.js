
 $(document).ready(function() 
 { 
 	$('#folioregistro').DataTable( { 
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
//		"paginate": true,
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/objects.txt",
//		 "ajax": '../DataTables-1.10.12/examples/ajax/data/arrays_alumnos.txt',
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo2.txt",
		"ajax": {
			"url":"../servlet/XEConsultaRegistros?consulta=REGISTROS",
			"dataSrc":"data",
			"dataType": "json"
			
		},
//		"ajax": "../DataTables-1.10.12/examples/ajax/data/ejemplo.txt",
//		"deferRender": true,
		"info":true,
		"columns": 
 			[ 
// 				{ "data": "Nombre" }, 
// 				{ "data": "Matricula" }, 
// 				{ "data": "Grado" }, 
// 				{ "data": "Domicilio" }, 
// 				{ "data": "Estatus" },
// 				{ "data": "Fecha Nacimiento" },
// 				{ "data": "Fecha Ingreso" }
 				
 				{ "data": "idFolioReg" }, 
 				{ "data": "nombreAlumno" }, 
 				{ "data": "grado" }, 
 				{ "data": "fechaHrRegistro" }
 				
// 				{ "data": "grado" }, 
// 				{ "data": "domicilio" },
// 				{ "data": "estatus" },
// 				{ "data": "fechaNacimiento" },
// 				{ "data": "matricula" },
// 				{ "data": "fechaHrRegistro" },
//				{ "data": "nombre" } 
 				
// 				{ "data": "name" },
// 				{ "data": "position" },
// 				{ "data": "office" },
// 				{ "data": "extn" },
// 				{ "data": "start_date" },
// 				{ "data": "salary" }
 				
 			],
 			
// 			"footerCallback": function ( row, data, start, end, display ) {
// 				var api = this.api(), data;
//
// 				// Remove the formatting to get integer data for summation
// 				var intVal = function ( i ) {
// 					return typeof i === 'string' ?
// 						i.replace(/[\$,]/g, '')*1 :
// 						typeof i === 'number' ?
// 							i : 0;
// 				};
//
// 				// Total over all pages
// 				total = api
// 					.column( 5 )
// 					.data()
// 					.reduce( function (a, b) {
// 						return intVal(a) + intVal(b);
// 					}, 0 );
//
// 				// Total over this page
// 				pageTotal = api
// 					.column( 5, { page: 'current'} )
// 					.data()
// 					.reduce( function (a, b) {
// 						return intVal(a) + intVal(b);
// 					}, 0 );
//
// 				// Update footer
// 				$( api.column( 4 ).footer() ).html(
//// 					'$'+pageTotal +' ( $'+ total +' total)'
// 					'$'+pageTotal 
// 				);
// 				$( api.column( 3 ).footer() ).html(
// 	 					'Total: ( $'+ total +' total)'
// 	 				);
// 			}
 			
 			
 			
 			
 			} ); 
 	} );


