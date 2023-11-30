<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Intranet</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 5%">
		<h4 style="font-size: 230%; text-align: center; color: #1F096D">Consulta
			Alumno</h4>
	</div>

	<div class="container" style="margin-top: 2%">

		<form id="id_form">
			<div class="container">
				<div class="row" style="margin-top: 2%">
					<!-- <div class="col-md-6" >
				<label class="control-label" for="id_nombrec">Nombre</label> 
				<input class="form-control" type="text" id="id_nombrec"	name="nombrec"  placeholder="Ingrese el nombre">
			</div> -->

					<div class="col-md-6" style="margin-top: 2%">
						<label class="control-label" for="id_nombrec">Nombre</label> <input
							class="form-control" type="text" id="id_nombrec"
							name="paramNombrec" placeholder="Ingrese el nombre">
					</div>

					<div class="col-md-4" style="margin-top: 2%">
						<label class="control-label" for="id_dni">Dni</label> <input
							class="form-control" type="text" id="id_dni" name="paramDni"
							placeholder="Ingrese el dni">
					</div>

					<div class="col-md-2" style="margin-top: 2%">
						<label class="control-label" for="id_estado">Estado</label> <input
							class="form-control" type="checkbox" id="id_estado"
							name="paramEstado" checked="checked">
					</div>
				</div>

				<div class="row" style="margin-top: 2%">
					<div class="col-md-3">
						<label class="control-label" for="id_desde">Fecha
							Nacimiento (Desde) </label> <input class="form-control" type="date"
							id="id_desde" name="paraDesde" value="1900-01-01">
					</div>


					<div class="col-md-3">
						<label class="control-label" for="id_hasta">(Hasta) </label> <input
							class="form-control" type="date" id="id_hasta" name="paramHasta"
							value="2900-01-01">
					</div>
				</div>

				<div class="row" style="margin-top: 2%">
					<div class="col-md-6">
						<label class="control-label" for="id_pais">Pais</label> <select
							id="id_pais" name="paramPais" class='form-control'>
							<option value="-1">[ Todos ]</option>
						</select>
					</div>
					<div class="col-md-6">
						<label class="control-label" for="id_modalidad">Modalidad</label>
						<select id="id_modalidad" name="paramModalidad"
							class='form-control'>
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
									<th style="width: 15%">Nombres</th>
									<th style="width: 15%">Apellidos</th>
									<th style="width: 15%">Telefono</th>
									<th style="width: 10%">Dni</th>
									<th style="width: 15%">Correo</th>
									<th style="width: 15%">Fecha Nacimiento</th>
									<th style="width: 10%">Pais</th>
									<th style="width: 10%">Modalidad</th>
									<th style="width: 10%">Estado</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>

	</div>


	<script type="text/javascript">
	<!-- Agregar aquí -->
		
	 <!-- LISTAR COMBO PAIS-->
		$.getJSON("listaPais", {}, function(data) {
			$.each(data, function(i, item) {
				$("#id_pais").append("<option value="+item.idPais +">" + item.nombre + "</option>");
			});
		});
		
		<!--LISTAR COMBO MODALIDAD-->
		$.getJSON("listaModalidadAlumno", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_modalidad").append($('<option>', {
					value : item.idDataCatalogo,
					text : item.descripcion
				}));
			});
		});
		<!-- REPORTE-->
		$("#id_btn_reporte").click(function() {
			$("#id_form").attr('action', 'reporteAlumnoPdf');
			$("#id_form").submit();
		});
		
		<!--FILTRAR-->

		$("#id_btn_filtra").click(function(){
			var varEstado = $("#id_estado").is(':checked') ? 1 : 0;  
			var varPais = $("#id_pais").val();
			var varModalidad = $("#id_modalidad").val();
			var varNombrec = $("#id_nombrec").val();
			var varFecDesde = $("#id_desde").val() == '' ? '1900-01-01': $("#id_desde").val();
			var varFecHasta = $("#id_hasta").val() == '' ? '9999-01-01': $("#id_hasta").val();
			var varDni =$("#id_dni").val();
			
			console.log(">> varEstado >> " + varEstado );
			console.log(">> varPais >> " + varPais );
			console.log(">> varModalidad >> " + varModalidad );
			console.log(">> varNombrec >> " + varNombrec );
			console.log(">> varFecDesde >> " + varFecDesde);
			console.log(">> varFecHasta >> " + varFecHasta);
			console.log(">> varDni >> " + varDni );
			
			if (valFechaInicioMayFechaFin("#id_desde","#id_hasta")) {
				mostrarMensaje("La fecha hasta es superior a la fecha desde");
			return;}
			
			$.getJSON("consultaAlumno", {
				"estado": varEstado, 
				"idPais": varPais,
				"idModalidad": varModalidad,
				"nombrec": varNombrec,
				"desde": varFecDesde,
				"hasta": varFecHasta, 
				"dni": varDni}, 
				function(data){
				agregarGrilla(data);
			});
		});
		
		<!--GRILLA-->
		function agregarGrilla(lista) {
			$('#id_table').DataTable().clear();
			$('#id_table').DataTable().destroy();
			$('#id_table').DataTable({
				data : lista,
				searching : false,
				ordering : true,
				processing : true,
				pageLength : 10,
				lengthChange : false,
				columns : [ 
					{data : "idAlumno"},
					{data : "nombres"}, 
					{data : "apellidos"},
					{data : "telefono"},
					{data : "dni"},
					{data : "correo"},
					{data : "fechaNacimiento"},
					{data : "pais.nombre"},
					{data: "modalidad.descripcion"},
					{data : function(row, type, val, meta) 
						{var salida = (row.estado == 1)
						? 'Activo' : "Inactivo";
						return salida;},
					className : 'text-center'
				}, ]
			});
		}
	
	
	
	</script>
</body>
</html>