<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <script type="text/javascript" src="js/bootstrap5.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>
    <script type="text/javascript" src="js/validacionRegistroSala.js"></script>

    <link rel="stylesheet" href="css/bootstrap5.css"/>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="css/styleRegistroSala.css"/>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabeceraBootstrap5.jsp"/>
<div class="container" style="margin-top: 4%">
    <h4>Registro Sala</h4>
</div>

<div class="container" style="margin-top: 1%">
    <!-- Agregar aqu� -->
    <form id="id_form" method="post">
        <div class="col-md-12" style="margin-top: 2%">
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="control-label" for="id_tipoSala">Tipo Sala</label>
                    <div class="input-group">
							<span class="input-group-text"><i
                                    class="bi bi-box2-heart-fill"></i></span> <select id="id_tipoSala"
                                                                                      name="tipoSala.idDataCatalogo"
                                                                                      class='form-control'>
                        <option value="">[Seleccione]</option>
                    </select>
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label class="control-label" for="id_numeroSala">N&uacute;mero
                        de Sala</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-boxes"></i></span><input
                            class="form-control" type="text" id="id_numeroSala"
                            name="numero" autocomplete="off"
                            placeholder="Ingrese el n&uacute;mero">
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="form-group col-md-4">
                    <label class="control-label" for="id_piso">Piso</label>
                    <div class="input-group">
							<span class="input-group-text"><i
                                    class="bi bi-bar-chart-steps"></i></span> <input class="form-control"
                                                                                     type="text" id="id_piso"
                                                                                     name="piso"
                                                                                     placeholder="Ingrese piso 1,2,...,21">
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label" for="id_nroAlumnos">N&uacute;mero
                        de Alumnos</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-people"></i></span><input
                            class="form-control" type="text" id="id_nroAlumnos"
                            name="numAlumnos" placeholder="Ingrese el n&uacute;mero">
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label" for="id_sede">Sede</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-buildings"></i></span>
                        <select id="id_sede" name="sede.idDataCatalogo"
                                class='form-control'>
                            <option value="">[Seleccione]</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="form-group col-md-12">
                    <label class="control-label" for="id_recursos">Recursos</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-box-seam"></i></span><input
                            class="form-control" type="text" id="id_recursos"
                            name="recursos" autocomplete="off"
                            placeholder="Ingrese los recursos">
                    </div>
                    <div class="text-right">
                        <span class="valid-text pt-1" id="txaCount"></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12" align="center">
                    <button id="id_registrar" type="button"
                            class="btn btn-primary btn-lg btn-block">Registra
                    </button>
                </div>
            </div>
        </div>
    </form>

    <div class="row">
        <div class="form-group col-md-6" align="center" style="display:none;">
            <button id="id_complete" type="button" class="btn btn-primary">Llenar
                Campos
            </button>
        </div>

    </div>
</div>


<script type="text/javascript">
    $.getJSON("listaTipoSala", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_tipoSala").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
        });
    });

    $.getJSON("listaSede", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_sede").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
        });
    });

    $("#id_registrar").click(function () {

        $('#id_form').bootstrapValidator('validate');
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()) {
            $.ajax({
                type: "POST",
                url: "registrarSalaRegistro",
                data: $('#id_form').serialize(),
                success: function (data) {
                    mostrarMensaje(data.MSG);
                    validator.resetForm();
                    limpiarFormulario();
                },
                error: function () {
                    mostrarMensaje(ERROR_MSG);
                }
            });
        }
    });

    function limpiarFormulario() {
        $("#id_numeroSala").val("")
        $("#id_piso").val("")
        $("#id_recursos").val("")
        $("#id_nroAlumnos").val("")
        $("#id_sede").val("")
        $("#id_tipoSala").val("")
    }

    $("#id_form")
        .bootstrapValidator(
            {
                message: 'El valor no es valido',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    numeroSala: {
                        selector: '#id_numeroSala',
                        validators: {
                            notEmpty: {
                                message: 'Campo Obligatorio'
                            },
                            regexp: {
                                regexp: '^[a-zA-Z]{1}[0-9]{3}$',
                                message: 'Ejm: B393, a989, ... '
                            },
                            remote: {
                                delay: 600,
                                url:
                                    'buscarNumeroSalaRegistro',
                                message:
                                    'El n&uacute;mero ya existe'
                            }
                        }
                    },
                    numAlumnos: {
                        selector: '#id_nroAlumnos',
                        validators:
                            {
                                notEmpty: {
                                    message: 'Campo obligatorio'
                                }
                                ,
                                integer: {
                                    message: 'El valor no es v&aacute;lido'
                                }
                                ,
                                between: {
                                    message: 'Cantidad de alumnos permitidos 1(min.) a 99(m&aacute;x.)',
                                    min:
                                        1,
                                    max:
                                        99
                                }
                            }
                    }
                    ,
                    piso: {
                        selector: '#id_piso',
                        validators:
                            {
                                notEmpty: {
                                    message: 'Campo Obligatorio'
                                }
                                ,
                                between: {
                                    message: 'Pisos permitidos 1(min.) a 99 (m&aacute;x.)',
                                    min:
                                        1,
                                    max:
                                        99
                                }
                                ,
                                integer: {
                                    message: 'El valor no es v&aacute;lido'
                                }
                                ,
                            }
                    }
                    ,
                    recursos: {
                        selector: '#id_recursos',
                        validators:
                            {
                                notEmpty: {
                                    message: 'Campo Obligatorio'
                                }
                                ,
                                stringLength: {
                                    max: 45,
                                    min:
                                        2,
                                    message:
                                        'Caracteres permitidos 2(min.) a 45 (max.)'
                                }
                            }
                    }
                    ,
                    sede: {
                        selector: '#id_sede',
                        validators:
                            {
                                notEmpty: {
                                    message: 'Campo Obligatorio'
                                }
                            }
                    }
                    ,
                    tipoSala: {
                        selector: '#id_tipoSala',
                        validators:
                            {
                                notEmpty: {
                                    message: 'Campo Obligatorio'
                                }
                            }
                    }
                }
            })
    ;
</script>
</body>
</html>