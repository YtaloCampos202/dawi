<jsp:include page="intranetValida.jsp"/>
<!DOCTYPE html>
<html lang="esS">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="-1"/>
    <meta http-equiv="Cache-Control" content="private"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/global.js"></script>


    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Albert+Sans:ital,wght@0,400;1,600&display=swap"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp"/>

<div class="container mt-5" style="margin-top: 1% ;margin-bottom: 3% ;font-family: 'Albert Sans', sans-serif;">
    <!-- Agregar aqu� -->
    <div class="container" style="margin-top: 6%;font-family: 'Albert Sans', sans-serif;" align="center">
        <h4>Consulta Sala</h4>
    </div>
    <div class="row" style="margin-top: 2%;">
        <div class="col-md-3 "
             style="box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px; padding:30px;">
            <form class="form-inline" id="id_form_filtrar" role="form">
                <h3>Filtros:</h3>
                <div class="row mb-2">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="id_filtro_numero">N&uacute;mero </label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="bi bi-people"></i></span>
                                <input name="numero" type="text" class="form-control" id="id_filtro_numero"
                                       placeholder="Ingrese n&uacute;mero">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row mb-2">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="id_filtro_piso">Piso</label>
                            <div class="input-group">
							<span class="input-group-addon"><i
                                    class="bi bi-bar-chart-steps"></i></span>
                                <input name="piso" type="number" class="form-control" id="id_filtro_piso"
                                       placeholder="Ingrese piso">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="checkbox">
                            <label>
                                <input name="estado" checked id="id_filtro_activo" type="checkbox">Estado Activo
                            </label>
                        </div>
                    </div>
                </div>


                <div class="row mb-2">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="id_filtro_numalumnos">N&uacute;mero Alumnos</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="bi bi-people"></i></span>
                                <input name="numAlumnos" type="number" class="form-control" id="id_filtro_numalumnos"
                                       placeholder="Ingrese n&uacute;mero alumnos">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="id_filtro_recursos">Recursos</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="bi bi-box-seam"></i></span>
                                <input name="recursos" type="text" class="form-control" id="id_filtro_recursos"
                                       placeholder="Ingrese recursos">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-2">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="id_filtro_tiposala">Tipo Sala</label>
                            <br>
                            <div class="input-group">
							<span class="input-group-addon"><i
                                    class="bi bi-box2-heart-fill"></i></span>
                                <select class="form-control" name="idTipoSala" id="id_filtro_tiposala">
                                    <option value="">Seleccionar</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="id_filtro_sede">Sede</label>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="bi bi-buildings"></i></span>
                                <select class="form-control" name="idSede" id="id_filtro_sede">
                                    <option value="">Seleccionar</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div align="center" class="row" style="padding-top: 4%;">
                    <div class="col-md-6">
                        <div class="form-group">
                            <button type="button" id="id_btn_filtrar" class="btn btn-primary" role="button">
                                <i class="bi bi-funnel"></i>
                                Filtrar
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <button type="button" id="id_btn_pdf"  class="btn btn-danger" role="button">
                                <i class="bi bi-filetype-pdf"></i>
                                PDF
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-8 col-md-offset-1 table-responsive"
             style="box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;    ">
            <table id="id_table" class="table table-striped table-bordered table-hover table-condensed">
                <thead style='background-color:#337ab7; color:white'>
                <tr>
                    <th>Id</th>
                    <th>N&uacute;mero</th>
                    <th>Piso</th>
                    <th>N.Alumnos</th>
                    <th>Recursos</th>
                    <th>Estado</th>
                    <th>T.Sala</th>
                    <th>Sede</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    <!-- Agregar aqu� -->
    $.getJSON("listaTipoSala", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_filtro_tiposala").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));

        });
    });

    $.getJSON("listaSede", {}, function (data) {
        $.each(data, function (index, item) {
            $("#id_filtro_sede").append($('<option>', {
                value: item.idDataCatalogo,
                text: item.descripcion
            }));

        });
    });
    
    $(function () {
        $.getJSON("consultaSalaFiltrar", {
            "numero": '',
            "piso": '',
            "recursos": '',
            "numAlumnos": '',
            "idSede": '',
            "idTipoSala": '',

            "estado":$("#id_filtro_activo").is(':checked')
        }, function (data) {
            agregarGrilla(data.LIST);

        });
    });

    $("#id_btn_filtrar").click(function () {
        buscarSalaConsulta();
    });

    function buscarSalaConsulta() {

        var numero = $("#id_filtro_numero").val();
        var piso = $("#id_filtro_piso").val();
        var recursos = $("#id_filtro_recursos").val();
        var numAlumnos = $("#id_filtro_numalumnos").val();
        var idSede = $("#id_filtro_sede").val();
        var idTipoSala = $("#id_filtro_tiposala").val();
        var estado = $("#id_filtro_activo").is(':checked');
        console.log(numero + ":")
        console.log(piso + ":")
        console.log(recursos + ":")
        console.log(numAlumnos + ":")
        console.log(idSede + ":")
        console.log(idTipoSala + ":")
        console.log(estado + ":")
        
        $.getJSON("consultaSalaFiltrar", {
            "numero": numero,
            "piso": piso,
            "recursos": recursos,
            "numAlumnos": numAlumnos,
            "idSede": idSede,
            "idTipoSala": idTipoSala,
            "estado": estado
        }, function (data) {
            if(data.LIST == null){
                mostrarMensaje(data.MSG);
            }else{
            agregarGrilla(data.LIST);}
        });
    }

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
                {data: "idSala", className: 'text-center'},
                {
                    data: function (row, type, val, meta) {
                        var salida = row.numero.toUpperCase();
                        return salida;
                    }, className: 'text-center'
                },
                {data: "piso", className: 'text-center'},
                {data: "numAlumnos"},
                {data: "recursos"},
                {
                    data: function (row, type, val, meta) {
                        var salida = (row.estado == 1) ? 'Activo' : "Inactivo";
                        return salida;
                    }, className: 'text-center'
                },
                {data: "tipoSala.descripcion"},
                {data: "sede.descripcion"}

            ],
            createdRow: function (row) {
                var numeroCell = $('td:eq(2)', row);
                numeroCell.text(numeroCell.text().toUpperCase());
            }
        });
    }
</script>

<script type="text/javascript">
    $("#id_btn_pdf").click(function () {
        buscarSalaConsulta();
        $("#id_form_filtrar").attr('action', 'reporteSalaConsultaPdf');
        $("#id_form_filtrar").submit();
    });
</script>

</body>
</html>