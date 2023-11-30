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
	<div class="container" style="margin-top: 4%">
		<h4>CRUD Editorial</h4>
	</div>

	<div class="container" style="margin-top: 1%">

		<div class="col-md-23">

			<div class="row" style="height: 70px">
				<div class="col-md-4">
					<input class="form-control" id="id_txt_filtro" name="filtro"
						placeholder="Ingrese la raz�n social" type="text" maxlength="30" />
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="id_btn_filtrar"
						style="width: 150px">FILTRA</button>
				</div>
				<div class="col-md-2">
					<button type="button" data-toggle='modal'
						data-target="#id_div_modal_registra" class='btn btn-success'
						style="width: 150px">REGISTRA</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="content">

						<table id="id_table" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th style="width: 8%">ID</th>
									<th style="width: 18%">Raz�n Social</th>
									<th style="width: 25%">Direcci�n</th>
									<th style="width: 13%">RUC</th>
									<th style="width: 16%">Fecha de Creaci�n</th>
									<th style="width: 16%">Pa�s</th>
									<th style="width: 10%">Actualiza</th>
									<th style="width: 10%">Elimina</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="id_div_modal_registra">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de
							Editorial
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraActualizaCrudEditorial" class="form-horizontal"
							method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos de Editorial</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_razSocial">Raz�n
													Social</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_reg_razSocial"
														name="razonSocial" placeholder="Ingrese la raz�n social"
														type="text" maxlength="20" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_direccion">Direcci�n</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_reg_direccion"
														name="direccion" placeholder="Ingrese la direcci�n"
														type="text" maxlength="40" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_ruc">RUC</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_reg_ruc" name="ruc"
														placeholder="Ingrese el RUC" type="text" maxlength="11" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_fecha">Fecha
													de Creaci�n</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_reg_fecha"
														name="fechaCreacion" type="date" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_pais">Pa�s</label>
												<div class="col-lg-3">
													<select id="id_reg_pais" name="pais" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="button" class="btn btn-primary"
														id="id_btn_registra">REGISTRAR</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="id_div_modal_actualiza">
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Actualiza
							Editorial
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="registraActualizaCrudEditorial" class="form-horizontal"
							method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos de Editorial</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_idEditorial">ID</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_idEditorial" readonly="readonly"
														name="idEditorial" type="text" maxlength="8" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_razSocial">Raz�n
													Social</label>
												<div class="col-lg-8">
													<input class="form-control" id="id_act_razSocial"
														name="razonSocial" placeholder="Ingrese la raz�n social"
														type="text" maxlength="20" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_direccion">Direcci�n</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_act_direccion"
														name="direccion" placeholder="Ingrese la direcci�n"
														type="text" maxlength="40" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_ruc">RUC</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_act_ruc" name="ruc"
														placeholder="Ingrese el RUC" type="text" maxlength="11" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_fecha">Fecha
													de Creaci�n</label>
												<div class="col-lg-3">
													<input class="form-control" id="id_act_fecha"
														name="fechaCreacion" type="date" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_pais">Pa�s</label>
												<div class="col-lg-3">
													<select id="id_act_pais" name="pais" class='form-control'>
														<option value=" ">[Seleccione]</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="button" class="btn btn-primary"
														id="id_btn_actualiza">ACTUALIZAR</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
	<!-- Agregar aqu� -->
	$.getJSON("listaPais", {}, function(data){
		$.each(data, function(i,item){
			$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
			$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		});
	});
	
	$("#id_btn_filtrar").click(function(){
		var fil=$("#id_txt_filtro").val();
		$.getJSON("consultaCrudEditorial",{"filtro":fil}, function (lista){
			agregarGrilla(lista);
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
				pageLength: 7,
				lengthChange: false,
				columns:[
					{data: "idEditorial"},
					{data: "razonSocial"},
					{data: "direccion"},
					{data: "ruc"},
					{data: "fechaCreacion"},
					{data: "pais.nombre"},
					{data: function(row, type, val, meta){
						var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idEditorial + '\',\'' + row.razonSocial +'\',\'' + row.direccion  +'\',\'' + row.ruc + '\',\'' + row.fechaCreacion + '\',\'' + row.pais.idPais + '\')">Editar</button>';
						return salida;
					},className:'text-center'},	
					
					{data: function(row, type, val, meta){
					    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idEditorial + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
						return salida;
					},className:'text-center'},													
				]                                     
		    });
	}
	
	function accionEliminar(id){	
	    $.ajax({
	          type: "POST",
	          url: "eliminaCrudEditorial", 
	          data: {"id":id},
	          success: function(data){
	        	  agregarGrilla(data.lista);
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	     });
	}
	
	$("#id_btn_registra").click(function () {
	    var validator = $('#id_form_registra').data('bootstrapValidator');
	    validator.validate();

	    if (validator.isValid()) {
	        $.ajax({
	            type: "POST",
	            url: "registraCrudEditorial",
	            data: $('#id_form_registra').serialize(),
	            success: function (data) {
	            	agregarGrilla(data.lista);
	                $('#id_div_modal_registra').modal("hide");
	                mostrarMensaje(data.MSG);
	                limpiarFormularioRegistro();
	                validator.resetForm();
	               
	            },
	            error: function () {
	                mostrarMensaje(MSG_ERROR);
	            }
	        });
	    }
	});

	$("#id_btn_actualiza").click(function () {
	    var validator = $('#id_form_actualiza').data('bootstrapValidator');
	    validator.validate();

	    if (validator.isValid()) {
	        $.ajax({
	            type: "POST",
	            url: "actualizaCrudEditorial",
	            data: $('#id_form_actualiza').serialize(),
	            success: function (data) {
	            	agregarGrilla(data.lista);
	                $('#id_div_modal_actualiza').modal("hide");
	                mostrarMensaje(data.MSG);
	               
	            },
	            error: function () {
	                mostrarMensaje(MSG_ERROR);
	            }
	        });
	    }
	});
	
	function editar(id, razonSocial, direccion, ruc, fechaCreacion, idPais) {
	    $('#id_act_idEditorial').val(id);
	    $('#id_act_razSocial').val(razonSocial);
	    $('#id_act_direccion').val(direccion);
	    $('#id_act_ruc').val(ruc);
	    $('#id_act_fecha').val(fechaCreacion);
	    $('#id_act_pais').val(idPais);
	    $('#id_div_modal_actualiza').modal("show");
	}

	function limpiarFormularioRegistro() {
	    $("#id_reg_razSocial").val("");
	    $("#id_reg_direccion").val("");
	    $("#id_reg_ruc").val("");
	    $("#id_reg_fecha").val("");
	    $("#id_reg_pais").val(' ');
	}
	
	$('#id_form_registra').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	"razonSocial":{
	    		selector : '#id_reg_razSocial',
	    		validators: {
	    			notEmpty: {
	    				message: 'La raz�n social es un campo obligatorio'
	    			},
	    			stringLength:{
	    				message:'La raz�n social es de 2 a 20 caracteres',
	    				min: 2,
	    				max: 20
	    			},
	    			remote:{
						delay: 1000,
						url: 'buscaEditorialRazSocialRucRegistro',
						message:'La raz�n social ya existe',
						data:{
							razonSocial:function(){
								return $('#id_reg_razSocial').val();
							},
							ruc: function(){
								return $('#id_reg_ruc').val();
							}
						},
					}
	    		
	    		}
	    	},
	    	
	    	"direccion": {
	    		selector : '#id_reg_direccion',
	            validators: {
	            	notEmpty: {
	                    message: 'La direcci�n es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'La direcci�n es de 2 a 40 caracteres',
	                	min : 2,
	                	max : 40
	                },
	            }
	    	},
	    	"ruc" : {
				selector : '#id_reg_ruc',
				validators : {
					notEmpty : {
						message : 'El RUC es un campo obligatorio'
					},
					 regexp:{
						regexp: '^[0-9]{11}$',
						message:'Debe contener 11 n�meros'
					},
					remote:{
						delay: 1000,
						url: 'buscaEditorialRazSocialRucRegistro',
						message:'El RUC ya existe',
						data:{
							razonSocial:function(){
								return $('#id_reg_razSocial').val();
							},
							ruc: function(){
								return $('#id_reg_ruc').val();
							}
						},
					}
				}
			},
			"fechaCreacion": {
        		selector : '#id_reg_fecha',
                validators: {
                	notEmpty: {
                        message: 'La fecha de creaci�n es un campo obligatorio'
                    },
                }
            },
			"pais.idPais": {
	    		selector : '#id_reg_pais',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s es un campo obligatorio'
	                }
	            }
	    	},
	    }
	});
	
	
	$('#id_form_actualiza').bootstrapValidator({
		message: 'This value is not valid',
		feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	"razonSocial":{
	    		selector : '#id_act_razSocial',
	    		validators: {
	    			notEmpty: {
	    				message: 'La raz�n social es un campo obligatorio'
	    			},
	    			stringLength:{
	    				message:'La raz�n social es de 2 a 20 caracteres',
	    				min: 2,
	    				max: 20
	    			},
	    			remote:{
						delay: 1000,
						url: 'buscaEditorialRazSocialRucActualiza',
						message:'La raz�n social ya existe',
						data:{
							razonSocial:function(){
								return $('#id_act_razSocial').val();
							},
							ruc: function(){
								return $('#id_act_ruc').val();
							},
							idEditorial: function() {
			                    return $('#id_act_idEditorial').val();
			                }
						},
					}
	    		
	    		}
	    	},
	    	
	    	"direccion": {
	    		selector : '#id_act_direccion',
	            validators: {
	            	notEmpty: {
	                    message: 'La direcci�n es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'La direcci�n es de 2 a 40 caracteres',
	                	min : 2,
	                	max : 40
	                },
	            }
	    	},
	    	"ruc" : {
				selector : '#id_act_ruc',
				validators : {
					notEmpty : {
						message : 'El RUC es un campo obligatorio'
					},
					 regexp:{
						regexp: '^[0-9]{11}$',
						message:'Debe contener 11 n�meros'
					},
					remote:{
						delay: 1000,
						url: 'buscaEditorialRazSocialRucActualiza',
						message:'El RUC ya existe',
						data:{
							razonSocial:function(){
								return $('#id_act_razSocial').val();
							},
							ruc: function(){
								return $('#id_act_ruc').val();
							},
							idEditorial: function() {
			                    return $('#id_act_idEditorial').val();
			                }
						},
					}
				}
			},
			"fechaCreacion": {
        		selector : '#id_act_fecha',
                validators: {
                	notEmpty: {
                        message: 'La fecha de creaci�n es un campo obligatorio'
                    },
                }
            },
			"pais.idPais": {
	    		selector : '#id_act_pais',
	            validators: {
	            	notEmpty: {
	                    message: 'El pa�s es un campo obligatorio'
	                }
	            }
	    	},
	    }
	});	
		
	</script>
</body>
</html>