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
<div class="container" style="margin-top: 4%"><h4>CRUD Tesis</h4></div>

<div class="container" style="margin-top: 1%">
 		<!-- 1 -->
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
												<th style="width: 5%" >ID</th>
												<th style="width: 22%">Título</th>
												<th style="width: 23%">Tema</th>
												<th style="width: 15%">Fecha Creación</th>
												<th style="width: 15%">Alumno</th>
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
		  
		 <!-- 5 -->
	  	 <div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Tesis</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudModalidad" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Tesis</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el Título" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tema">Tema</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_tema" name="tema" placeholder="Ingrese tema" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fecha_creacion">Fecha Creación</label>
		                                        <div class="col-lg-3">
													<input class="form-control" id="id_reg_fecha_creacion" name="fechaCreacion" type="date"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_alumno">Alumno</label>
		                                        <div class="col-lg-3">
													 <select id="id_reg_alumno" name="alumno" class='form-control'>
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
	
</div>

<script type="text/javascript">
<!-- Agregar aquí -->
//=> 6
$.getJSON("listaAlumno", {}, function(data){
	$.each(data, function(i,item){
		$("#id_reg_alumno").append("<option value="+item.idAlumno +">"+ item.nombres +"</option>");
	});
});
		
//=> 2
$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudTesis",{"filtro":fil}, function (lista){
		agregarGrilla(lista);
	});
});

//=> 3
function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idTesis"},
				{data: "titulo"},
				{data: "tema"},
				{data: "fechaCreacion"},
				{data: "alumno.nombres"},
				{data: function(row, type, val, meta){
					var salida='<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\''+row.idTesis + '\',\'' + row.titulo +'\',\'' + row.tema  +'\',\'' + row.fechaCreacion + '\',\'' + row.alumno.idAlumno + '\')">Editar</button>';
					return salida;
				},className:'text-center'},	
				{data: function(row, type, val, meta){
				    var salida='<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idTesis + '\')">'+ (row.estado == 1? 'Activo':'Inactvo') +  '</button>';
					return salida;
				},className:'text-center'},													
			]                                     
	    });
}

//=> 4
function accionEliminar(id){	
    $.ajax({
          type: "POST",
          url: "eliminaCrudTesis", 
          data: {"id":id},
          success: function(data){
        	  agregarGrilla(data.lista);
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
     });
}

//=> 7
$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudTesis", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista);
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});

function limpiarFormulario(){	
	$('#id_reg_titulo').val('');
	$('#id_reg_tema').val('');
	$('#fechaCreacion').val('');
	$('#id_reg_alumno').val(' ');

}
</script>  


<!-- 8 -->
<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	titulo: {
	    		selector : '#id_reg_titulo',
	            validators: {
	                notEmpty: {
	                    message: 'El título es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El descripción es de 2 a 100 caracteres',
	                	min : 2,
	                	max : 100
	                },
	                remote:{
	                	delay: 1000,
	                	url: 'buscaTesisPorTitulo',
	      				message: 'El titulo ya existe'
	                }
	            }
	        },
	        tema: {
	    		selector : '#id_reg_tema',
	            validators: {
	                notEmpty: {
	                    message: 'El tema es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El descripción es de 2 a 40 caracteres',
	                	min : 2,
	                	max : 40
	                },
	            }
	        },
	        fechaCreacion:{
                selector: "#id_reg_fecha_creacion",
                validators:{
                    notEmpty: {
                         message: 'La fecha de creación es obligatorio'
                    }
                }
            },
	        alumno: {
	    		selector : '#id_reg_alumno',
	            validators: {
	            	notEmpty: {
	                    message: 'Alumno es un campo obligatorio'
	                },
	            }
	        },	
        }   
    });
</script>
 		
</body>
</html>