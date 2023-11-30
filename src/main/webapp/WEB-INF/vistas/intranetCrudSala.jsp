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
    <link rel="stylesheet" href="css/bootstrapValidator.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <title>Intranet</title>
    <style>
        .navbar {

        }

        .close {
            padding: 1rem;
        }

        .close:hover {
            background: rgba(255, 255, 255, 0.56);
            border-radius: 1rem;
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="intranetCabecera.jsp"/>
</header>


<div class="container" style="margin-top: 4%">
    <!-- Agregar aqu -->
    <h3>Gesti&oacute;n de Salas</h3>
    <div class=" col-md-12 ">

        <div class="row">
            <div class="col-md-6 col-sm-12 col-mb-3">
                <input class="form-control" id="id_txt_filtro" name="filtro"
                       placeholder="Ingrese el Numero o Recurso" type="text" maxlength="30"/>
            </div>
            <div class="col-md-3 col-sm-6 col-mb-3">
                <button type="button" class="btn btn-primary btn-block " id="id_btn_filtrar">Filtra</button>
            </div>

            <div class="col-md-3 col-sm-6 col-mb-3">
                <button type="button" data-toggle='modal'
                        data-target="#id_div_modal_registra" class='btn btn-success btn-block '>+Nuevo
                </button>
            </div>
        </div>
        <div class="row" style="padding-top:3rem;">
            <div class="col-md-12">
                <div class="content table-responsive-md">
                    <table id="id_table" class="table  table-hover  table-dark ">
                        <thead>
                        <tr>
                            <th style="width: 5%">ID</th>
                            <th style="width: 25%">Tipo Sala</th>
                            <th style="width: 3%">N&uacute;mero</th>
                            <th style="width: 5%">Piso</th>
                            <th style="width: 10%">N&uacute;mero de Alumnos</th>
                            <th style="width: 22%">Recursos</th>
                            <th style="width: 10%">Sede</th>
                            <th style="width: 10%"></th>
                            <th style="width: 10%"></th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="modal animate__animated animate__bounceIn" id="id_div_modal_registra">
        <div class="modal-dialog" style="width: 60%">
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">
                    <button type="button" class="close" data-dismiss="modal">&times;
                    </button>
                    <h4 class="text-center"><span class="glyphicon glyphicon-ok-sign"></span> Registro - Salas</h4>
                </div>
                <div class="modal-body" style="padding: 20px 10px;">
                    <form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal" method="post">
                        <div class="panel-group" id="steps_reg">
                            <!-- Step 1 -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-center"><a data-toggle="collapse" data-parent="#steps"
                                                                           href="#stepOne">Datos de Sala</a></h4>
                                </div>
                                <div id="stepOne_reg" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_tipoSala">Tipo
                                                Sala</label>
                                            <div class="input-group col-lg-8">
                                                <span class="input-group-addon"><i
                                                        class="bi bi-box2-heart-fill"></i></span>
                                                <select
                                                        id="id_reg_tipoSala"
                                                        name="tipoSala.idDataCatalogo"
                                                        class='form-control'>
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-lg-3 control-label" for="id_reg_numeroSala">N&uacute;mero
                                                de
                                                Sala</label>
                                            <div class="input-group col-lg-8 ">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-boxes"></i></span><input
                                                    class="form-control" type="text" id="id_reg_numeroSala"
                                                    name="numero" autocomplete="off"
                                                    placeholder="Ingrese el n&uacute;mero">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="control-label col-lg-3" for="id_reg_piso">Piso</label>
                                            <div class="input-group col-lg-8">
                                                <span class="input-group-addon">
                                                    <i class="bi bi-bar-chart-steps"></i>
                                                </span>
                                                <input class="form-control"
                                                       type="text" id="id_reg_piso"
                                                       name="piso" autocomplete="off"
                                                       placeholder="Ingrese piso 1,2,...,21">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="id_reg_nroAlumnos">N&uacute;mero
                                                de Alumnos</label>
                                            <div class="input-group col-lg-8">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-people"></i></span><input
                                                    class="form-control" type="text" id="id_reg_nroAlumnos"
                                                    autocomplete="off"
                                                    name="numAlumnos" placeholder="Ingrese el n&uacute;mero">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="id_reg_sede">Sede</label>
                                            <div class="input-group col-lg-8">
                                                     <span class="input-group-addon"><i
                                                             class="bi bi-buildings"></i></span>
                                                <select id="id_reg_sede" name="sede.idDataCatalogo"
                                                        class='form-control'>
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3"
                                                   for="id_reg_recursos">Recursos</label>
                                            <div class="input-group col-lg-8">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-box-seam"></i></span><input
                                                    class="form-control" type="text" id="id_reg_recursos"
                                                    name="recursos" autocomplete="off"
                                                    placeholder="Ingrese los recursos">
                                            </div>
                                            <div class="text-right">
                                                <span class="valid-text pt-1" id="txaCount"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <div class="col-md-12" align="center">
                                                    <button type="button" class="btn btn-primary btn-lg"
                                                            id="id_btn_registra">
                                                        REGISTRA
                                                    </button>
                                                </div>
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

    <div class="modal animate__animated animate__bounceIn" id="id_div_modal_actualiza">
        <div class="modal-dialog" style="width: 60%">

            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Modalidad</h4>
                </div>
                <div class="modal-body" style="padding: 20px 10px;">
                    <form id="id_form_actualiza" accept-charset="UTF-8" class="form-horizontal" method="post">
                        <div class="panel-group" id="steps_act">
                            <!-- Step 1 -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title text-center"><a data-toggle="collapse" data-parent="#steps"
                                                                           href="#stepOne_act">Datos de Sala</a></h4>
                                </div>
                                <div id="stepOne_act" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_ID">ID</label>
                                            <div class="col-lg-8">
                                                <input class="form-control" id="id_act_ID" readonly="readonly"
                                                       name="idSala" type="text" maxlength="8"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_act_tipoSala">Tipo
                                                Sala</label>
                                            <div class="input-group col-lg-8">
                                                <span class="input-group-addon"><i
                                                        class="bi bi-box2-heart-fill"></i></span>
                                                <select
                                                        id="id_act_tipoSala"
                                                        name="tipoSala.idDataCatalogo"
                                                        class='form-control'>
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label" for="id_reg_numeroSala">N&uacute;mero
                                                de Sala</label>
                                            <div class="input-group col-lg-8 ">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-boxes"></i></span><input
                                                    class="form-control" type="text" id="id_act_numeroSala"
                                                    name="numero" autocomplete="off" readonly="readonly"
                                                    placeholder="Ingrese el n&uacute;mero">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="control-label col-lg-3" for="id_act_piso">Piso</label>
                                            <div class="input-group col-lg-8">
                                                <span class="input-group-addon">
                                                    <i class="bi bi-bar-chart-steps"></i>
                                                </span>
                                                <input class="form-control"
                                                       type="text" id="id_act_piso"
                                                       name="piso" autocomplete="off"
                                                       placeholder="Ingrese piso 1,2,...,21">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="id_act_nroAlumnos">N&uacute;mero
                                                de Alumnos</label>
                                            <div class="input-group col-lg-8">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-people"></i></span><input
                                                    class="form-control" type="text" id="id_act_nroAlumnos"
                                                    autocomplete="off"
                                                    name="numAlumnos" placeholder="Ingrese el n&uacute;mero">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3" for="id_act_sede">Sede</label>
                                            <div class="input-group col-lg-8">
                                                     <span class="input-group-addon"><i
                                                             class="bi bi-buildings"></i></span>
                                                <select id="id_act_sede" name="sede.idDataCatalogo"
                                                        class='form-control'>
                                                    <option value="">[Seleccione]</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-lg-3"
                                                   for="id_act_recursos">Recursos</label>
                                            <div class="input-group col-lg-8">
                                                    <span class="input-group-addon"><i
                                                            class="bi bi-box-seam"></i></span><input
                                                    class="form-control" type="text" id="id_act_recursos"
                                                    name="recursos" autocomplete="off"
                                                    placeholder="Ingrese los recursos">
                                            </div>
                                            <div class="text-right">
                                                <span class="valid-text pt-1" id="txtCount"></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <div class="col-md-12" align="center">
                                                    <button type="button" class="btn btn-primary btn-lg"
                                                            id="id_btn_actualiza">
                                                        Actualizar
                                                    </button>
                                                </div>
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
    $(function () {
        $.getJSON("buscarNumeroOrRecursosSalaCrud", {"filtro": ''}, function (lista) {
            agregarGrilla(lista);
        });
    });

    $.getJSON("listaTipoSala", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_reg_tipoSala").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
            $("#id_act_tipoSala").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
        });
    });

    $.getJSON("listaSede", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_reg_sede").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
            $("#id_act_sede").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));
        });
    });

    $("#id_btn_filtrar").click(function () {
        var fil = $("#id_txt_filtro").val();
        $.getJSON("buscarNumeroOrRecursosSalaCrud", {"filtro": fil}, function (lista) {
            agregarGrilla(lista);
        });
    });

    $("#id_txt_filtro").on('keypress', function (e) {
        if (e.which == 13) {
            var fil = $("#id_txt_filtro").val();
            $.getJSON("buscarNumeroOrRecursosSalaCrud", {"filtro": fil}, function (lista) {
                agregarGrilla(lista);
            });
        }
    });

    function limpiarFormularioRegistro() {
        $("#id_reg_numeroSala").val("")
        $("#id_reg_piso").val("")
        $("#id_reg_recursos").val("")
        $("#id_reg_nroAlumnos").val("")
        $("#id_reg_sede").val("")
        $("#id_reg_tipoSala").val("")
    }

    $("#id_btn_registra").click(function () {

        $('#id_form_registra').bootstrapValidator('validate');
        var validator = $('#id_form_registra').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()) {
            $.ajax({
                type: "POST",
                url: "insertSalaCrud",
                data: $('#id_form_registra').serialize(),
                success: function (data) {
                    mostrarMensaje(data.MSG);
                    $('#id_div_modal_registra').modal("hide");
                    limpiarFormularioRegistro();
                    validator.resetForm();
                    agregarGrilla(data.lista);
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
                url: "updateSalaCrud",
                data: $('#id_form_actualiza').serialize(),
                success: function (data) {
                    mostrarMensaje(data.MSG);
                    $('#id_div_modal_actualiza').modal("hide");

                    limpiarFormularioRegistro();
                    agregarGrilla(data.lista);
                },
                error: function () {
                    mostrarMensaje(MSG_ERROR);
                }
            });
        }
    });


    function agregarGrilla(lista) {
        $('#id_table').DataTable().clear();
        $('#id_table').DataTable().destroy();
        $('#id_table').DataTable({
            data: lista,
            searching: false,
            ordering: true,
            processing: true,
            pageLength: 10,
            lengthChange: false,
            columns: [
                {data: "idSala"},
                {data: "tipoSala.descripcion"},
                {data: "numero"},
                {data: "piso"},
                {data: "numAlumnos"},
                {data: "recursos"},
                {data: "sede.descripcion"},
                {
                    data: function (row, type, val, meta) {
                        var salida = '<button type="button" style="width: 90px" class="btn btn-info btn-sm" onclick="editar(\'' + row.idSala + '\',\'' + row.numero + '\',\'' + row.piso + '\',\'' + row.numAlumnos + '\',\'' + row.recursos + '\',\'' + row.tipoSala.idDataCatalogo + '\',\'' + row.sede.idDataCatalogo + '\')">Editar</button>';
                        return salida;
                    }, className: 'text-center'
                },
                {
                    data: function (row, type, val, meta) {
                        var salida = '<button type="button" style="width: 90px" class="btn btn-warning btn-sm" onclick="accionEliminar(\'' + row.idSala + '\')">' + (row.estado == 1 ? 'Activo' : 'Inactivo') + '</button>';
                        return salida;
                    }, className: 'text-center'
                },
            ],
            createdRow: function (row) {
                var numeroCell = $('td:eq(2)', row);
                numeroCell.text(numeroCell.text().toUpperCase());
            }
        });
    }

    function editar(id, numeroSala, piso, numAlumnos, recursos, idTipoSala, idSede) {
        $('#id_act_ID').val(id);
        $('#id_act_numeroSala').val(numeroSala);
        $('#id_act_piso').val(piso);
        $('#id_act_nroAlumnos').val(numAlumnos);
        $('#id_act_recursos').val(recursos);
        $('#id_act_tipoSala').val(idTipoSala);
        $('#id_act_sede').val(idSede);
        $('#id_div_modal_actualiza').modal("show");
    }

    function accionEliminar(id) {
        $.ajax({
            type: "POST",
            url: "cambiarEstadoSalaCrud",
            data: {"idSala": id},
            success: function (data) {
                agregarGrilla(data.lista);
            },
            error: function () {
                mostrarMensaje(MSG_ERROR);
            }
        });
    }
