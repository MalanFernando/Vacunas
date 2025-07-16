<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
    <h1>Iniciar Sesión</h1>
    <form action="LoginController" method="post">
        <div class="form-group">
            <label for="cedula">Cédula:</label>
            <input type="text" id="cedula" name="cedula" required pattern="[0-9]{10}"
                   title="La cédula debe tener 10 dígitos">
        </div>
        <div class="form-group">
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn">Ingresar</button>
        <a href="forgot-password.jsp" class="link">¿Olvidaste tu contraseña?</a>
    </form>
    <p>¿No tienes una cuenta? <a href="register.jsp">Regístrate aquí</a></p>
</div>
</body>
</html>