<jsp:include page="intranetValida.jsp"/>
<!DOCTYPE html>
<html lang="esS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="-1"/>
    <meta http-equiv="Cache-Control" content="private"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp"/>
<div class="container" style="margin-top: 4%">
    <h4>Registro Autor</h4>
</div>

<div class="container" style="margin-top: 1%">
    <!-- Agregar aqu� -->
    <form id="id_form" method="post">
        <div class="col-md-12" style="margin-top: 1%">

            <!-- NOMBRES-->
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="control-label" for="id_nombres">Nombres</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-person-lines-fill"></i>
							</span><input class="form-control" type="text" id="id_nombres"
                                          name="nombres" placeholder="Ingrese los nombres">
                    </div>
                </div>
            </div>

            <!-- APELLIDOS-->
            <div class="row">
                <div class="form-group col-md-6" style="margin-top: 1%">
                    <label class="control-label" for="id_apellidos">Apellidos</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-person-lines-fill"></i>
							</span>
                        <input class="form-control" type="text" id="id_apellidos"
                               name="apellidos" placeholder="Ingrese los apellidos">
                    </div>
                </div>
            </div>

            <!-- FECHA DE NACIMIENTO-->
            <div class="row">
                <div class="form-group col-md-6" style="margin-top: 1%">
                    <label class="control-label" for="id_fecha">Fecha de
                        Nacimiento</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-calendar2-date"></i>
							</span> <input class="form-control" type="date" id="id_fecha"
                                           name="fechaNacimiento">
                    </div>
                </div>
            </div>

            <!-- TELEFONO-->
            <div class="row">
                <div class="form-group col-md-6" style="margin-top: 1%">
                    <label class="control-label" for="id_telefono">Tel�fono</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-telephone"></i>
							</span> <input class="form-control" type="text" id="id_telefono"
                                           name="telefono" placeholder="Ingrese el telefono" maxlength="9">
                    </div>
                </div>
            </div>

            <!-- PAIS-->
            <div class="row">
                <div class="form-group col-md-3" style="margin-top: 1%">
                    <label class="control-label" for="id_pais">Pa�s</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-globe-americas"></i>
							</span> <select id="id_pais" name="pais.idPais" class='form-control'>
                        <option value=" ">[Seleccione]</option>
                    </select>
                    </div>
                </div>

                <!-- GRADO-->
                <div class="form-group col-md-3" style="margin-top: 1%">
                    <label class="control-label" for="id_grado">Grado</label>
                    <div class="input-group">
							<span class="input-group-addon"> <i
                                    class="bi bi-mortarboard-fill"></i>
							</span> <select id="id_grado" name="grado.idDataCatalogo"
                                            class='form-control'>
                        <option value=" ">[Seleccione]</option>
                    </select>
                    </div>
                </div>
            </div>

            <!-- REGISTRAR-->
            <div class="row">
                <div class="form-group col-md-6" align="center"
                     style="margin-top: 3%">

                    <button id="id_registrar" type="button" class="btn btn-primary"
                            class="bi bi-person-fill-add">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                             fill="currentColor" class="bi bi-person-fill-add"
                             viewBox="0 0 16 16">
                            <path
                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"></path>
                            <path
                                    d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"></path>
                        </svg>
                        Registra
                    </button>
                </div>


            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    <!--
    Agregar
    aqu -->

    <!-- LISTAR COMBO PAIS-->
    $.getJSON("listaPais", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_pais").append("<option value=" + item.idPais + ">" + item.nombre + "</option>");
        });
    });

    <!-- LISTAR COMBO GRADO-->
    $.getJSON("listaGradoAutor", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_grado").append("<option value=" + item.idDataCatalogo + ">" + item.descripcion + "</option>");
        });
    });


    <!-- GRLLA BOTON LISTAR "AJAX"-->
    $('#id_registrar').click(function () {
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();


        if (validator.isValid()) {
            $.ajax({
                type: 'POST',
                url: 'registraAutor',
                data: $('#id_form').serialize(),
                success: function (data) {
                    mostrarMensaje(data.MENSAJE);
                    validator.resetForm();
                    limpiarFormulario();
                },
                error: function () {
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }
    });


    <!-- LIMPIEZA DE CAJAS TXT-->
    function limpiarFormulario() {
        $("#id_nombres").val('');
        $("#id_apellidos").val(' ');
        $("#id_fecha").val(' ');
        $("#id_telefono").val(' ');
        $("#id_pais").val(' ');
        $("#id_grado").val(' ');
    }

    <!-- LIMPIEZA DE CAJAS TXT-->


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
                selector: '#id_nombres',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength: {
                        message: 'El nombre es de 3 a 40 caracteres',
                        min: 3,
                        max: 100
                    },
                    remote: {
                        delay: 1000,
                        url: 'buscaPorNombresAutor',
                        message: 'El Nombre ya existe'
                    }
                }
            },

            apellidos: {
                selector: '#id_apellidos',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength: {
                        message: 'El apellido es de 2 a 40 caracteres',
                        min: 3,
                        max: 100
                    },
                    remote: {
                        delay: 1000,
                        url: 'buscaPorApellidosAutor',
                        message: 'El Apellido ya existe'
                    }
                }
            },

            fechaNacimiento: {
                selector: "#id_fecha",
                validators: {
                    notEmpty: {
                        message: 'La fecha es obligatorio'
                    }
                }
            },

            telefono: {
                selector: '#id_telefono',
                validators: {
                    notEmpty: {
                        message: 'El tel�fono es un campo obligatorio'
                    },
                    stringLength: {
                        message: 'El tel�fono es de 9 caracteres',
                        min: 9,
                        max: 9
                    },
                    remote: {
                        delay: 1000,
                        url: 'buscaPorTelefonoAutor',
                        message: 'El Tel�fono ya existe'
                    }
                }
            },


            pais: {
                selector: '#id_pais',
                validators: {
                    notEmpty: {
                        message: 'Pa�s es un campo obligatorio'
                    },
                }
            },

            grado: {
                selector: '#id_grado',
                validators: {
                    notEmpty: {
                        message: 'Grado es un campo obligatorio'
                    },
                }
            },

        }
    });
</script>
</body>
</html>