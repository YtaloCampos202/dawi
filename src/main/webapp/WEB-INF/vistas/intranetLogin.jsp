<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Intranet</title>
<style>
.form-box {
	border-radius: 9px;
	padding: 2rem 0;
	background: #eeeeee;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3)
		0px 1px 3px -1px;
}

.form-top {
	background: #eeeeee;
}

img {
	border-radius: 50%;
	box-shadow: rgba(9, 30, 66, 0.25) 0px 4px 8px -2px,
		rgba(9, 30, 66, 0.08) 0px 0px 0px 1px;
}
</style>
</head>
<body>


	<div class="top-content">
		<div class="inner-bg">
			<div class="container">

				<c:if test="${requestScope.mensaje != null}">
					<div class="alert alert-danger fade in" id="success-alert">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${requestScope.mensaje}</strong>
					</div>
				</c:if>
				<div class="row">

					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-center" align="center">
								<img alt="" src="imagen/chico.png" width="100rem" align="center">
							</div>
							<div class="form-top-left">

								<h3>Ingreso al Sistema de Intranet</h3>
								<p>Ingrese su Usuario y Contrase&#241;a:</p>
							</div>
						</div>
						<div class="form-bottom">
							<form id="id_form" action="login" method="post"
								class="login-form">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="bi bi-person-fill"></i>
										</span> <input type="text" name="login" placeholder="Ingrese Usuario"
											class="form-username form-control" id="form-username"
											maxlength="20" value="luis">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="bi bi-key-fill"></i> </span><input type="password"
											name="password" placeholder="Ingrese Contrase&#241;a"
											class="form-password form-control" id="form-password"
											maxlength="20" value="luis">
									</div>
								</div>

								<div align="center">
									<button type="submit" id="validateBtn" class="button-37 btn-block">Ingresar</button>
								</div>


							</form>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>



	<script type="text/javascript">
		$("#success-alert").fadeTo(1000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});
	</script>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#id_form')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													login : {
														validators : {
															notEmpty : {
																message : 'El usuario es obligatorio'
															},
															stringLength : {
																message : 'El usuario es de 3 a 20 caracteres',
																min : 3,
																max : 20
															}
														}
													},
													password : {
														validators : {
															notEmpty : {
																message : 'La contrase&#241;a es obligatorio'
															},
															stringLength : {
																message : 'La contrase&#241;a es de 3 a 20 caracteres',
																min : 3,
																max : 20
															}
														}
													}
												}
											});

							$('#validateBtn').click(function() {
								$('#id_form').bootstrapValidator('validate');
							});
						});
	</script>

</body>
</html>