<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard Médico</title>
    <link rel="stylesheet" href="../styles.css">
    <link rel="stylesheet" href="../css/dashboardStyles.css">
</head>
<body>
<header class="header">
    <nav class="menu">
        <ul class="menu-nav">
            <li class="menu-logo"><span><strong>VACU</strong></span></li>
            <li class="nav-link"><a href="">Acerca de</a></li>
            <li class="nav-link"><a href="">Aprender mas</a></li>
            <li class="nav-link"><a href="">Mapas</a></li>
        </ul>
        <a class="menu-btn" href="register.jsp">Registrate</a>
    </nav>
</header>
<main class="main content-profile">
    <div class="main-welcome">
        <h3>Hola, Dr.
            <c:out value="${usuario.nombre}" />
        </h3>
        <p>Bienvenido al sistema de registro de vacunas.</p>
    </div>
    <section class="main-profile">
        <div class="profile-content">
            <picture>
                <img src="" alt="profile photo">
            </picture>
            <button class="menu-btn editar-btn">Editar perfil</button>
        </div>
        <div class="profile-info">
            <ul class="info-user">
                <li><strong>Nombre:</strong>
                    <c:out value="${usuario.nombre} ${usuario.apellido}" />
                </li>
                <li><strong>Nro. Historia Clinica: </strong></li>
                <li><strong>Direccion:</strong></li>
            </ul>
            <ul class="info-user">
                <li><strong>Cédula:</strong>
                    <c:out value="${usuario.cedula}" />
                </li>
                <li><strong>Edad:</strong></li>
            </ul>
        </div>
    </section>
    <section class="main-data">
        <nav class="data-menu">
            <ul class="menu-info">
                <li><a href="">Informacion</a></li>
                <li><a href="">Esquema de vacuas</a></li>
                <li><a href="">Calendario de vacunas</a></li>
            </ul>
        </nav>
        <section class="data-info">
            <article>
                <h4>Informacion medica</h4>
                <ul>
                    <li><strong>Nombre completo:</strong></li>
                    <li><strong>Fecha de Nacimiento:</strong>
                        <c:out value="${usuario.fechaNacimiento}" />
                    </li>
                    <li><strong>Tipo de sangre:</strong></li>
                    <li><strong>Genero:</strong></li>
                    <li><strong>Talla:</strong></li>
                    <li><strong>Peso:</strong></li>
                    <li><strong>Alergias:</strong></li>
                    <li><strong>Otras enfermedades:</strong></li>
                </ul>
            </article>
            <article>
                <h4>Establecimiento de salud</h4>
                <ul>
                    <li><strong>Provincia:</strong></li>
                    <li><strong>Canton:</strong></li>
                    <li><strong>Parroquia:</strong></li>
                    <li><strong>Zona:</strong></li>
                </ul>
            </article>
            <article>
                <h4>Informacion de pacientes</h4>
                <ul>
                    <li><strong>Pacientes Atendidos: </strong>${totalPacientes}</li>
                    <li><strong>Vacunas Aplicadas: </strong>${vacunasAplicadas}</li>
                </ul>
            </article>
        </section>
    </section>
</main>
<footer class="footer">
    <img src="" alt="logo Instituto">
    <p>Lorem ipsum dolor sit amet consectetur cumque, adipisci ut totam.</p>
</footer>
</body>
</html>