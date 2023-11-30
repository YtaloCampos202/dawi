<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">



    <title>Intranet</title>
</head>
<body>
       
<jsp:include page="intranetCabeceraBootstrap5.jsp" />

<div class="container" style="margin-top: 5%">
<h3>Intranet Sistema</h3>
<br><br>
<h4>Bienvenido Sr(a): ${sessionScope.objUsuario.nombreCompleto}</h4><br>                
<h4>DNI: ${sessionScope.objUsuario.dni}</h4><br>
<h4>Roles:</h4>
	<ul>
        <c:forEach var="x" items="${sessionScope.objRoles}">
            <li>
                   ${x.nombre} 
            </li>
        </c:forEach>
    </ul><br>
</div>

<div class="container" >
<div class="col-md-12" align="center" style="width: 50px; height: 150px" > 
</div>
</div>

    		
</body>
</html>