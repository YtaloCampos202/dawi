<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Consulta Tesis</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
<form id="id_form">
		<div class="row" >
			<div class="col-md-6">
				<label class="control-label" for="id_titulo">Título</label> 
				<input class="form-control" type="text" id="id_titulo" name="paramTitulo">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_estado">Estado</label> 
				<input class="form-control" type="checkbox" id="id_estado" name="paramEstado" checked="checked">
			</div>
		</div>
		<div class="row" style="margin-top: 2%">
			<div class="col-md-6">
				<label class="control-label" for="id_tema">Tema</label> 
				<input class="form-control" type="text" id="id_tema" name="paramTema">
			</div>
			<div class="col-md-6">
				<label class="control-label" for="id_alumno">Alumno</label> 
				<select id="id_alumno" name="paramAlumno" class='form-control'>
					<option value="-1">[ Todos ]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12" align="center">
				<button type="button" class="btn btn-primary" id="id_btn_filtra">FILTRA</button>
				<button type="button" class="btn btn-danger" id="id_btn_reporte">PDF</button>
			</div>
		</div>
		<div class="row" style="margin-top: 3%">
			<div class="col-md-12">
				<table id="id_table" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th style="width: 22%">Título</th>
							<th style="width: 23%">Tema</th>
							<th style="width: 15%">Alumno</th>
							<th style="width: 15%">Estado</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
</form>	
</div>

<script type="text/javascript">
$.getJSON("listaAlumno", {}, function(data){
	$.each(data, function(i,item){
		$("#id_alumno").append("<option value="+item.idAlumno +">"+ item.nombres +"</option>");
	});
});

$("#id_btn_reporte").click(function(){ 
	$("#id_form").attr('action', 'reporteTesisPdf');
	$("#id_form").submit();
});


$("#id_btn_filtra").click(function(){
	var varTitulo = $("#id_titulo").val();
	var varTema = $("#id_tema").val();
	var varAlumno = $("#id_alumno").val();
	var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  

	console.log(">> varTitulo >> " + varTitulo );
	console.log(">> varTema >> " + varTema );
	console.log(">> varidAlumno >> " + varAlumno );
	console.log(">> varEstado >> " + varEstado );

	if (valFechaInicioMayFechaFin("#id_desde", "#id_hasta")){
		mostrarMensaje("La fecha hasta es superior a la fecha desde");
		return;
	}
	
	$.getJSON("consultaTesis", {"titulo": varTitulo, 
								"tema": varTema, 
								"idAlumno": varAlumno,
								"estado": varEstado }, function(data){
		agregarGrilla(data);
	});
});

function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idTesis"},
				{data: "titulo"},
				{data: "tema"},
				{data: "alumno.nombres"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},	
			]                                     
	    });
}

</script>   		
</body>
</html>