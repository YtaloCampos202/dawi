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
<div class="container" style="margin-top: 4%"><h4>Registro Alumno</h4></div>

<div class="container" style="margin-top: 1%">
	
	<form  id="id_form" method="post"> 
	
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_nombres">Nombres</label>
					<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese nombres">
				</div>
				
				<div class="form-group col-md-6">
					<label class="control-label" for="id_apellidos">Apellidos</label>
					<input class="form-control" id="id_apellidos" name="apellidos" placeholder="Ingrese apellidos" type="text"/>
				</div>				
			</div>
			
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_telefono">Teléfono</label>
					<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese teléfono">
				</div>
				
				<div class="form-group col-md-6">
					<label class="control-label" for="id_dni">DNI</label>
					<input class="form-control" id="id_dni" name="dni" placeholder="Ingrese DNI" type="text"/>
				</div>				
			</div>
			
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_correo">Correo</label>
					<input class="form-control" type="text" id="id_correo" name="correo" placeholder="Ingrese correo">
				</div>
				
				<div class="form-group col-md-6">
					<label class="control-label" for="id_pais">Pais</label>
					<select id="id_pais" name="pais.idPais" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
				</div>				
			</div>

				<div class="row">
					<div class="form-group col-md-6">
						<label class="control-label" for="id_fecha">Fecha de
							Nacimiento</label>
						<input class="form-control" type="date" id="id_fecha"
							name="fechaNacimiento" placeholder="Ingrese la fecha"
							maxlength="100">
					</div>
					<div class="form-group col-md-6">
					<label class="control-label" for="id_modalidad">Modalidad</label>
					<select id="id_modalidad" name="modalidad.idDataCatalogo" class='form-control'>
						<option value=" ">[Seleccione]</option>    
					</select>
				</div>
					
				</div>


				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="button" class="btn btn-primary">Registrar</button>
					</div>
				</div>
			</div>
	</form>
	
</div>

<script type="text/javascript">
<!-- Agregar aquí -->

<!--listar cbo pais-->
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

<!--listar cbo modalidad-->
$.getJSON("listaModalidadAlumno", {}, function(data) {
	$.each(data, function(index, item) {
		$("#id_modalidad").append($('<option>', {
			value : item.idDataCatalogo,
			text : item.descripcion
		}));
	});
});

<!--Registrar-->
$("#id_registrar").click(function() {

	$('#id_form').bootstrapValidator('validate');
	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()) {
		$.ajax({
			type : "POST",
			url : "registraAlumno",
			data : $('#id_form').serialize(),
			success : function(data) {
				mostrarMensaje(data.MENSAJE);
				validator.resetForm();
				limpiarFormulario();
			},
			error : function() {
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
});

<!--limpieza formulario-->
function limpiarFormulario(){
	$("#id_nombres").val('');
	$("#id_apellidos").val(' ');
	$("#id_telefono").val(' ');
	$("#id_dni").val(' ');
	$("#id_correo").val(' ');
	$("#id_fecha").val('');
	$("#id_pais").val(' ');
	$("#id_modalidad").val(' ');
}


<!-- VALIDACIONES A LAS CAJAS TXT-->
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombres: {
    		selector : '#id_nombres',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 caracteres',
                	min : 3,
                	max : 100
                }, 
                remote :{
            	    delay: 1000,
            	 	url: 'buscaAlumnoPorNombre',
            	 	message: 'El nombre ya exite'
             	},
            }
        },
        
        apellidos: {
    		selector : '#id_apellidos',
            validators: {
            	notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El apellido es de 2 a 40 caracteres',
                	min : 3,
                	max : 100
                },
            }
        },
        
        telefono: {
    		selector : '#id_telefono',
            validators: {
                notEmpty: {
                    message: 'El teléfono es un campo obligatorio'
                },
                stringLength :{
                	message:'El teléfono es de 9 caracteres',
                	min : 9,
                	max : 9
                },
           }
        },
        
        dni: {
    		selector : '#id_dni',
            validators: {
                notEmpty: {
                    message: 'El DNI es un campo obligatorio'
                },
                stringLength :{
                	message:'El DNI es de 8 caracteres',
                	min : 8,
                	max : 8
                },
                remote :{
            	    delay: 1000,
            	 	url: 'buscaAlumnoPorDni',
            	 	message: 'El Dni ya exite'
             	},
            }
        },
        
        correo: {
    		selector : '#id_correo',
            validators: {
                notEmpty: {
                    message: 'El tema es un campo obligatorio'
                },
                regexp :{
                	regexp:'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                	message:'Debe de tener formato correo, alguien@lugar.com',
                },
                
            }
        },
        fechaNacimiento:{
            selector: "#id_fecha",
            validators:{
                notEmpty: {
                     message: 'La fecha es obligatorio'
                }
            }
        },
        
        pais: {
    		selector : '#id_pais',
            validators: {
            	notEmpty: {
                    message: 'País es un campo obligatorio'
                },
            }
        },
        
        modalidad: {
    		selector : '#id_modalidad',
            validators: {
            	notEmpty: {
                    message: 'Modalidad es un campo obligatorio'
                },
            }
        },
	 }   
});

</script>   		
</body>
</html>