</script>

<script type="text/javascript">
    $('#id_form_registra').bootstrapValidator(
        {
            message: 'El valor no es valido',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                numeroSala: {
                    selector: '#id_reg_numeroSala',
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
                                'buscarNumeroSalaCrud',
                            message:
                                'El n&uacute;mero ya existe'
                        }
                    }
                },
                numAlumnos: {
                    selector: '#id_reg_nroAlumnos',
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
                    selector: '#id_reg_piso',
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
                    selector: '#id_reg_recursos',
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
                },
                sede: {
                    selector: '#id_reg_sede',
                    validators:
                        {
                            notEmpty: {
                                message: 'Campo Obligatorio'
                            }
                        }
                },
                tipoSala: {
                    selector: '#id_reg_tipoSala',
                    validators:
                        {
                            notEmpty: {
                                message: 'Campo Obligatorio'
                            }
                        }
                }
            }
        });
</script>
<script type="text/javascript">
    $('#id_form_actualiza').bootstrapValidator(
        {
            message: 'El valor no es valido',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                numeroSala: {
                    selector: '#id_act_numeroSala',
                    validators: {
                        notEmpty: {
                            message: 'Campo Obligatorio'
                        },
                        regexp: {
                            regexp: '^[a-zA-Z]{1}[0-9]{3}$',
                            message: 'Ejm: B393, a989, ... '
                        }
                    }
                },
                numAlumnos: {
                    selector: '#id_act_nroAlumnos',
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
                },
                piso: {
                    selector: '#id_act_piso',
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
                },
                recursos: {
                    selector: '#id_act_recursos',
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
                },
                sede: {
                    selector: '#id_act_sede',
                    validators:
                        {
                            notEmpty: {
                                message: 'Campo Obligatorio'
                            }
                        }
                },
                tipoSala: {
                    selector: '#id_act_tipoSala',
                    validators:
                        {
                            notEmpty: {
                                message: 'Campo Obligatorio'
                            }
                        }
                }
            }
        });
</script>
</body>
</html>