<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a style="color: white;" class="nav-link" href="verIntranetHome">Home</a>
                    </li>

                    <c:if test="${not empty sessionScope.objMenusTipo1}">
                        <li class="nav-item dropdown">
                            <a  style="color: white;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Registros (PC1)
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown1">
                                <c:forEach var="x" items="${sessionScope.objMenusTipo1}">
                                    <li>
                                        <a class="dropdown-item" href="${x.ruta}">${x.nombre}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${not empty sessionScope.objMenusTipo3}">
                        <li class="nav-item dropdown">
                            <a style="color: white;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                CRUD (PC2)<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown3">
                                <c:forEach var="x" items="${sessionScope.objMenusTipo3}">
                                    <li>
                                        <a class="dropdown-item" href="${x.ruta}"> ${x.nombre} </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${ not empty sessionScope.objMenusTipo2}">
                        <li class="nav-item dropdown">
                            <a style="color: white;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                               Consulta y Reporte (PC3)<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                <c:forEach var="x" items="${sessionScope.objMenusTipo2}">
                                    <li>
                                        <a class="dropdown-item" href="${x.ruta}"> ${x.nombre} </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>

                    <c:if test="${ not empty sessionScope.objMenusTipo4}">
                        <li class="dropdown">
                            <a style="color: white;"  class="nav-link dropdown-toggle" href="#" id="navbarDropdown4" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Transacciones (AP)<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown4">
                                <c:forEach var="x" items="${sessionScope.objMenusTipo4}">
                                    <li>
                                        <a class="dropdown-item" href="${x.ruta}"> ${x.nombre} </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                </ul>

                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a style="color: white;" class="nav-link" href="logout">Salir</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>