<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dashboard Usuario</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<div class="container">
    <h1>Bienvenido, <c:out value="${usuario.nombre}"/></h1>

    <div class="menu">
        <a href="registrar-vacuna.jsp" class="btn">Registrar Vacuna</a>
        <a href="mis-vacunas.jsp" class="btn">Mis Vacunas</a>
        <a href="../LogoutController" class="btn">Cerrar Sesión</a>
    </div>

    <div class="card">
        <h2>Mis Datos</h2>
        <p><strong>Cédula:</strong> <c:out value="${usuario.cedula}"/></p>
        <p><strong>Nombre:</strong> <c:out value="${usuario.nombre} ${usuario.apellido}"/></p>
        <p><strong>Email:</strong> <c:out value="${usuario.email}"/></p>
        <p><strong>Fecha de Nacimiento:</strong> <c:out value="${usuario.fechaNacimiento}"/></p>
    </div>
</div>
</body>
</html>