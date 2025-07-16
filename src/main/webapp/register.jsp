<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Registro de Usuario</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="container">
  <h1>Registro de Usuario</h1>
  <form action="RegisterController" method="post">
    <div class="form-group">
      <label for="cedula">Cédula:</label>
      <input type="text" id="cedula" name="cedula" required pattern="[0-9]{10}"
             title="La cédula debe tener 10 dígitos">
    </div>
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" id="nombre" name="nombre" required>
    </div>
    <div class="form-group">
      <label for="apellido">Apellido:</label>
      <input type="text" id="apellido" name="apellido" required>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
      <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
      <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
    </div>
    <div class="form-group">
      <label for="password">Contraseña:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
      <label for="confirm_password">Confirmar Contraseña:</label>
      <input type="password" id="confirm_password" name="confirm_password" required>
    </div>
    <button type="submit" class="btn">Registrarse</button>
  </form>
  <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
</div>
</body>
</html>