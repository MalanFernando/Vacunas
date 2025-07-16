<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard Administrador</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<div class="container">
    <h1>Bienvenido, Administrador <c:out value="${usuario.nombre}"/></h1>

    <div class="menu">
        <a href="usuarios.jsp" class="btn">Gestionar Usuarios</a>
        <a href="soporte.jsp" class="btn">Soporte</a>
        <a href="../LogoutController" class="btn">Cerrar Sesión</a>
    </div>

    <div class="stats">
        <div class="stat-card">
            <h3>Usuarios Registrados</h3>
            <p>${totalUsuarios}</p>
        </div>
        <div class="stat-card">
            <h3>Médicos Registrados</h3>
            <p>${totalDoctores}</p>
        </div>
        <div class="stat-card">
            <h3>Vacunas Registradas</h3>
            <p>${totalVacunas}</p>
        </div>
    </div>
</div>
</body>
</html>