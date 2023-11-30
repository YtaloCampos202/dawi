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
	<div class="container" style="margin-top: 4%">
		<h4>Registro Editorial</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 1%">

				<div class="row">
					<div class="form-group col-md-6">
						<label class="control-label" for="id_nombres">Razón Social</label>
						<input class="form-control" type="text" id="id_razSocial" name="razonSocial" placeholder="Ingrese la razón social">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-6" style="margin-top: 1%">
						<label class="control-label" for="id_apellidos">Dirección</label>
						<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la dirección">
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-6" style="margin-top: 1%">
						<label class="control-label" for="id_telefono">RUC</label>
						<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC" maxlength="11">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-6" style="margin-top: 1%">
						<label class="control-label" for="id_fecha">Fecha Creación</label>
						<input class="form-control" type="date" id="id_fecha" name="fechaCreacion">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-3" style="margin-top: 1%">
						<label class="control-label" for="id_pais">País</label>
						<select id="id_pais" name="pais.idPais" class='form-control'>
								<option value=" ">[Seleccione]</option>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="button" class="btn btn-primary" >Registrar</button>
					</div>
				</div>
			</div>
		</form>
	</div>

<script type="text/javascript">
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$('#id_registrar').click(function (){ 
	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
	if (validator.isValid()){
		$.ajax({
    		type: 'POST',
            url: 'registraEditorial', 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(MSG_ERROR);
            }
    	});
	}   
});


function limpiarFormulario(){
	$("#id_razSocial").val('');
	$("#id_direccion").val('');
	$("#id_ruc").val('');
	$("#id_fecha").val('');
}

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	razonSocial: {
    		selector : '#id_razSocial',
            validators: {
                notEmpty: {
                    message: 'La razón social es un campo obligatorio'
                },
                stringLength :{
                	message:'La razón social es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                },
            }
        },
        direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La dirección es un campo obligatorio'
                },
                stringLength :{
                	message:'El descripción es de 2 a 40 caracteres',
                	min : 2,
                	max : 40
                },
            }
        },
        ruc: {
    		selector : '#id_ruc',
            validators: {
                notEmpty: {
                    message: 'El RUC es un campo obligatorio'
                },
                stringLength :{
                	message:'El RUC es de 11 caracteres',
                	min : 11,
                	max : 11
                },
                remote :{
            	    delay: 1000,
            	 	url: 'buscaPorRucEditorial',
            	 	message: 'El RUC ya existe'
             	}
            }
        },
        fechaCreacion:{
            selector: "#id_fecha",
            validators:{
                notEmpty: {
                     message: 'La fecha es obligatoria'
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
    	
    }   
});

</script>  		
</body>
</html>