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
<div class="container" style="margin-top: 4%"><h4>CRUD Libro</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
		 <div class="col-md-23" >  

				   <div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >Código</th>
												<th style="width: 22%">Título</th>
												<th style="width: 10%">Año</th>
												<th style="width: 15%">Serie</th>
												<th style="width: 10%">Categoría</th>
												<th style="width: 10%">Tipo</th>
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
   
  	 	  	 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el título" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese el código serie" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_anio">Año</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_anio" name="anio" type="text" placeholder="Ingrese el año"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoría</label>
		                                        <div class="col-lg-6">
													 <select id="id_reg_categoria" name="categoriaLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipo">Tipo</label>
		                                        <div class="col-lg-6">
													 <select id="id_reg_tipo" name="tipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRA</button>
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



  	<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                               		 <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_idLibro">Id</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_idLibro" name="idLibro" placeholder="Ingrese el id" type="text" maxlength="20" readonly="readonly"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese el apellido" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_act_anio" name="anio" type="text" placeholder="Ingrese el año"/>
		                                        </div>
		                                    </div>		   
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-6">
													 <select id="id_act_categoria" name="categoriaLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipo">Tipo</label>
		                                        <div class="col-lg-6">
													 <select id="id_act_tipo" name="tipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="button" class="btn btn-primary" id="id_btn_actualiza">ACTUALIZA</button>
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
</div>

<script type="text/javascript">
<!-- Agregar aquí -->
$.getJSON("listaCategoriaDeLibro", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_reg_categoria").append('<option value='+item.idDataCatalogo+">"+item.descripcion+"</option>");
		$("#id_act_categoria").append('<option value='+item.idDataCatalogo+">"+item.descripcion+"</option>");
	});
});
$.getJSON("listaTipoLibroRevista", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_reg_tipo").append('<option value='+item.idDataCatalogo+">"+item.descripcion+"</option>");
		$("#id_act_tipo").append('<option value='+item.idDataCatalogo+">"+item.descripcion+"</option>");
	});
});

$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudLibro",{"filtro":fil}, function (lista){
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
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idLibro"},
				{data: "titulo"},
				{data: "anio"},
				{data: "serie"},
				{data: "categoriaLibro.descripcion"},
				{data: "tipoLibro.descripcion"},
				{
					data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idLibro + '\',\'' + row.titulo +
							'\',\'' + row.anio  +'\',\'' + row.serie + '\',\'' + row.categoriaLibro.idDataCatalogo +'\',\''+ row.tipoLibro.idDataCatalogo + '\')">Editar</button>';			
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' +
				    		row.idLibro + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';		    
					return salida;
				},className:'text-center'
			},													
			],
			createdRow: function(row){
				var numeroCell =$('td:eq(2)',row);
				numeroCell.text(numeroCell.text().toUpperCase());
			}
	    });
}

function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudLibro", 
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
            url: "registraCrudLibro",
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
            url: "actualizaCrudLibro",
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

function editar(id, titulo, anio, serie, categoriaLibro, tipoLibro) {
    $('#id_act_idLibro').val(id);
    $('#id_act_titulo').val(titulo);
    $('#id_act_anio').val(anio);
    $('#id_act_serie').val(serie);
    $('#id_act_categoria').val(categoriaLibro);
    $('#id_act_tipo').val(tipoLibro);
    $('#id_div_modal_actualiza').modal("show");
}

function limpiarFormularioRegistro() {
    $("#id_reg_titulo").val("");
    $("#id_reg_serie").val("");
    $("#id_reg_anio").val("");
    $("#id_reg_categoria").val("");
    $("#id_reg_tipo").val(' ');
}

