<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard Médico</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<div class="container">
    <h1>Bienvenido, Dr. <c:out value="${usuario.apellido}"/></h1>

    <div class="menu">
        <a href="pacientes.jsp" class="btn">Mis Pacientes</a>
        <a href="vacunas.jsp" class="btn">Registros de Vacunas</a>
        <a href="../LogoutController" class="btn">Cerrar Sesión</a>
    </div>

    <div class="stats">
        <div class="stat-card">
            <h3>Pacientes Atendidos</h3>
            <p>${totalPacientes}</p>
        </div>
        <div class="stat-card">
            <h3>Vacunas Aplicadas</h3>
            <p>${vacunasAplicadas}</p>
        </div>
    </div>
</div>
</body>
</html>