$('#id_form_registra').bootstrapValidator({
	message: 'This value is not valid',
	feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	"titulo":{
    		selector : '#id_reg_titulo',
    		validators: {
    			notEmpty: {
    				message: 'EL Título es un campo obligatorio'
    			},
    			stringLength:{
    				message:'El Título es de 3 a 50 caracteres',
    				min: 3,
    				max: 100
    			},
    			remote:{
					delay: 1000,
					url: 'buscaLibroTituloSerieRegistro',
					
					message:'La serie ya existe',
					data:{
						titulo:function(){
							return $('#id_reg_titulo').val();
						},
						serie: function(){
							return $('#id_reg_serie').val();
						}
					},
				},
				remote:{
					delay:1000,
					url:'buscaLibroPorTituloos',
					message:'EL Título ya existe'
				}
    		
    		}
    	},
    	
    	"categoriaLibro": {
    		selector : '#id_reg_categoria',
            validators: {
            	notEmpty: {
                    message: 'La Categoría es un campo obligatorio'
                }
            }
    	},
    	"serie" : {
			selector : '#id_reg_serie',
			validators : {
				notEmpty : {
					message : 'El campo serie es obligatorio'
				},
				 regexp:{
					regexp: '^[A-Za-z]{2}\\d{10}$',
					message:'Debe contener 2 letras y 10 números. Ejem: YT1234567891'
				},
				remote:{
					delay: 1000,
					url: 'buscaLibroTituloSerieRegistro',
					message:'La serie ya existe',
					data:{
						titulo:function(){
							return $('#id_reg_titulo').val();
						},
						serie: function(){
							return $('#id_reg_serie').val();
						}
					},
				},
				remote:{
					delay:1000,
					url:'buscaLibroPorSerie',
					message:'EL Serie ya existe'
				}
			}
		},
		"anio":{
			selector: '#id_reg_anio',
			validators:{
				notEmpty:{
					message:'El campo año es obligatorio. Ejem: 2000'
				},
				regexp: {
		            regexp:  /^[0-9]+$/,
		            message: 'Por favor, ingrese solo números en el campo año.'
		        }
				
			}
		},
		"tipoLibro": {
    		selector : '#id_reg_tipo',
            validators: {
            	notEmpty: {
                    message: 'El tipo es un campo obligatorio'
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
    	"titulo":{
    		selector : '#id_act_titulo',
    		validators: {
    			notEmpty: {
    				message: 'EL Título es un campo obligatorio'
    			},
    			stringLength:{
    				message:'El Título es de 3 a 50 caracteres',
    				min: 3,
    				max: 100
    			},
    			remote:{
					delay: 1000,
					url: 'buscaLibroTituloSerieActualiza',
					message:'El titulo ya existe',
					data:{
						titulo:function(){
							return $('#id_act_titulo').val();
						},
						serie: function(){
							return $('#id_act_serie').val();
						},
						idLibro: function() {
		                    return $('#id_act_idLibro').val();
		                }
					},
				},
				remote:{
					delay:1000,
					url:'buscaLibroPorTituloos',
					message:'EL Título ya existe'
				}
    		
    		}
    	},
    	
    	"categoriaLibro": {
    		selector : '#id_act_categoria',
            validators: {
            	notEmpty: {
                    message: 'La Categoría es un campo obligatorio'
                }
            }
    	},
    	"serie" : {
			selector : '#id_act_serie',
			validators : {
				notEmpty : {
					message : 'El campo serie es obligatorio'
				},
				 regexp:{
					regexp: '^[A-Za-z]{2}\\d{10}$',
					message:'Debe contener 2 letras y 10 números. Ejem: YT1234567891'
				},
				remote:{
					delay: 1000,
					url: 'buscaLibroTituloSerieActualiza',
					message:'La serie ya existe',
					data:{
						titulo:function(){
							return $('#id_act_titulo').val();
						},
						serie: function(){
							return $('#id_act_serie').val();
						},
						idLibro: function() {
		                    return $('#id_act_idLibro').val();
		                }
					},
				},
				remote:{
					delay:1000,
					url:'buscaLibroPorSerie',
					message:'La Serie ya existe'
				}
			}
		},
		"anio":{
			selector: '#id_act_anio',
			validators:{
				notEmpty:{
					message:'El campo año es obligatorio. Ejem: 2000'
				},
				regexp: {
		            regexp:  /^[0-9]+$/,
		            message: 'Por favor, ingrese solo números en el campo año.'
		        }
				
			}
		},
		"tipoLibro": {
    		selector : '#id_act_tipo',
            validators: {
            	notEmpty: {
                    message: 'El tipo es un campo obligatorio'
                }
            }
    	},
    }
});




</script>   		
</body>
</html>